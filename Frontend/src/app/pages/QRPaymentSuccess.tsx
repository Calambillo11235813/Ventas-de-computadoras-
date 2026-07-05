import { useNavigate } from 'react-router';
import { CheckCircle, ShoppingBag, ListChecks } from 'lucide-react';

export function QRPaymentSuccess() {
  const navigate = useNavigate();

  return (
    <div className="flex items-center justify-center min-h-[60vh]">
      <div className="bg-white rounded-xl p-8 max-w-md w-full border border-gray-200 text-center shadow-sm">
        <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
          <CheckCircle className="w-12 h-12 text-green-600" />
        </div>
        
        <h2 className="text-2xl font-bold text-gray-900 mb-2">¡Pedido Registrado!</h2>
        <p className="text-gray-600 mb-6">Hemos recibido la notificación de tu pedido por QR.</p>
        
        <div className="mt-4 p-4 bg-blue-50 border border-blue-200 rounded-xl text-sm text-blue-900 mb-8 text-left">
          <h3 className="font-bold text-blue-900 mb-1">¿Qué sigue ahora?</h3>
          <p className="mb-2">Tu pedido está <strong>pendiente de verificación</strong>.</p>
          <ul className="list-disc pl-5 space-y-1 text-blue-800">
            <li>El equipo de ventas revisará tu transferencia en la cuenta del banco.</li>
            <li>Una vez verificado, aprobaremos tu compra.</li>
            <li>Puedes pasar por la tienda a recoger tus productos.</li>
          </ul>
        </div>
        
        <div className="flex flex-col gap-3">
          <button onClick={() => navigate('/orders')}
            className="w-full py-3.5 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-medium flex items-center justify-center gap-2 shadow-sm">
            <ListChecks className="w-5 h-5" /> Ver Mis Pedidos
          </button>
          <button onClick={() => navigate('/store')}
            className="w-full py-3.5 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 font-medium flex items-center justify-center gap-2">
            <ShoppingBag className="w-5 h-5 text-gray-500" /> Seguir Comprando
          </button>
        </div>
      </div>
    </div>
  );
}
