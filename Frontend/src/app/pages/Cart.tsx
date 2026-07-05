/**
 * Cart.tsx - Carrito de Compras del Cliente
 *
 * Página donde el cliente revisa y confirma su pedido online antes de pagar.
 * Los productos se guardan en localStorage con la clave 'storeCart'.
 *
 * FLUJO DE COMPRA:
 * 1. Cliente agrega productos desde Store.tsx → se guardan en localStorage
 * 2. Entra al carrito y ve su lista de productos
 * 3. Puede cambiar cantidades o eliminar ítems
 * 4. Hace clic en "Proceder al Pago" → modal de selección de método de pago
 * 5. Confirma → se crea la venta en el backend con pedido_online: true
 * 6. El pedido queda en estado 'pending' hasta que el admin lo confirme
 *
 * MÉTODOS DE PAGO:
 * - card → 'tarjeta' en el backend
 * - qr   → 'transferencia' en el backend
 */
import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router';
import { Trash2, CreditCard, ShoppingBag, X, Crown, QrCode, CheckCircle } from 'lucide-react';
import { clientesAPI, stripeAPI, qrBancoAPI, BACKEND_ROOT_URL, ApiCliente } from '../services/api';
import { useAuth } from '../context/AuthContext';
import { useEscapeKey } from '../hooks/useEscapeKey';

interface StoreCartItem {
  productId: number;
  productName: string;
  price: number;
  quantity: number;
  stock: number;
  imagen_url?: string | null;
}

// Múltiples métodos de pago
type PaymentMethod = 'card' | 'qr';

