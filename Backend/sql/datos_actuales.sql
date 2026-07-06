--
-- PostgreSQL database dump
--

\restrict Hkd9OdLAyHtYx4fNpgcNpqEhIA0IZ160DtjPuh3iCqrG3u63LtrezGUF3rzynSc

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'users', 'usuario');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'users', 'cliente');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'users', 'otprecovery');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'products', 'categoria');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'products', 'producto');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'products', 'proveedor');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'products', 'compra');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (14, 'products', 'detallecompra');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (15, 'orders', 'venta');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (16, 'orders', 'detalleventa');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (17, 'orders', 'pagoventa');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (18, 'orders', 'factura');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (19, 'audit', 'bitacora');


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add Usuario', 7, 'add_usuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change Usuario', 7, 'change_usuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete Usuario', 7, 'delete_usuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view Usuario', 7, 'view_usuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add Cliente', 8, 'add_cliente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change Cliente', 8, 'change_cliente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete Cliente', 8, 'delete_cliente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view Cliente', 8, 'view_cliente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add otp recovery', 9, 'add_otprecovery');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change otp recovery', 9, 'change_otprecovery');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete otp recovery', 9, 'delete_otprecovery');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view otp recovery', 9, 'view_otprecovery');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add Categoría', 10, 'add_categoria');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change Categoría', 10, 'change_categoria');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete Categoría', 10, 'delete_categoria');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view Categoría', 10, 'view_categoria');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add Producto', 11, 'add_producto');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change Producto', 11, 'change_producto');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete Producto', 11, 'delete_producto');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view Producto', 11, 'view_producto');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add Proveedor', 12, 'add_proveedor');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change Proveedor', 12, 'change_proveedor');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete Proveedor', 12, 'delete_proveedor');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view Proveedor', 12, 'view_proveedor');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add Compra', 13, 'add_compra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change Compra', 13, 'change_compra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete Compra', 13, 'delete_compra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view Compra', 13, 'view_compra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can add Detalle de Compra', 14, 'add_detallecompra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can change Detalle de Compra', 14, 'change_detallecompra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can delete Detalle de Compra', 14, 'delete_detallecompra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can view Detalle de Compra', 14, 'view_detallecompra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can add Venta', 15, 'add_venta');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can change Venta', 15, 'change_venta');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can delete Venta', 15, 'delete_venta');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can view Venta', 15, 'view_venta');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add Detalle de Venta', 16, 'add_detalleventa');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change Detalle de Venta', 16, 'change_detalleventa');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete Detalle de Venta', 16, 'delete_detalleventa');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can view Detalle de Venta', 16, 'view_detalleventa');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can add Pago de Venta', 17, 'add_pagoventa');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can change Pago de Venta', 17, 'change_pagoventa');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (67, 'Can delete Pago de Venta', 17, 'delete_pagoventa');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (68, 'Can view Pago de Venta', 17, 'view_pagoventa');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (69, 'Can add Factura', 18, 'add_factura');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (70, 'Can change Factura', 18, 'change_factura');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (71, 'Can delete Factura', 18, 'delete_factura');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (72, 'Can view Factura', 18, 'view_factura');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (73, 'Can add Registro de Bitácora', 19, 'add_bitacora');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (74, 'Can change Registro de Bitácora', 19, 'change_bitacora');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (75, 'Can delete Registro de Bitácora', 19, 'delete_bitacora');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (76, 'Can view Registro de Bitácora', 19, 'view_bitacora');


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$600000$uaCwN3OmedWY9xeYmPHYbw$WioBuF37CqLZKFuTANeKnoApAahm8g8+B83Jyc78OW0=', '2026-05-10 13:46:22.995035-04', true, 'Joseca', '', '', 'huasi456@gmail.com', true, true, '2026-05-10 07:36:30.630933-04');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario (idusuario, nombre_completo, username, password_hash, rol, activo, email, telefono, ciudad, fecha_nacimiento) VALUES (5, 'Julieta Villarroel', 'Juli123', 'pbkdf2_sha256$600000$5PzT94khmKFDHAEruqvuGa$dF6GCG0y3CLJT5nFWhLnmEc9u4tZFyxTQffSvnMOyG4=', 'vendedor', true, 'Julietavillarroel@gmail.com', '67711777', 'Beni', '2003-02-22');
INSERT INTO public.usuario (idusuario, nombre_completo, username, password_hash, rol, activo, email, telefono, ciudad, fecha_nacimiento) VALUES (2, 'Dio Ovando', 'Ovando', 'pbkdf2_sha256$600000$I5bwgmjucTRhVvSyc00iVG$nTu8ciM0nOPlizJMvBz1DLFf18ckl3DM5IXlQMC3L10=', 'vendedor', true, 'katyvillarroel1617@gmail.com', '69054688', 'Potosi', '2000-12-01');
INSERT INTO public.usuario (idusuario, nombre_completo, username, password_hash, rol, activo, email, telefono, ciudad, fecha_nacimiento) VALUES (4, 'Julio Cesar Villarroel Dueñas', 'Cesar123', 'pbkdf2_sha256$600000$LBhs8fFw1oSJpAaS754VEb$o7YI0mhd61ddv/0+HFVr8BU5N8h1Wscg4xJ6yqOz7UE=', 'vendedor', true, 'juliocesarvillarroed@gmail.com', '69060614', 'Santa cruz de la sierra', '2000-06-28');
INSERT INTO public.usuario (idusuario, nombre_completo, username, password_hash, rol, activo, email, telefono, ciudad, fecha_nacimiento) VALUES (1, 'Jose carlos Villarroel Dueñas', 'Joseca', 'pbkdf2_sha256$600000$ET6WwSvDsuW2OWkcKV1JiU$EN7aTZ5sz8Xn7PlHV+aF7IDIEB9JI0zLmuoxqCUUoDA=', 'admin', true, 'huasi456@gmail.com', '78035692', 'Santa cruz de la Sierra', '1996-05-15');