export function Cart() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const [cartItems, setCartItems] = useState<StoreCartItem[]>([]);
  const [paymentMethod, setPaymentMethod] = useState<PaymentMethod>('qr');
  const [showCheckoutModal, setShowCheckoutModal] = useState(false);
  const [processingOrder, setProcessingOrder] = useState(false);
  const [cliente, setCliente] = useState<ApiCliente | null>(null);
  const [aplicarDescuento, setAplicarDescuento] = useState(true);
  
  // Estados para el QR Modal
  const [showQrModal, setShowQrModal] = useState(false);
  const [qrInfo, setQrInfo] = useState<{ qr_imagen: string; titular: string; cuenta: string } | null>(null);
  const [comprobanteFile, setComprobanteFile] = useState<File | null>(null);
  const [comprobantePreview, setComprobantePreview] = useState<string | null>(null);

  useEffect(() => {
    const saved = localStorage.getItem('storeCart');
    if (saved) {
      try { setCartItems(JSON.parse(saved)); } catch { /* ignore */ }
    }
  }, []);

  // Carga info del cliente logueado (incluye descuento_disponible y total_acumulado)
  useEffect(() => {
    if (user?.id) {
      clientesAPI.getById(parseInt(user.id))
        .then(setCliente)
        .catch(() => setCliente(null));
    }
  }, [user?.id]);

  // Guarda el carrito en estado y localStorage al mismo tiempo
  const saveCart = (items: StoreCartItem[]) => {
    setCartItems(items);
    localStorage.setItem('storeCart', JSON.stringify(items));
  };

  // Actualiza la cantidad de un producto (mínimo 1)
  const updateQuantity = (productId: number, qty: number) => {
    if (qty < 1) return;
    saveCart(cartItems.map(i => i.productId === productId ? { ...i, quantity: qty } : i));
  };

  // Elimina un producto del carrito
  const removeItem = (productId: number) => saveCart(cartItems.filter(i => i.productId !== productId));

  // Suma el subtotal de todos los ítems (precio × cantidad)
  const subtotal = cartItems.reduce((s, i) => s + i.price * i.quantity, 0);

  // Descuento VIP en bloques de 200 Bs (regla relajada: descuento <= subtotal)
  const descuentoDisponible = Number(cliente?.descuento_disponible ?? 0);
  const blocksAvailable = Math.floor(descuentoDisponible / 200);
  const blocksInPurchase = Math.floor(subtotal / 200);
  const blocksToApply = Math.min(blocksAvailable, blocksInPurchase);
  const descuentoMaxAplicable = blocksToApply * 200;
  const descuentoAplicado = aplicarDescuento ? descuentoMaxAplicable : 0;
  const total = subtotal - descuentoAplicado;
  const esVip = !!cliente?.es_vip;

  // Procesa el pedido: crea la sesión de Stripe o la venta por QR
  const handleCheckout = async () => {
    if (!user) { alert('Debes iniciar sesión para realizar un pedido'); return; }
    setProcessingOrder(true);
    try {
      const detalles = cartItems.map(i => ({
        producto: i.productId,
        cantidad: i.quantity,
        precio_unitario: i.price,
      }));

      if (paymentMethod === 'card') {
        const { url } = await stripeAPI.createCheckoutSession({
          cliente: parseInt(user.id),
          detalles,
          monto: total,
          aplicar_descuento_vip: aplicarDescuento,
        });
        window.location.href = url;
      } else {
        // QR Bancario: solo obtenemos la info y mostramos el modal, NO creamos el pedido todavía
        const info = await qrBancoAPI.getInfo();
        setQrInfo(info);
        setShowCheckoutModal(false);
        setShowQrModal(true);
        setProcessingOrder(false);
      }
    } catch (err) {
      alert(`Error al procesar el pedido: ${err instanceof Error ? err.message : 'Error desconocido'}`);
      setProcessingOrder(false);
    }
  };

  const handleConfirmQRPayment = async () => {
    if (!user) return;
    if (!comprobanteFile) {
      alert("Debes adjuntar el comprobante de transferencia");
      return;
    }
    setProcessingOrder(true);
    try {
      const detalles = cartItems.map(i => ({
        producto: i.productId,
        cantidad: i.quantity,
        precio_unitario: i.price,
      }));

      await qrBancoAPI.crearPedido({
        cliente: parseInt(user.id),
        detalles,
        monto: total,
        aplicar_descuento_vip: aplicarDescuento,
      }, comprobanteFile);
      
      localStorage.removeItem('storeCart'); // Limpiamos el carrito local
      navigate('/qr-payment-success');
    } catch (err) {
      alert(`Error al procesar el pedido: ${err instanceof Error ? err.message : 'Error desconocido'}`);
      setProcessingOrder(false);
    }
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      const file = e.target.files[0];
      setComprobanteFile(file);
      setComprobantePreview(URL.createObjectURL(file));
    }
  };

  const paymentMethods = [
    { value: 'qr' as PaymentMethod, label: 'Transferencia QR Bancario', icon: QrCode },
    { value: 'card' as PaymentMethod, label: 'Tarjeta de Crédito/Débito', icon: CreditCard },
  ];

  // Cerrar el modal de checkout con Esc
  useEscapeKey(showCheckoutModal, () => setShowCheckoutModal(false));

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Carrito de Compras</h1>
        <p className="text-gray-600">Revisa tu pedido antes de finalizar</p>
      </div>

      {cartItems.length === 0 ? (
        <div className="bg-white rounded-xl p-12 border border-gray-200 text-center">
          <ShoppingBag className="w-16 h-16 text-gray-300 mx-auto mb-4" />
          <h3 className="text-lg font-semibold text-gray-900 mb-2">Tu carrito está vacío</h3>
          <p className="text-gray-600">Agrega productos desde la tienda</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          <div className="lg:col-span-2 space-y-4">
            {cartItems.map(item => (
              <div key={item.productId} className="bg-white rounded-xl p-6 border border-gray-200">
                <div className="flex gap-4">
                  <div className="w-20 h-20 bg-blue-50 rounded-lg flex items-center justify-center flex-shrink-0 overflow-hidden">
                    {item.imagen_url
                      ? <img
                          src={item.imagen_url.startsWith('http') ? item.imagen_url : `${BACKEND_ROOT_URL}${item.imagen_url}`}
                          alt={item.productName}
                          className="w-full h-full object-cover"
                        />
                      : <ShoppingBag className="w-8 h-8 text-blue-300" />
                    }
                  </div>
                  <div className="flex-1">
                    <div className="flex items-start justify-between mb-2">
                      <h3 className="font-semibold text-gray-900">{item.productName}</h3>
                      <button onClick={() => removeItem(item.productId)} className="p-2 text-red-600 hover:bg-red-50 rounded-lg">
                        <Trash2 className="w-5 h-5" />
                      </button>
                    </div>
                    <div className="flex items-center justify-between mt-3">
                      <div className="flex items-center gap-3">
                        <span className="text-sm text-gray-600">Cantidad:</span>
                        <div className="flex items-center gap-2">
                          <button onClick={() => updateQuantity(item.productId, item.quantity - 1)}
                            className="w-8 h-8 flex items-center justify-center border border-gray-300 rounded hover:bg-gray-100">-</button>
                          <span className="w-10 text-center font-medium">{item.quantity}</span>
                          <button onClick={() => updateQuantity(item.productId, item.quantity + 1)}
                            className="w-8 h-8 flex items-center justify-center border border-gray-300 rounded hover:bg-gray-100">+</button>
                        </div>
                      </div>
                      <div className="text-right">
                        <p className="text-sm text-gray-600">{item.price.toFixed(2)} Bs c/u</p>
                        <p className="text-xl font-bold text-gray-900">{(item.price * item.quantity).toFixed(2)} Bs</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>

          <div className="lg:col-span-1">
            <div className="bg-white rounded-xl p-6 border border-gray-200 sticky top-6">
              <div className="flex items-center justify-between mb-4 gap-2 flex-wrap">
                <h2 className="text-lg font-semibold text-gray-900">Resumen del Pedido</h2>
                {esVip && (
                  <span className="flex items-center gap-1 px-2.5 py-1 bg-yellow-100 border border-yellow-300 text-yellow-800 rounded-full text-xs font-bold">
                    <Crown className="w-3.5 h-3.5" /> VIP
                  </span>
                )}
              </div>

              {/* Info VIP del cliente */}
              {cliente && (descuentoDisponible > 0 || Number(cliente.total_acumulado ?? 0) > 0) && (
                <div className="mb-4 p-3 bg-gradient-to-r from-yellow-50 to-amber-50 border border-yellow-200 rounded-lg text-sm space-y-1">
                  <div className="text-gray-700">
                    <strong>Acumulado:</strong> Bs {Number(cliente.total_acumulado ?? 0).toFixed(2)}
                  </div>
                  {descuentoDisponible > 0 && (
                    <div className="text-green-700 font-semibold">
                      🎁 Descuento disponible: Bs {descuentoDisponible.toFixed(2)}
                    </div>
                  )}
                </div>
              )}

              {/* Checkbox aplicar descuento */}
              {descuentoMaxAplicable > 0 && (
                <div className="mb-3 p-2.5 bg-yellow-50 border border-yellow-200 rounded-lg">
                  <label className="flex items-center gap-2 cursor-pointer text-sm">
                    <input
                      type="checkbox"
                      checked={aplicarDescuento}
                      onChange={e => setAplicarDescuento(e.target.checked)}
                      className="w-4 h-4 text-blue-600 rounded border-gray-300 focus:ring-blue-500"
                    />
                    <span className="font-medium text-yellow-900">
                      Aplicar descuento VIP (Bs {descuentoMaxAplicable.toFixed(2)})
                    </span>
                  </label>
                </div>
              )}

              <div className="space-y-2 mb-6">
                {descuentoAplicado > 0 && (
                  <>
                    <div className="flex justify-between text-sm text-gray-600">
                      <span>Subtotal</span>
                      <span>Bs {subtotal.toFixed(2)}</span>
                    </div>
                    <div className="flex justify-between text-sm text-green-700 font-semibold">
                      <span>Descuento VIP</span>
                      <span>− Bs {descuentoAplicado.toFixed(2)}</span>
                    </div>
                  </>
                )}
                <div className="flex justify-between pt-2 border-t border-gray-200">
                  <span className="font-semibold text-gray-900">Total</span>
                  <span className="text-2xl font-bold text-gray-900">{total.toFixed(2)} Bs</span>
                </div>
              </div>
              <button onClick={() => setShowCheckoutModal(true)}
                className="w-full py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-medium">
                Proceder al Pago
              </button>
            </div>
          </div>
        </div>
      )}

      {showCheckoutModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-xl max-w-md w-full">
            <div className="flex items-center justify-between p-6 border-b border-gray-200">
              <h2 className="text-xl font-semibold text-gray-900">Método de Pago</h2>
              <button onClick={() => setShowCheckoutModal(false)} className="p-2 hover:bg-gray-100 rounded-lg">
                <X className="w-5 h-5" />
              </button>
            </div>
            <div className="p-6">
              <div className="space-y-3 mb-6">
                {paymentMethods.map(method => {
                  const Icon = method.icon;
                  return (
                    <button key={method.value} onClick={() => setPaymentMethod(method.value)}
                      className={`w-full flex items-center gap-3 p-4 border-2 rounded-lg transition-all ${paymentMethod === method.value ? 'border-blue-500 bg-blue-50' : 'border-gray-200 hover:border-gray-300'}`}>
                      <Icon className={`w-5 h-5 ${paymentMethod === method.value ? 'text-blue-600' : 'text-gray-600'}`} />
                      <span className={`font-medium ${paymentMethod === method.value ? 'text-blue-600' : 'text-gray-700'}`}>{method.label}</span>
                    </button>
                  );
                })}
              </div>
              <div className="pt-4 border-t border-gray-200 mb-6 space-y-1">
                {descuentoAplicado > 0 && (
                  <>
                    <div className="flex justify-between text-sm text-gray-600">
                      <span>Subtotal:</span>
                      <span>{subtotal.toFixed(2)} Bs</span>
                    </div>
                    <div className="flex justify-between text-sm text-green-700 font-semibold">
                      <span>Descuento VIP:</span>
                      <span>− {descuentoAplicado.toFixed(2)} Bs</span>
                    </div>
                  </>
                )}
                <div className="flex justify-between pt-2 border-t border-gray-100">
                  <span className="text-gray-600">Total a pagar:</span>
                  <span className="text-2xl font-bold text-gray-900">{total.toFixed(2)} Bs</span>
                </div>
              </div>
              <button onClick={handleCheckout} disabled={processingOrder}
                className="w-full py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 font-medium disabled:opacity-50">
                {processingOrder ? 'Procesando...' : paymentMethod === 'qr' ? 'Generar QR de Pago' : 'Pagar con tarjeta'}
              </button>
              <p className="mt-2 text-xs text-center text-gray-500">
                {paymentMethod === 'qr' 
                  ? 'Se generará un QR para que transfieras desde la app de tu banco.'
                  : 'Serás redirigido a la pasarela segura de Stripe para completar el pago.'}
              </p>
            </div>
          </div>
        </div>
      )}

      {showQrModal && qrInfo && (
        <div className="fixed inset-0 bg-black bg-opacity-75 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-xl max-w-md w-full overflow-hidden text-center">
            <div className="bg-blue-600 p-6 text-white">
              <h2 className="text-2xl font-bold mb-1">Pago por QR</h2>
              <p className="text-blue-100">Transfiere el monto exacto</p>
            </div>
            <div className="p-8">
              <div className="text-3xl font-bold text-gray-900 mb-6">{total.toFixed(2)} Bs</div>
              
              <div className="bg-gray-50 border border-gray-200 rounded-xl p-4 inline-block mb-6 shadow-sm">
                <img 
                  src={qrInfo.qr_imagen.startsWith('http') ? qrInfo.qr_imagen : `${BACKEND_ROOT_URL}${qrInfo.qr_imagen}`} 
                  alt="QR Bancario" 
                  className="w-48 h-48 object-cover rounded-lg mx-auto"
                />
              </div>

              <div className="text-sm text-gray-600 mb-6 space-y-1">
                <p><strong>Titular:</strong> {qrInfo.titular}</p>
                <p><strong>Cuenta:</strong> {qrInfo.cuenta}</p>
              </div>

              <div className="p-3 bg-yellow-50 border border-yellow-200 rounded-lg text-sm text-yellow-800 mb-6 text-left">
                <strong>Instrucciones:</strong> Escanea este código QR con la aplicación móvil de tu banco (ej. Banca Móvil Ganadero) y transfiere el monto indicado. Luego, adjunta tu comprobante aquí abajo.
              </div>

              <div className="mb-6 text-left">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Sube tu comprobante de transferencia *
                </label>
                <input 
                  type="file" 
                  accept="image/*" 
                  onChange={handleFileChange}
                  className="block w-full text-sm text-gray-500
                    file:mr-4 file:py-2 file:px-4
                    file:rounded-full file:border-0
                    file:text-sm file:font-semibold
                    file:bg-blue-50 file:text-blue-700
                    hover:file:bg-blue-100"
                />
                {comprobantePreview && (
                  <div className="mt-3 relative inline-block">
                    <img src={comprobantePreview} alt="Preview" className="h-32 rounded-lg border border-gray-200 object-contain" />
                    <button 
                      onClick={() => { setComprobanteFile(null); setComprobantePreview(null); }}
                      className="absolute -top-2 -right-2 bg-red-500 text-white rounded-full p-1 shadow-sm"
                    >
                      <X className="w-4 h-4" />
                    </button>
                  </div>
                )}
              </div>

              <button 
                onClick={handleConfirmQRPayment}
                disabled={!comprobanteFile || processingOrder}
                className="w-full py-4 bg-green-600 text-white rounded-lg hover:bg-green-700 font-bold text-lg flex items-center justify-center gap-2 shadow-md disabled:opacity-50 disabled:cursor-not-allowed">
                {processingOrder ? 'Procesando...' : <><CheckCircle className="w-6 h-6" /> Confirmar Transferencia</>}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