--
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (1, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-09 19:30:27.62659-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (2, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-09 19:30:37.043605-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (3, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Samsung 990 PRO SSD 1TB PCIe 4.0 M.2" (ID: 7)', '127.0.0.1', '2026-05-10 01:24:13.245222-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (4, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Samsung 990 PRO SSD 1TB PCIe 4.0 M.2" (ID: 7)', '127.0.0.1', '2026-05-10 01:24:38.581383-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (5, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Corsair M75 AIR" (ID: 6)', '127.0.0.1', '2026-05-10 01:26:41.010576-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (6, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Corsair M75 AIR 2.4 GHz" (Corsair)', '127.0.0.1', '2026-05-10 01:38:19.080736-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (7, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "ASUS ROG Gladius III" (stock: 0, precio: 700.00)', '127.0.0.1', '2026-05-10 01:44:21.477957-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (8, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 01:44:51.34051-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (11, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 01:46:07.418581-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (12, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "ASUS ROG Gladius III" (Asus)', '127.0.0.1', '2026-05-10 01:46:33.292461-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (13, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "ASUS ROG Gladius III" (Asus)', '127.0.0.1', '2026-05-10 01:53:53.591622-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (14, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 01:53:58.386156-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (17, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 01:54:41.87533-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (18, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Samsung 990 PRO SSD 1TB PCIe 4.0 M.2" (Samsung)', '127.0.0.1', '2026-05-10 01:55:06.863389-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (19, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Corsair M75 AIR 2.4 GHz" (Corsair)', '127.0.0.1', '2026-05-10 01:55:46.534077-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (20, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Logitech G305 Lightspeed Wireless" (Logitech)', '127.0.0.1', '2026-05-10 01:56:02.950901-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (21, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 01:56:04.491638-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (24, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 02:00:39.33543-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (25, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Logitech G305 Lightspeed Wireless" (Logitech)', '127.0.0.1', '2026-05-10 02:00:53.865595-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (26, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 02:00:56.73681-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (29, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 02:01:15.941518-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (30, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Razer BlackWidow V4 X" (stock: 0, precio: 700.00)', '127.0.0.1', '2026-05-10 02:02:56.459485-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (31, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Corsair K70 Core RGB" (stock: 0, precio: 650.00)', '127.0.0.1', '2026-05-10 02:04:08.195708-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (32, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Redragon K617 HE" (stock: 0, precio: 300.00)', '127.0.0.1', '2026-05-10 02:07:24.367075-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (33, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "ASUS TUF Gaming VG27AQ3A" (stock: 0, precio: 1849.99)', '127.0.0.1', '2026-05-10 02:09:10.832164-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (34, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "LG 27U411A-B 27" (stock: 0, precio: 800.00)', '127.0.0.1', '2026-05-10 02:10:26.151276-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (35, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Acer KB242Y" (stock: 0, precio: 850.00)', '127.0.0.1', '2026-05-10 02:12:37.367648-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (36, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "MSI MAG A750GL PCIE5" (stock: 0, precio: 900.00)', '127.0.0.1', '2026-05-10 02:14:16.361419-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (37, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "ASUS TUF Gaming VG27AQ3A" (Asus)', '127.0.0.1', '2026-05-10 02:14:37.671063-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (38, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Corsair RM750e" (stock: 0, precio: 720.00)', '127.0.0.1', '2026-05-10 02:16:10.293006-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (39, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Western Digital (WD) BLUE Desktop 1TB" (stock: 0, precio: 650.00)', '127.0.0.1', '2026-05-10 02:18:04.044003-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (40, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Seagate SkyHawk 1TB" (stock: 0, precio: 380.00)', '127.0.0.1', '2026-05-10 02:20:31.110576-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (41, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Crucial BX500 1TB" (stock: 0, precio: 1200.00)', '127.0.0.1', '2026-05-10 02:22:18.637025-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (42, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Western Digital 1TB" (stock: 0, precio: 1250.00)', '127.0.0.1', '2026-05-10 02:24:33.819692-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (43, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Kingston FURY Beast 8GB DDR4" (stock: 0, precio: 850.00)', '127.0.0.1', '2026-05-10 02:28:22.042575-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (44, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Corsair Vengeance DDR5 32 GB(2 x 16 GB)" (stock: 0, precio: 3250.00)', '127.0.0.1', '2026-05-10 02:30:47.252597-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (45, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 02:30:53.268601-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (46, 2, 'Ovando', 'vendedor', 'LOGIN', 'Usuario', 'Ovando (vendedor) inició sesión en el sistema', '127.0.0.1', '2026-05-10 02:30:58.392283-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (47, 2, 'Ovando', 'employee', 'LOGOUT', 'Usuario', 'Ovando cerró sesión en el sistema', '127.0.0.1', '2026-05-10 02:31:02.615778-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (50, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 02:32:03.678004-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (51, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "TEAMGROUP T-Force Delta RGB DDR5 Ram 32 GB (2 x 16 GB)" (stock: 0, precio: 4000.00)', '127.0.0.1', '2026-05-10 02:33:58.301031-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (52, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "MSI PRO B550M-VC" (stock: 0, precio: 2300.00)', '127.0.0.1', '2026-05-10 02:35:14.814003-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (53, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "GIGABYTE X870 AORUS Elite WIFI7" (stock: 0, precio: 2000.00)', '127.0.0.1', '2026-05-10 02:36:46.986296-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (54, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "ASUS ROG Strix B650-A Gaming WiFi AMD" (stock: 0, precio: 1550.00)', '127.0.0.1', '2026-05-10 02:38:15.667724-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (55, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "ASUS Dual GeForce RTX™ 5060 8GB GDDR7 OC Edition" (stock: 0, precio: 3150.00)', '127.0.0.1', '2026-05-10 02:41:13.187135-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (56, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "EVGA GeForce RTX 3070 FTW3 Ultra Gaming 8GB GDDR6" (stock: 0, precio: 2800.00)', '127.0.0.1', '2026-05-10 02:42:53.321127-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (57, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Intel Core Ultra 9 285K" (stock: 0, precio: 5200.00)', '127.0.0.1', '2026-05-10 02:44:48.828555-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (58, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Intel Core i5-14400F" (stock: 0, precio: 2350.00)', '127.0.0.1', '2026-05-10 02:45:59.218201-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (59, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Intel Core i3-12100F" (stock: 0, precio: 1450.00)', '127.0.0.1', '2026-05-10 02:48:55.050117-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (60, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "AMD RYZEN 7 9800X3D" (stock: 0, precio: 3800.00)', '127.0.0.1', '2026-05-10 02:50:38.663039-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (61, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Amd Ryzen 5 9600X" (stock: 0, precio: 1650.00)', '127.0.0.1', '2026-05-10 02:52:01.316076-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (62, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "ASUS Dual GeForce RTX™ 5060 8GB GDDR7 OC Edition" (Asus)', '127.0.0.1', '2026-05-10 02:52:42.615204-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (63, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 03:00:52.861589-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (64, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Amd Ryzen 9 9900X" (stock: 0, precio: 3750.00)', '127.0.0.1', '2026-05-10 03:03:06.320838-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (65, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "ASUS TUF Gaming F16 (2025)" (stock: 0, precio: 9500.00)', '127.0.0.1', '2026-05-10 03:05:45.211904-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (66, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Acer Nitro V" (stock: 0, precio: 9800.00)', '127.0.0.1', '2026-05-10 03:06:55.643538-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (67, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:09:40.658855-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (70, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 03:15:48.678955-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (71, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:16:18.375226-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (72, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-05-10 03:16:23.22011-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (73, 4, 'Guido123', 'cliente', 'VENTA', 'Venta', 'Se registró la venta #17 por 1020.00 Bs (cliente: Guido123)', '127.0.0.1', '2026-05-10 03:40:45.201302-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (74, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:40:54.390807-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (75, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:40:54.396836-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (76, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:40:54.40706-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (77, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:40:54.426442-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (78, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:40:54.439174-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (79, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 03:41:01.509508-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (80, 1, 'Joseca', 'admin', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #17 (estado → completada)', '127.0.0.1', '2026-05-10 03:41:24.286255-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (81, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:42:03.663986-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (82, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:42:03.67013-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (83, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:42:03.677634-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (84, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:42:03.691521-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (85, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 03:42:03.692515-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (88, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 03:45:24.656933-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (89, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #6 por 52600.00 Bs', '127.0.0.1', '2026-05-10 04:20:06.371629-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (90, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #7 por 16150.00 Bs', '127.0.0.1', '2026-05-10 04:23:07.280288-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (91, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #8 por 9250.00 Bs', '127.0.0.1', '2026-05-10 04:24:02.931834-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (92, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #9 por 78350.00 Bs', '127.0.0.1', '2026-05-10 04:25:15.839401-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (93, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #10 por 109000.00 Bs', '127.0.0.1', '2026-05-10 04:27:28.203377-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (94, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #11 por 6000.00 Bs', '127.0.0.1', '2026-05-10 04:28:02.9594-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (95, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #12 por 2500.00 Bs', '127.0.0.1', '2026-05-10 04:28:59.556798-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (96, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #13 por 42500.00 Bs', '127.0.0.1', '2026-05-10 04:29:19.512151-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (97, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 04:29:52.182092-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (100, 2, 'Ovando', 'vendedor', 'LOGIN', 'Usuario', 'Ovando (vendedor) inició sesión en el sistema', '127.0.0.1', '2026-05-10 04:31:00.74813-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (101, 2, 'Ovando', 'employee', 'LOGOUT', 'Usuario', 'Ovando cerró sesión en el sistema', '127.0.0.1', '2026-05-10 04:31:12.610992-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (102, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 04:31:17.540526-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (103, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 04:33:02.768594-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (106, 2, 'Ovando', 'vendedor', 'LOGIN', 'Usuario', 'Ovando (vendedor) inició sesión en el sistema', '127.0.0.1', '2026-05-10 04:33:37.090045-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (107, 2, 'Ovando', 'employee', 'LOGOUT', 'Usuario', 'Ovando cerró sesión en el sistema', '127.0.0.1', '2026-05-10 04:34:07.995718-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (108, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 04:34:12.993326-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (109, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "CORSAIR Carcasa ATX 4000D RS ARGB Frame" (stock: 0, precio: 1200.00)', '127.0.0.1', '2026-05-10 04:47:49.815029-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (110, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #14 por 3000.00 Bs', '127.0.0.1', '2026-05-10 04:48:17.141299-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (111, 1, 'Joseca', 'admin', 'VENTA', 'Venta', 'Se registró la venta #18 por 1400.00 Bs (cliente: Nelson123)', '127.0.0.1', '2026-05-10 05:00:40.417265-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (112, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 05:06:32.259671-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (115, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 05:08:47.729397-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (116, 1, 'Joseca', 'admin', 'VENTA', 'Venta', 'Se registró la venta #1 por 1000.00 Bs (cliente: Nelson123)', '127.0.0.1', '2026-05-10 05:17:34.973445-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (117, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #15 por 2500.00 Bs', '127.0.0.1', '2026-05-10 05:23:02.701071-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (118, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 05:24:23.366154-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (121, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 05:37:51.64234-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (122, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 05:50:59.066901-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (125, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 05:51:26.237824-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (126, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 05:51:52.647456-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (129, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 05:52:14.877201-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (130, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 05:52:46.93923-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (133, 2, 'Ovando', 'vendedor', 'LOGIN', 'Usuario', 'Ovando (vendedor) inició sesión en el sistema', '127.0.0.1', '2026-05-10 05:53:02.553184-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (134, 2, 'Ovando', 'employee', 'LOGOUT', 'Usuario', 'Ovando cerró sesión en el sistema', '127.0.0.1', '2026-05-10 05:53:25.652085-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (135, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 05:53:30.042558-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (136, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:01:18.394575-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (139, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:01:29.498602-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (140, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:02:04.366166-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (141, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:03:03.276642-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (142, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:03:09.698009-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (145, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:03:29.08041-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (146, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:04:08.174077-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (149, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:04:24.687545-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (150, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:04:26.843771-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (151, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:04:31.37724-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (152, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:05:29.527174-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (153, NULL, 'Anónimo', '', 'CREATE', 'Cliente', 'Nuevo cliente registrado: "Pandora"', '127.0.0.1', '2026-05-10 06:06:44.490579-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (155, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:06:56.492637-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (156, 1, 'Joseca', 'admin', 'UPDATE', 'Cliente', 'Se actualizó el perfil del cliente "Pandora"', '127.0.0.1', '2026-05-10 06:07:28.466449-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (157, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:07:37.62124-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (158, 5, 'Pandora2026', 'cliente', 'LOGIN', 'Cliente', 'Pandora2026 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:07:56.554493-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (159, 5, 'Pandora2026', 'client', 'LOGOUT', 'Usuario', 'Pandora2026 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:07:58.555271-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (160, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:08:12.313622-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (161, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:08:40.470919-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (162, 2, 'Ovando', 'vendedor', 'LOGIN', 'Usuario', 'Ovando (vendedor) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:08:45.7461-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (163, 2, 'Ovando', 'employee', 'LOGOUT', 'Usuario', 'Ovando cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:08:48.658775-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (164, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:08:52.437333-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (165, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:15:46.042387-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (168, 1, 'Joseca', 'Administrador', 'LOGIN', 'Usuario', 'Joseca (Administrador) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:15:58.096691-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (169, 1, 'Joseca', 'client', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:16:06.156829-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (170, 1, 'Joseca', 'Administrador', 'LOGIN', 'Usuario', 'Joseca (Administrador) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:16:10.510851-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (171, 1, 'Joseca', 'client', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:16:22.585668-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (172, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:18:14.476928-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (173, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:18:35.964698-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (176, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:18:48.73102-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (177, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:20:59.760238-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (180, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:21:12.248965-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (181, NULL, 'Joseca', 'admin', 'DELETE', 'Cliente', 'Se eliminó el cliente "Nelson"', '127.0.0.1', '2026-05-10 06:21:25.215903-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (182, 1, 'Joseca', 'admin', 'VENTA', 'Venta', 'Se registró la venta #1 por 700.00 Bs (cliente: Pandora2026)', '127.0.0.1', '2026-05-10 06:24:57.989673-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (183, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Seagate SkyHawk 1TB" (Seagate)', '127.0.0.1', '2026-05-10 06:53:11.003621-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (184, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "ASUS TUF Gaming VG27AQ3A" (Asus)', '127.0.0.1', '2026-05-10 06:53:19.302591-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (185, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Logitech G305 Lightspeed Wireless" (Logitech)', '127.0.0.1', '2026-05-10 06:53:26.514748-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (186, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "ASUS ROG Gladius III" (Asus)', '127.0.0.1', '2026-05-10 06:53:34.40224-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (187, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Samsung 990 PRO SSD 1TB PCIe 4.0 M.2" (Samsung)', '127.0.0.1', '2026-05-10 06:53:43.360991-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (188, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Acer KB242Y" (Acer)', '127.0.0.1', '2026-05-10 06:54:00.947829-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (189, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Kingston FURY Beast 8GB DDR4" (Kingston)', '127.0.0.1', '2026-05-10 06:54:09.088007-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (190, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:54:44.551268-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (191, 5, 'Pandora2026', 'cliente', 'LOGIN', 'Cliente', 'Pandora2026 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:55:04.374158-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (192, 5, 'Pandora2026', 'client', 'LOGOUT', 'Usuario', 'Pandora2026 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 06:55:20.875917-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (193, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 06:55:25.052124-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (194, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 07:43:12.848658-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (195, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 08:24:45.052846-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (196, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 09:43:57.724558-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (197, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 09:44:01.30345-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (198, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 09:45:55.395022-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (199, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 09:46:00.125102-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (200, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 10:00:24.80151-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (201, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-05-10 10:00:36.616473-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (202, NULL, 'Guido123', 'cliente', 'UPDATE', 'Cliente', 'Cliente ID 4 cambió su contraseña', '127.0.0.1', '2026-05-10 10:02:13.516526-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (203, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 10:03:34.268064-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (204, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-05-10 10:03:49.178608-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (205, NULL, 'Guido123', 'cliente', 'UPDATE', 'Cliente', 'Cliente ID 4 cambió su contraseña', '127.0.0.1', '2026-05-10 10:04:23.683781-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (206, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-05-10 10:04:50.681631-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (207, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 10:32:15.424062-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (208, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 10:34:33.248275-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (209, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 10:35:30.01323-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (210, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 10:36:23.629354-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (211, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 10:40:34.086827-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (212, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 10:40:40.791609-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (213, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 10:47:01.644767-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (214, 2, 'Ovando', 'vendedor', 'LOGIN', 'Usuario', 'Ovando (vendedor) inició sesión en el sistema', '127.0.0.1', '2026-05-10 10:53:32.454254-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (215, 2, 'Ovando', 'vendedor', 'LOGIN', 'Usuario', 'Ovando (vendedor) inició sesión en el sistema', '127.0.0.1', '2026-05-10 10:53:34.079804-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (216, 2, 'Ovando', 'employee', 'LOGOUT', 'Usuario', 'Ovando cerró sesión en el sistema', '127.0.0.1', '2026-05-10 10:53:43.174911-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (217, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 10:53:48.208043-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (218, NULL, 'Anónimo', '', 'UPDATE', 'Usuario', 'Se modificó el usuario "Dio Ovando" (ID: 2)', '127.0.0.1', '2026-05-10 10:57:34.222577-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (219, NULL, 'Joseca', 'admin', 'UPDATE', 'Cliente', 'Se actualizó el perfil del cliente "Guido"', '127.0.0.1', '2026-05-10 10:57:54.424562-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (220, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 10:58:01.263192-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (221, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 11:18:16.335759-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (222, NULL, 'Anónimo', '', 'UPDATE', 'Usuario', 'Se modificó el usuario "Dio Ovando" (ID: 2)', '127.0.0.1', '2026-05-10 11:18:27.165196-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (223, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 11:18:30.187699-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (224, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 11:39:38.580004-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (225, NULL, 'Joseca', 'admin', 'UPDATE', 'Cliente', 'Se actualizó el perfil del cliente "Pandora"', '127.0.0.1', '2026-05-10 11:41:58.914622-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (226, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 11:42:45.134913-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (227, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 11:42:58.277084-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (228, NULL, 'Anónimo', '', 'UPDATE', 'Usuario', 'Se modificó el usuario "Julio Cesar Villarroel Dueñas" (ID: 4)', '127.0.0.1', '2026-05-10 11:43:27.342024-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (229, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 11:43:33.146578-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (230, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 11:45:50.920803-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (231, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 11:45:56.256125-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (232, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 11:48:23.258098-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (233, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 11:52:47.40251-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (234, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 12:11:12.502413-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (235, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 12:11:22.628711-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (236, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 12:14:41.685932-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (237, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 12:14:53.964816-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (238, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 13:29:41.832613-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (239, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 13:31:40.635867-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (240, NULL, 'Anónimo', '', 'CREATE', 'Cliente', 'Nuevo cliente registrado: "Perez"', '127.0.0.1', '2026-05-10 13:32:59.007378-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (241, NULL, 'Anónimo', '', 'VENTA', 'Venta', 'Se registró la venta #2 por 14450.00 Bs (cliente: Perez1)', '127.0.0.1', '2026-05-10 13:33:34.473015-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (243, 2, 'Ovando', 'vendedor', 'LOGIN', 'Usuario', 'Ovando (vendedor) inició sesión en el sistema', '127.0.0.1', '2026-05-10 13:33:58.077423-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (244, 2, 'Ovando', 'vendedor', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #2 (estado → completada)', '127.0.0.1', '2026-05-10 13:34:42.49759-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (245, 2, 'Ovando', 'employee', 'LOGOUT', 'Usuario', 'Ovando cerró sesión en el sistema', '127.0.0.1', '2026-05-10 13:35:24.247343-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (248, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 13:35:55.369515-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (249, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 13:52:56.989393-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (250, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 13:55:19.818838-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (251, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 13:58:25.639737-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (254, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 13:59:21.40176-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (255, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 14:00:48.131272-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (259, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 14:01:22.076832-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (260, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 14:04:43.569092-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (264, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 14:05:27.866782-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (265, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 14:09:41.824004-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (270, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 14:13:41.257622-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (271, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-05-10 14:14:02.96951-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (280, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 14:36:14.758245-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (281, 1, 'Joseca', 'admin', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #8 (estado → completada)', '127.0.0.1', '2026-05-10 14:36:30.738157-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (282, 1, 'Joseca', 'admin', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #9 (estado → completada)', '127.0.0.1', '2026-05-10 14:36:32.523317-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (283, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #16 por 80000.00 Bs', '127.0.0.1', '2026-05-10 14:39:55.644909-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (284, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #17 por 66000.00 Bs', '127.0.0.1', '2026-05-10 14:40:37.268093-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (285, 1, 'Joseca', 'admin', 'DELETE', 'Producto', 'Se eliminó el producto "CORSAIR Carcasa ATX 4000D RS ARGB Frame" (ID: 37)', '127.0.0.1', '2026-05-10 14:41:57.398648-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (286, 1, 'Joseca', 'admin', 'DELETE', 'Producto', 'Se eliminó el producto "CORSAIR Carcasa ATX 4000D RS ARGB Frame" (ID: 37)', '127.0.0.1', '2026-05-10 14:42:39.639452-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (288, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-05-10 15:10:37.293676-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (289, 1, 'Joseca', 'admin', 'DELETE', 'Producto', 'Se eliminó el producto "CORSAIR Carcasa ATX 4000D RS ARGB Frame" (ID: None)', '127.0.0.1', '2026-05-10 15:10:47.512522-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (290, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "CORSAIR ATX 4000D" (stock: 0, precio: 1000.00)', '127.0.0.1', '2026-05-10 15:13:30.246547-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (291, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #1 por 9000.00 Bs', '127.0.0.1', '2026-05-10 15:14:20.046312-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (292, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #2 por 25000.00 Bs', '127.0.0.1', '2026-05-10 15:16:31.285036-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (293, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #3 por 235200.00 Bs', '127.0.0.1', '2026-05-10 15:18:21.708353-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (294, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #4 por 83400.00 Bs', '127.0.0.1', '2026-05-10 15:19:10.13852-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (295, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #5 por 66900.00 Bs', '127.0.0.1', '2026-05-10 15:20:20.420935-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (296, 1, 'Joseca', 'admin', 'COMPRA', 'Compra', 'Se registró la compra #6 por 31200.00 Bs', '127.0.0.1', '2026-05-10 15:22:00.178913-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (297, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-04 21:56:29.708509-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (298, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-04 21:56:31.56692-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (299, 1, 'Joseca', 'admin', 'CREATE', 'Producto', 'Se creó el producto "Elecciones" (stock: 0, precio: 25.00)', '127.0.0.1', '2026-07-04 22:06:14.455869-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (300, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Elecciones" (39)', '127.0.0.1', '2026-07-04 22:06:49.556604-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (301, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Elecciones" (39)', '127.0.0.1', '2026-07-04 22:07:12.920312-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (302, 1, 'Joseca', 'admin', 'UPDATE', 'Producto', 'Se modificó el producto "Elecciones" (39)', '127.0.0.1', '2026-07-04 22:07:33.033544-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (303, 1, 'Joseca', 'admin', 'DELETE', 'Producto', 'Se eliminó el producto "Elecciones" (ID: None)', '127.0.0.1', '2026-07-04 22:13:37.612552-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (304, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-07-04 22:29:32.311263-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (305, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-04 22:31:12.83177-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (306, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-04 22:32:45.22168-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (307, 4, 'Guido123', 'cliente', 'VENTA', 'Venta', 'Pago con tarjeta (Stripe) confirmado — venta #6 por 380.00 Bs (cliente: Guido123)', '127.0.0.1', '2026-07-04 22:59:57.641017-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (308, 4, 'Guido123', 'cliente', 'VENTA', 'Venta', 'Pago con tarjeta (Stripe) confirmado — venta #7 por 380.00 Bs (cliente: Guido123)', '127.0.0.1', '2026-07-04 23:00:13.851552-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (309, 4, 'Guido123', 'cliente', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #8 (estado → completada)', '127.0.0.1', '2026-07-04 23:41:52.993092-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (310, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-07-05 00:03:04.875905-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (311, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 00:03:13.32937-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (312, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 00:03:14.401083-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (313, 4, 'Guido123', 'cliente', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #10 (estado → completada)', '127.0.0.1', '2026-07-05 00:04:50.063712-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (314, 4, 'Guido123', 'cliente', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #9 (estado → completada)', '127.0.0.1', '2026-07-05 00:05:25.109129-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (315, 4, 'Guido123', 'cliente', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #7 (estado → completada)', '127.0.0.1', '2026-07-05 00:06:00.972927-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (316, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-07-05 00:06:21.985263-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (317, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-05 00:07:18.549823-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (318, 4, 'Guido123', 'client', 'LOGOUT', 'Usuario', 'Guido123 cerró sesión en el sistema', '127.0.0.1', '2026-07-05 00:10:59.042078-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (319, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 00:11:01.744423-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (320, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 00:11:02.538368-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (321, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 00:17:06.394319-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (322, NULL, 'Anónimo', '', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #11 (estado → completada)', '127.0.0.1', '2026-07-05 00:18:17.960877-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (323, 4, 'Guido123', 'cliente', 'VENTA', 'Venta', 'Pago con tarjeta (Stripe) confirmado — venta #12 por 3550.00 Bs (cliente: Guido123)', '127.0.0.1', '2026-07-05 00:20:40.787385-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (324, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-05 18:44:49.276948-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (325, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-05 18:44:51.3623-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (326, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-07-05 19:15:41.008807-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (327, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-05 19:16:43.753089-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (328, NULL, 'diogo123', 'cliente', 'LOGIN', 'Cliente', 'diogo123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 19:26:38.113802-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (329, NULL, 'diogo123', 'cliente', 'LOGIN', 'Cliente', 'diogo123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 19:26:39.038265-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (330, NULL, 'diogo123', 'client', 'LOGOUT', 'Usuario', 'diogo123 cerró sesión en el sistema', '127.0.0.1', '2026-07-05 19:26:50.815498-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (331, NULL, 'Sistema', '', 'RESET_PW', 'Cliente', 'Se restableció la contraseña del cliente "76847107.wr@gmail.com"', NULL, '2026-07-05 19:32:44.404108-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (332, NULL, 'diogo123', 'cliente', 'LOGIN', 'Cliente', 'diogo123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 19:33:12.720344-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (333, 1, 'Joseca', 'admin', 'LOGOUT', 'Usuario', 'Joseca cerró sesión en el sistema', '127.0.0.1', '2026-07-05 19:33:28.894846-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (334, NULL, 'Anónimo', '', 'CREATE', 'Cliente', 'Nuevo cliente registrado: "Manuel"', '127.0.0.1', '2026-07-05 19:35:17.047025-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (335, NULL, 'diogo123', 'client', 'LOGOUT', 'Usuario', 'diogo123 cerró sesión en el sistema', '127.0.0.1', '2026-07-05 19:35:45.09489-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (336, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-05 19:35:50.487485-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (337, 5, 'Manuel123', 'client', 'LOGOUT', 'Usuario', 'Manuel123 cerró sesión en el sistema', '127.0.0.1', '2026-07-05 19:36:15.9621-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (338, NULL, 'Sistema', '', 'RESET_PW', 'Cliente', 'Se restableció la contraseña del cliente "moyajosemanuel53@gmail.com"', NULL, '2026-07-05 19:37:23.436256-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (339, NULL, 'Manuel123', 'cliente', 'LOGIN', 'Cliente', 'Manuel123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 19:37:46.174419-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (340, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-05 23:08:31.83629-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (341, 1, 'Joseca', 'admin', 'LOGIN', 'Usuario', 'Joseca (admin) inició sesión en el sistema', '127.0.0.1', '2026-07-05 23:08:32.470231-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (342, 4, 'Guido123', 'cliente', 'LOGIN', 'Cliente', 'Guido123 (cliente) inició sesión en el sistema', '127.0.0.1', '2026-07-05 23:09:03.805906-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (343, 1, 'Joseca', 'admin', 'VENTA', 'Venta', 'Se confirmó la entrega de la venta #13 (estado → completada)', '127.0.0.1', '2026-07-05 23:10:44.08069-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (344, NULL, 'Guido Rios', 'client', 'CREATE', 'Reseña', 'Cliente Guido Rios calificó la venta #13 con 4★ — execelente producto', '127.0.0.1', '2026-07-05 23:12:39.968936-04');
INSERT INTO public.bitacora (idbitacora, idusuario, usuario_nombre, usuario_rol, accion, modulo, descripcion, ip_address, fecha) VALUES (345, NULL, 'Guido Rios', 'client', 'CREATE', 'Reseña', 'Cliente Guido Rios calificó la venta #11 con 1★ — demoraron mucho con mi pedido', '127.0.0.1', '2026-07-05 23:13:17.426564-04');


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categoria (idcategoria, nombre) VALUES (1, 'Laptops');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (2, 'Procesadores');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (3, 'Tarjetas gráficas');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (4, 'Tarjetas madre');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (5, 'Memoria RAM');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (6, 'Discos SSD');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (7, 'Discos HDD');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (8, 'Fuentes de poder');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (9, 'Gabinetes');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (10, 'Refrigeración');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (11, 'Monitores');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (12, 'Teclados');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (13, 'Mouse');
INSERT INTO public.categoria (idcategoria, nombre) VALUES (14, 'Audífonos / Headsets');


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cliente (idcliente, nombre, apellido, usuario_login, correo, sexo, ciudad, telefono, fecha_nacimiento, nit_ci, razon_social, password, total_acumulado, descuento_disponible) VALUES (5, 'Pandora', 'Domiguez', 'Pandora2026', 'villarroeldsharion@gmail.com', 'femenino', 'Santa cruz de la sierra', '78035692', '2002-02-02', '6339333', 'Telchi', 'pbkdf2_sha256$600000$aWyxdAQOxODpVce6eXcixQ$uFuPbqkCknsako8i8x3mmcqXCqNTTU2neIFDni2AsxU=', 0.00, 0.00);
INSERT INTO public.cliente (idcliente, nombre, apellido, usuario_login, correo, sexo, ciudad, telefono, fecha_nacimiento, nit_ci, razon_social, password, total_acumulado, descuento_disponible) VALUES (6, 'Perez', 'domingo', 'Perez1', 'perez@gmail.com', 'masculino', 'Santa cruz de la sierra', '7946323', '2000-02-10', '13131313', 'Telchi', 'pbkdf2_sha256$600000$87t7b9IAGFmLi8h4cTdi8O$+CribjDEzm+aSHrSKJ9rsSQHZPmuSdqvDZ6TBc1XNxM=', 0.00, 0.00);
INSERT INTO public.cliente (idcliente, nombre, apellido, usuario_login, correo, sexo, ciudad, telefono, fecha_nacimiento, nit_ci, razon_social, password, total_acumulado, descuento_disponible) VALUES (7, 'Diogo', '', 'diogo123', '76847107.wr@gmail.com', NULL, NULL, '76847107', NULL, NULL, NULL, 'pbkdf2_sha256$600000$BbLNwqClBYaZl2ant6mZXn$bqBfUF6p/vasXYF00R5VVW7W0q/pWMz8xKuCj9KJ/8I=', 0.00, 0.00);
INSERT INTO public.cliente (idcliente, nombre, apellido, usuario_login, correo, sexo, ciudad, telefono, fecha_nacimiento, nit_ci, razon_social, password, total_acumulado, descuento_disponible) VALUES (8, 'Manuel', 'Moya Bustamante', 'Manuel123', 'moyajosemanuel53@gmail.com', 'masculino', 'Santa cruz', '+591 789456', '2026-07-05', '123456', 'empresa srl', 'pbkdf2_sha256$600000$XQMzHh0lk3tCnC4PXoW28c$JO17VOrWNSXKYojYirejFJGlh5mHGBifK7pWlbRZPSI=', 0.00, 0.00);
INSERT INTO public.cliente (idcliente, nombre, apellido, usuario_login, correo, sexo, ciudad, telefono, fecha_nacimiento, nit_ci, razon_social, password, total_acumulado, descuento_disponible) VALUES (4, 'Guido', 'Rios', 'Guido123', 'GuidoRios@gmail.com', 'masculino', 'Santa cruz de la sierra', '7861616', '2000-06-08', '962813164', 'Unifranz', 'pbkdf2_sha256$600000$TF0ZC5suv1jWL3oZAFVr8a$Bcj7zPMpUGL4e2Qf+pKZqHI3Wtkq1VR0ElmCSwT0TCA=', 53610.00, 400.00);


--
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.compra (idcompra, idproveedor, fecha_compra, monto_total) VALUES (1, 3, '2026-05-10 19:14:20.029636', 9000.00);
INSERT INTO public.compra (idcompra, idproveedor, fecha_compra, monto_total) VALUES (2, 5, '2026-05-10 19:16:31.273628', 25000.00);
INSERT INTO public.compra (idcompra, idproveedor, fecha_compra, monto_total) VALUES (3, 5, '2026-05-10 19:18:21.694612', 235200.00);
INSERT INTO public.compra (idcompra, idproveedor, fecha_compra, monto_total) VALUES (4, 6, '2026-05-10 19:19:10.115905', 83400.00);
INSERT INTO public.compra (idcompra, idproveedor, fecha_compra, monto_total) VALUES (5, 2, '2026-05-10 19:20:20.398938', 66900.00);
INSERT INTO public.compra (idcompra, idproveedor, fecha_compra, monto_total) VALUES (6, 4, '2026-05-10 19:22:00.16597', 31200.00);


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (15, 8, 'MSI MAG A750GL PCIE5', 'MSI', 'MAG A750GL PCIE5', 'productos/MSI_MAG_A750GL_PCIE5.jpg', 600.00, 900.00, 15, 3, 'fuente de alimentación compacta totalmente modular para juegos de 750 W, 80+ Gold, ATX 3.1 y PCIe 5.1 listo, cable nativo de 12 V-2 x 6 de doble color', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (9, 12, 'Razer BlackWidow V4 X', 'Razer', 'BlackWidow V4 X', 'productos/Razer_BlackWidow_V4_X.jpg', 400.00, 700.00, 15, 3, 'Teclado mecánico para juegos: interruptores amarillos lineales y silenciosos - 6 teclas macro - Chroma RGB - Teclas ABS Doubleshot - Teclas de rodillo y medios', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (23, 5, 'TEAMGROUP T-Force Delta RGB DDR5 Ram 32 GB (2 x 16 GB)', 'TEAMGROUP', 'T-Force DDR5 Ram 32 GB', 'productos/TEAMGROUP_T-Force_Delta_RGB_DDR5_Ram_32_GB.jpg', 3200.00, 4000.00, 15, 1, NULL, 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (5, 13, 'Logitech G305 Lightspeed Wireless', 'Logitech', 'G305 Lightspeed Wireless', 'productos/Logitech_G305.jpg', 200.00, 320.00, 18, 2, 'Mouse inalámbrico para juegos, sensor Hero 12K, 12,000 DPI, ligero, 6 botones programables, duración de batería de 250 horas', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (7, 6, 'Samsung 990 PRO SSD 1TB PCIe 4.0 M.2', 'Samsung', '990 PRO SSD 1TB', 'productos/samsung-980-pro-m2-1tb-pci-express-40-v-nand-mlc-nvme.jpg', 1000.00, 2000.00, 19, 2, 'M.2 2280 Disco duro interno de estado sólido, velocidades de lectura secuencial de hasta 7,450 MB/s para computación de alta gama', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (18, 7, 'Seagate SkyHawk 1TB', 'Seagate', 'SkyHawk 1TB', 'productos/Seagate_SkyHawk.jpg', 250.00, 380.00, 13, 2, 'Disco duro de vigilancia de 1TB - SATA 6Gb/s 64MB Cache, disco interno de 3.5 pulgadas', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (20, 6, 'Western Digital 1TB', 'Western Digital', '1TB WD Blue', 'productos/Western_Digital_1TB.jpg', 850.00, 1250.00, 14, 3, '1TB WD Blue SA510 SATA Disco duro SSD interno de estado sólido – SATA III 6 Gb/s, 2.5"/7mm, hasta 560 MB/s', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (30, 2, 'Intel Core i5-14400F', 'Intel', 'Core i5-14400F', 'productos/Intel_Core_i5-14400F.jpg', 2000.00, 2350.00, 11, 3, 'Core i5-14400F Procesador de escritorio 10 núcleos (6 núcleos P + 4 núcleos E) hasta 4.7 GHz, 0 núcleos (6 núcleos P más 4 núcleos E) y 16 hilos', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (16, 8, 'Corsair RM750e', 'Corsair', 'RM750e', 'productos/CORSAIR_RM750e.jpg', 500.00, 720.00, 11, 3, 'ATX 3.1 PCIe 5.1 Ready Fuente de alimentación completamente modular de 750 W – Cable 12V-2x6 incluido, Eficiencia Cybenetics Gold, condensadores con clasificación de temperatura de 105', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (24, 4, 'MSI PRO B550M-VC', 'MSI', 'PRO B550M-VC', 'productos/MSI_PRO_B550M-VC.jpg', 1600.00, 2300.00, 13, 2, 'WiFi ProSeries Placa base (AMD Ryzen 5000 Series, AM4, DDR4, PCIe 4.0, SATA 6Gb/s, M.2, USB 3.2 Gen 2, HDMI/DP, Wi-Fi 6E, Bluetooth 5.2, mATX)', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (19, 6, 'Crucial BX500 1TB', 'Crucial', 'BX500 1TB', 'productos/Crucial_BX500_1TB.jpg', 900.00, 1200.00, 15, 4, '1TB 3D NAND SATA SSD interno de 2.5 pulgadas, hasta 540MB/s - CT1000BX500SSD1, unidad de estado sólido', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (14, 11, 'Acer KB242Y', 'Acer', 'KB242Y', 'productos/Acer_KB242Y.jpg', 500.00, 850.00, 15, 2, 'Monitor IPS de marco cero Full HD (1920 x 1080) de 23.8 pulgadas | Inclinación | Actualización de hasta 120 Hz | 1 ms (VRB) | sRGB 99% | Puertos HDMI y VGA |', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (29, 2, 'Intel Core Ultra 9 285K', 'Intel', 'Core Ultra 9 285K', 'productos/Intel_Core_Ultra_9_285K.jpg', 4000.00, 5200.00, 15, 3, 'Ultra 9 285K Tetracosa-core [24 núcleos] Procesador 3.70 GHz, 24 núcleos (8 núcleos P más 16 núcleos E) y 24 hilos', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (28, 3, 'EVGA GeForce RTX 3070 FTW3 Ultra Gaming 8GB GDDR6', 'EVGA', 'RTX 3070 8GB GDDR6', 'productos/EVGA_GeForce_RTX_3070_FTW3_Ultra_Gaming.jpg', 2300.00, 2800.00, 15, 3, 'RTX 3070 FTW3 Ultra Gaming, 08G-P5-3767-KL, 8GB GDDR6, tecnología iCX3, LED ARGB, placa trasera de metal, LHR', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (10, 12, 'Corsair K70 Core RGB', 'Corsair', 'K70 Core RGB', 'productos/Corsair_K70_Core_RGB.jpg', 400.00, 650.00, 15, 3, 'Teclado mecánico con cable para juegos con reposa muñeca – Interruptores lineales MLX Rojos pre-lubricados, SOCD, teclas ABS Double-Shot, amortiguación de sonido', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (27, 3, 'ASUS Dual GeForce RTX™ 5060 8GB GDDR7 OC Edition', 'Asus', 'RTX™ 5060 8GB Dual', 'productos/ASUS_Dual_GeForce_RTX_5060_8GB_GDDR7_OC_Edition.jpg', 2500.00, 3150.00, 15, 2, 'RTX™ 5060 8GB GDDR7 OC Edition (PCIe 5.0, 8GB GDDR7, DLSS 4, HDMI 2.1b, DisplayPort 2.1b, diseño de 2.5 ranuras, diseño de ventilador Axial-tech, tecnología 0dB y más)', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (26, 4, 'ASUS ROG Strix B650-A Gaming WiFi AMD', 'Asus', 'ROG Strix B650-A', 'productos/ASUS_ROG_Strix_B650-A_Gaming_WiFi_AMD_B650.jpg', 1200.00, 1550.00, 15, 3, 'WiFi AMD B650 AM5 Ryzen™ Desktop 9000 8000 y 7000 ATX placa base, 12 + 2 etapas de potencia, DDR5, ranura M.2 3x, PCIe® 4.0, LAN 2.5G, WiFi 6E, USB 3.2 Gen 2x2 Tipo-C ®, Aura Sync', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (22, 5, 'Corsair Vengeance DDR5 32 GB(2 x 16 GB)', 'Corsair', 'Vengeance DDR5 32 GB', 'productos/CORSAIR_Vengeance_DDR5_32_GB.jpg', 2500.00, 3250.00, 15, 3, 'DDR5 32 GB (2 x 16 GB) DDR5 6000 MHz CL36 AMD Expo Intel XMP iCUE Memoria de computadora compatible', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (17, 7, 'Western Digital (WD) BLUE Desktop 1TB', 'Western Digital', 'BLUE Desktop 1TB', 'productos/Western_Digital_WD_BLUE_Desktop_1TB.jpg', 500.00, 650.00, 20, 4, '1 terabyte) unidad de disco duro de 3.5 pulgadas, 5400 ~ 7200 RPM, SATA3 (6.0 GB/s), caché de 64 MB, ideal para aplicaciones PC/Mac/CCTV/NAS/DVR/Raid y SATA', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (21, 5, 'Kingston FURY Beast 8GB DDR4', 'Kingston', 'FURY Beast 8GB DDR4', 'productos/Kingston_FURY_Beast_8GB.jpg', 500.00, 850.00, 16, 2, 'Memoria de escritorio de 8 GB 3200 MHz DDR4 CL16 KF432C16BB/8', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (25, 4, 'GIGABYTE X870 AORUS Elite WIFI7', 'GIGABYTE', 'X870 AORUS Elite WIFI7', 'productos/GIGABYTE_X870_AORUS.jpg', 1600.00, 2000.00, 15, 3, 'WIFI7 ICE AMD AM5 LGA 1718 Placa base, ATX, DDR5, 4X M.2, PCIe 5.0, USB4, WIFI7, LAN de 2.5GbE, EZ-Latch', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (6, 13, 'Corsair M75 AIR 2.4 GHz', 'Corsair', 'M75 AIR', 'productos/CORSAIR_M75_AIR_WIRELESS.jpg', 500.00, 700.00, 25, 2, 'Mouse inalámbrico ultra ligero para juegos - 2.4 GHz y Bluetooth - 26,000 DPI - Batería de hasta 100 horas', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (11, 12, 'Redragon K617 HE', 'Redragon', 'K617 HE', 'productos/Redragon_K617_HE.jpg', 150.00, 300.00, 15, 2, 'eclado Gaming de Activación Rápida, 60% 61 Teclas Teclado Mecánico Cableado con Activación Hiper-Rápida, Interruptor Magnético de Efecto Hall Dedicado', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (38, NULL, 'CORSAIR ATX 4000D', 'Corsair', 'ATX 4000D', 'productos/CORSAIR_Carcasa_para_PC_ATX_de_torre_media_modular_4000D_RS_ARGB_Frame_Soh6iRc.jpg', 600.00, 1000.00, 15, 2, 'Torre media modular 4000D RS ARGB Frame - Alto flujo de aire, 3 ventiladores RS ARGB preinstalados, sistema de montaje de ventilador InfiniRail™, ASUS BTF, MSI Project', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (33, 2, 'Amd Ryzen 5 9600X', 'Amd', 'Ryzen 5 9600X', 'productos/Amd_Ryzen_5_9600X.jpg', 1200.00, 1650.00, 15, 3, '6 núcleos y 12 hilos de procesamiento, basado en la arquitectura AMD "Zen 5", Max Boost de 5.4 GHz, desbloqueado para overclocking, 38 MB de caché, compatible con DDR5-5600', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (35, 1, 'ASUS TUF Gaming F16 (2025)', 'Asus', 'TUF Gaming F16 (2025)', 'productos/ASUS_TUF_Gaming_F16_2025.jpg', 8000.00, 9500.00, 13, 3, 'aptop para juegos, pantalla FHD+ 165Hz 16:10 de 16 pulgadas, procesador Intel Core i5 13450HX, NVIDIA® GeForce RTX™ 5050, DDR5 de 16 GB, SSD PCIe Gen4 de 512 GB, Wi-Fi 6E', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (12, 11, 'ASUS TUF Gaming VG27AQ3A', 'Asus', 'TUF Gaming VG27AQ3A', 'productos/ASUS_TUF_Gaming_VG27AQ3A.jpg', 1200.00, 1850.00, 15, 2, 'Monitor de 27 pulgadas, resolución 1440P HDR, QHD (2560 x 1440), 180Hz, 1ms, IPS rápido, 130% sRGB, Extreme Low Motion Blur Sync, altavoces, FreeSync Premium', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (8, 13, 'ASUS ROG Gladius III', 'Asus', 'ROG Gladius III', 'productos/Asus_Rog_Gladius_3.jpg', 500.00, 700.00, 15, 2, 'Mouse inalámbrico para juegos Aimpoint, ergonómico para diestros, 2.79 oz, conectividad trimodo, 36K DPI, batería de hasta 119 horas', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (13, 11, 'LG 27U411A-B 27', 'LG', '27U411A-B 27', 'productos/LG_27U411A-B_27.jpg', 550.00, 800.00, 15, 2, 'Full HD (1920 x 1080) Monitor IPS para computadora, 120Hz, HDR10, Modo Lector, Seguro contra parpadeos, HDMI, Base delgada, Negro', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (32, 2, 'AMD RYZEN 7 9800X3D', 'Amd', 'RYZEN 7 9800X3D', 'productos/AMD_RYZEN_7_9800X3D.jpg', 3000.00, 3800.00, 13, 3, '8 núcleos y 16 hilos, ofreciendo un aumento de IPC de +~16% y gran eficiencia energética,El procesador de juegos más rápido del mundo, construido con la tecnología AMD ''Zen5'' y la V-Cache 3D de próxima generación', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (31, 2, 'Intel Core i3-12100F', 'Intel', 'Core i3-12100F', 'productos/Intel_Core_i3-12100F.jpg', 1100.00, 1450.00, 13, 3, 'i3-12100F de 12ª generación, con soporte PCIe Gen 5.0 y 4.0, compatibilidad con DDR5 y DDR4, 4 núcleos (4P-0E), frecuencia Turbo de hasta 4.3 GHz', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (34, 2, 'Amd Ryzen 9 9900X', 'Amd', 'Ryzen 9 9900X', 'productos/Amd_Ryzen_9_9900X.jpg', 3200.00, 3750.00, 14, 3, '12 núcleos y 24 hilos de procesamiento, basado en la arquitectura AMD "Zen 5", compatible con DDR5-5600, Max Boost de 5.6 GHz', 12);
INSERT INTO public.producto (idproducto, idcategoria, nombre, marca, modelo, imagen_url, precio_compra, precio_actual, stock_fisico, stock_minimo, descripcion, meses_garantia) VALUES (36, 1, 'Acer Nitro V', 'Acer', 'Nitro V', 'productos/Acer_Nitro_V.jpg', 8500.00, 9800.00, 13, 3, 'Procesador Intel Core i9-13900H | GPU NVIDIA GeForce RTX 5060 para portátil | Pantalla IPS FHD de 15.6" a 165Hz | 16 GB DDR4 | SSD Gen 4 de 1 TB | Wi-Fi 6 | Teclado', 12);


--
-- Data for Name: detallecompra; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (1, 1, 38, 15, 600.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (2, 2, 16, 10, 500.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (3, 2, 10, 10, 400.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (4, 2, 6, 10, 500.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (5, 2, 9, 10, 400.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (6, 2, 11, 10, 150.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (7, 2, 13, 10, 550.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (8, 3, 36, 11, 8500.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (9, 3, 14, 11, 500.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (10, 3, 34, 11, 3200.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (11, 3, 33, 10, 1200.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (12, 3, 32, 6, 3000.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (13, 3, 31, 10, 1100.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (14, 3, 30, 10, 2000.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (15, 3, 29, 10, 4000.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (16, 4, 28, 10, 2300.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (17, 4, 25, 10, 1600.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (18, 4, 24, 10, 1600.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (19, 4, 15, 10, 600.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (20, 4, 23, 7, 3200.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (21, 5, 27, 11, 2500.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (22, 5, 35, 2, 8000.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (23, 5, 12, 6, 1200.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (24, 5, 26, 11, 1200.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (25, 5, 8, 6, 500.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (26, 6, 22, 7, 2500.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (27, 6, 21, 8, 500.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (28, 6, 20, 5, 850.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (29, 6, 19, 5, 900.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (30, 6, 18, 1, 250.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (31, 6, 13, 1, 550.00);
INSERT INTO public.detallecompra (iddetallecompra, idcompra, idproducto, cantidad, costo_unitario) VALUES (32, 6, 11, 1, 150.00);


--
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (1, 4, 1, '2026-06-08 02:24:22.788052', 4700.00, 'completed', 'entregado', false, 0.00, NULL);
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (2, 4, 1, '2026-07-02 02:24:22.883914', 5950.00, 'completed', 'entregado', false, 0.00, NULL);
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (3, 4, 1, '2026-06-16 02:24:22.898975', 1440.00, 'completed', 'entregado', false, 0.00, NULL);
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (4, 4, 1, '2026-06-22 02:24:22.908665', 1440.00, 'completed', 'entregado', false, 0.00, NULL);
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (5, 4, 1, '2026-07-03 02:24:22.918963', 4600.00, 'completed', 'entregado', false, 0.00, NULL);
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (6, 4, NULL, '2026-07-05 02:59:57.56348', 380.00, 'pending', 'pendiente', true, 0.00, NULL);
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (8, 4, 4, '2026-07-05 03:39:23.72731', 9500.00, 'completed', 'pendiente', true, 0.00, NULL);
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (10, 4, 4, '2026-07-05 04:03:50.748039', 9500.00, 'completed', 'pendiente', true, 0.00, 'comprobantes/comprobante.jpg');
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (9, 4, 4, '2026-07-05 03:46:09.297168', 7400.00, 'completed', 'pendiente', true, 200.00, NULL);
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (7, 4, 4, '2026-07-05 03:00:13.803586', 380.00, 'completed', 'pendiente', true, 0.00, NULL);
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (11, 4, 4, '2026-07-05 04:17:42.192559', 2700.00, 'completed', 'pendiente', true, 200.00, 'comprobantes/comprobante_vyEz7Pw.jpg');
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (12, 4, NULL, '2026-07-05 04:20:40.718988', 3550.00, 'pending', 'pendiente', true, 200.00, '');
INSERT INTO public.venta (idventa, idcliente, idusuario, fecha_venta, monto_total, estado, estado_entrega, pedido_online, descuento_aplicado, comprobante_url) VALUES (13, 4, 4, '2026-07-06 03:10:00.075867', 19600.00, 'completed', 'pendiente', true, 0.00, 'comprobantes/comprobante_K50ulbL.jpg');


--
-- Data for Name: detalleventa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (1, 1, 30, 2, 2350.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (2, 2, 20, 1, 1250.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (3, 2, 30, 2, 2350.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (4, 3, 16, 2, 720.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (5, 4, 16, 2, 720.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (6, 5, 24, 2, 2300.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (7, 6, 18, 1, 380.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (8, 7, 18, 1, 380.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (9, 8, 35, 1, 9500.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (10, 9, 32, 2, 3800.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (11, 10, 35, 1, 9500.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (12, 11, 31, 2, 1450.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (13, 12, 34, 1, 3750.00);
INSERT INTO public.detalleventa (iddetalle, idventa, idproducto, cantidad, precio_unitario) VALUES (14, 13, 36, 2, 9800.00);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2026-05-10 07:34:48.051981-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2026-05-10 07:34:48.164046-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2026-05-10 07:34:48.185009-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2026-05-10 07:34:48.189092-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2026-05-10 07:34:48.193193-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2026-05-10 07:34:48.206874-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2026-05-10 07:34:48.211889-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2026-05-10 07:34:48.216436-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2026-05-10 07:34:48.220754-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2026-05-10 07:34:48.225782-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2026-05-10 07:34:48.22726-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2026-05-10 07:34:48.231978-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2026-05-10 07:34:48.245041-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2026-05-10 07:34:48.250253-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2026-05-10 07:34:48.256009-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2026-05-10 07:34:48.265666-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2026-05-10 07:34:48.270694-04');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'sessions', '0001_initial', '2026-05-10 07:34:48.287698-04');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('nh4la8kcv0m7g1kj072uosg8pd59mq6r', '.eJxVjDsOwyAQBe9CHSHDml_K9D4DWmAJTiKQjF1FuXtsyUXSzsx7b-ZxW4vfOi1-TuzKBLv8soDxSfUQ6YH13nhsdV3mwI-En7bzqSV63c7276BgL_sapXFodcqI0YECFVxOWY2OLAUZzI4yStIyEypBRkUEa0AMw2gJNLDPF__KOA4:1wM8EQ:kpbpvPFI89sL-x1tflz0JSuGT-w1kq9kYPiJtr1pZhg', '2026-05-24 13:46:22.996907-04');


--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.factura (idfactura, idventa, nro_factura, cuf, cufd, estado_siat, fecha_emision) VALUES (1, 8, 8, 'PENDIENTE-8', 'PENDIENTE-8', 'PENDIENTE', '2026-07-05 03:42:02.285299');
INSERT INTO public.factura (idfactura, idventa, nro_factura, cuf, cufd, estado_siat, fecha_emision) VALUES (2, 11, 11, 'PENDIENTE-11', 'PENDIENTE-11', 'PENDIENTE', '2026-07-05 22:53:40.378918');


--
-- Data for Name: garantia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (1, 5, 6, 24, 4, 2, 12, '2026-07-03', '2027-07-03', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (2, 2, 2, 20, 4, 1, 12, '2026-07-02', '2027-07-02', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (3, 2, 3, 30, 4, 2, 12, '2026-07-02', '2027-07-02', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (4, 4, 5, 16, 4, 2, 12, '2026-06-22', '2027-06-22', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (5, 3, 4, 16, 4, 2, 12, '2026-06-16', '2027-06-16', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (6, 1, 1, 30, 4, 2, 12, '2026-06-08', '2027-06-08', 'reclamada', 'Falla reportada por el cliente', '2026-07-05 02:24:28.268723', NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (7, 6, 7, 18, 4, 1, 12, '2026-07-05', '2027-07-05', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (8, 7, 8, 18, 4, 1, 12, '2026-07-05', '2027-07-05', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (9, 8, 9, 35, 4, 1, 12, '2026-07-05', '2027-07-05', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (10, 9, 10, 32, 4, 2, 12, '2026-07-05', '2027-07-05', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (11, 10, 11, 35, 4, 1, 12, '2026-07-05', '2027-07-05', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (12, 11, 12, 31, 4, 2, 12, '2026-07-05', '2027-07-05', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (13, 12, 13, 34, 4, 1, 12, '2026-07-05', '2027-07-05', 'activa', NULL, NULL, NULL, NULL);
INSERT INTO public.garantia (idgarantia, idventa, iddetalle, idproducto, idcliente, cantidad, meses, fecha_inicio, fecha_fin, estado, motivo_reclamo, fecha_reclamo, resolucion, fecha_resolucion) VALUES (14, 13, 14, 36, 4, 2, 12, '2026-07-06', '2027-07-06', 'activa', NULL, NULL, NULL, NULL);


--
-- Data for Name: pagoventa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pagoventa (idpagoventa, idventa, monto, metodo, fecha) VALUES (1, 6, 380.00, 'tarjeta', '2026-07-05 02:59:57.596679');
INSERT INTO public.pagoventa (idpagoventa, idventa, monto, metodo, fecha) VALUES (2, 7, 380.00, 'tarjeta', '2026-07-05 03:00:13.819803');
INSERT INTO public.pagoventa (idpagoventa, idventa, monto, metodo, fecha) VALUES (3, 8, 9500.00, 'transferencia', '2026-07-05 03:39:23.760277');
INSERT INTO public.pagoventa (idpagoventa, idventa, monto, metodo, fecha) VALUES (4, 9, 7400.00, 'transferencia', '2026-07-05 03:46:09.331082');
INSERT INTO public.pagoventa (idpagoventa, idventa, monto, metodo, fecha) VALUES (5, 10, 9500.00, 'transferencia', '2026-07-05 04:03:50.7875');
INSERT INTO public.pagoventa (idpagoventa, idventa, monto, metodo, fecha) VALUES (6, 11, 2700.00, 'transferencia', '2026-07-05 04:17:42.236721');
INSERT INTO public.pagoventa (idpagoventa, idventa, monto, metodo, fecha) VALUES (7, 12, 3550.00, 'tarjeta', '2026-07-05 04:20:40.749185');
INSERT INTO public.pagoventa (idpagoventa, idventa, monto, metodo, fecha) VALUES (8, 13, 19600.00, 'transferencia', '2026-07-06 03:10:00.623864');


--
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.proveedor (idproveedor, nombre_empresa, nit, razon_social, contacto_nombre, telefono, correo, direccion, ciudad, activo, fecha_registro) VALUES (2, 'Asus', '2532131355', 'Asus Company', 'Roberto Eguez', '78035921', 'Roberto@gmail.com', 'Av. Pirai 2 anillo, calle espejo N° 22', 'Beni', true, '2026-05-09 01:57:59.298108-04');
INSERT INTO public.proveedor (idproveedor, nombre_empresa, nit, razon_social, contacto_nombre, telefono, correo, direccion, ciudad, activo, fecha_registro) VALUES (3, 'TecnoImport Bolivia', '10234567', 'TecnoImport Bolivia S.R.L.', 'Carlos Mendoza', '72145678', 'ventas@tecnoimport.com', 'Av. Cristo Redentor #2450', 'Santa Cruz', true, '2026-05-10 03:48:20.05205-04');
INSERT INTO public.proveedor (idproveedor, nombre_empresa, nit, razon_social, contacto_nombre, telefono, correo, direccion, ciudad, activo, fecha_registro) VALUES (4, 'Digital Hardware Center', '20456789', 'Digital Hardware Center Ltda.', 'Mariana López', '75588991', 'contacto@digitalhardware.bo', 'Calle Comercio #1180', 'La Paz', true, '2026-05-10 03:49:10.424973-04');
INSERT INTO public.proveedor (idproveedor, nombre_empresa, nit, razon_social, contacto_nombre, telefono, correo, direccion, ciudad, activo, fecha_registro) VALUES (5, 'Infinity Tech Store', '73455621', 'Infinity Tech Store Ltda.', 'Andrea Méndez', '74561230', 'contacto@infinitytech.bo', 'Calle Aroma #845', 'Cochabamba', true, '2026-05-10 03:50:07.453948-04');
INSERT INTO public.proveedor (idproveedor, nombre_empresa, nit, razon_social, contacto_nombre, telefono, correo, direccion, ciudad, activo, fecha_registro) VALUES (6, 'CyberZone Bolivia', '95678234', 'CyberZone Bolivia S.R.L.', 'Valeria Ortiz', '71122334', 'soporte@cyberzone.bo', 'Calle Junín #455', 'Sucre', true, '2026-05-10 03:59:35.87646-04');


--
-- Data for Name: resena; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.resena (idresena, idventa, idcliente, puntuacion, comentario, estado, fecha) VALUES (1, 5, 4, 4, 'Muy buen producto, recomendado', 'visible', '2026-07-05 02:24:28.290086');
INSERT INTO public.resena (idresena, idventa, idcliente, puntuacion, comentario, estado, fecha) VALUES (2, 2, 4, 5, 'Muy buen producto, recomendado', 'visible', '2026-07-05 02:24:28.304568');
INSERT INTO public.resena (idresena, idventa, idcliente, puntuacion, comentario, estado, fecha) VALUES (3, 4, 4, 5, 'Excelente servicio', 'visible', '2026-07-05 02:24:28.312192');
INSERT INTO public.resena (idresena, idventa, idcliente, puntuacion, comentario, estado, fecha) VALUES (4, 3, 4, 3, 'Muy buen producto, recomendado', 'visible', '2026-07-05 02:24:28.321795');
INSERT INTO public.resena (idresena, idventa, idcliente, puntuacion, comentario, estado, fecha) VALUES (5, 1, 4, 3, 'Excelente servicio', 'visible', '2026-07-05 02:24:28.330626');
INSERT INTO public.resena (idresena, idventa, idcliente, puntuacion, comentario, estado, fecha) VALUES (6, 13, 4, 4, 'execelente producto', 'visible', '2026-07-06 03:12:39.948573');
INSERT INTO public.resena (idresena, idventa, idcliente, puntuacion, comentario, estado, fecha) VALUES (7, 11, 4, 1, 'demoraron mucho con mi pedido', 'visible', '2026-07-06 03:13:17.408378');


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: bitacora_idbitacora_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bitacora_idbitacora_seq', 345, true);


--
-- Name: categoria_idcategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 14, true);


--
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cliente_idcliente_seq', 8, true);


--
-- Name: compra_idcompra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.compra_idcompra_seq', 6, true);


--
-- Name: detallecompra_iddetallecompra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.detallecompra_iddetallecompra_seq', 32, true);


--
-- Name: detalleventa_iddetalle_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.detalleventa_iddetalle_seq', 14, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: factura_idfactura_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.factura_idfactura_seq', 2, true);


--
-- Name: garantia_idgarantia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.garantia_idgarantia_seq', 14, true);


--
-- Name: pagoventa_idpagoventa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pagoventa_idpagoventa_seq', 8, true);


--
-- Name: producto_idproducto_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.producto_idproducto_seq', 39, true);


--
-- Name: proveedor_idproveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.proveedor_idproveedor_seq', 6, true);


--
-- Name: resena_idresena_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.resena_idresena_seq', 7, true);


--
-- Name: usuario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_idusuario_seq', 5, true);


--
-- Name: venta_idventa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.venta_idventa_seq', 13, true);


--
-- PostgreSQL database dump complete
--

\unrestrict Hkd9OdLAyHtYx4fNpgcNpqEhIA0IZ160DtjPuh3iCqrG3u63LtrezGUF3rzynSc

