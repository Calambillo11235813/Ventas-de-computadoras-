--
-- PostgreSQL database dump
--


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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS '';


--
-- Name: estado_entrega; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.estado_entrega AS ENUM (
    'pendiente',
    'entregado'
);


--
-- Name: estado_siat; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.estado_siat AS ENUM (
    'PENDIENTE',
    'ACEPTADO',
    'RECHAZADO',
    'ANULADO'
);


--
-- Name: estado_venta; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.estado_venta AS ENUM (
    'pending',
    'completed'
);


--
-- Name: metodo_pago_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.metodo_pago_enum AS ENUM (
    'qr',
    'transferencia',
    'efectivo',
    'tarjeta'
);


--
-- Name: trg_actualizar_estado_venta(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_actualizar_estado_venta() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

DECLARE

    v_total DECIMAL(10,2);

    v_pagado DECIMAL(10,2);

    v_idventa INT;

    v_pedido_online BOOLEAN;

BEGIN

    -- Obtenemos el ID de la venta afectada

    v_idventa := COALESCE(NEW.IdVenta, OLD.IdVenta);



    -- Obtenemos datos actuales de la venta

    SELECT monto_total, pedido_online

    INTO v_total, v_pedido_online

    FROM Venta

    WHERE IdVenta = v_idventa;



    -- LÓGICA DE NEGOCIO:

    -- Si es pedido online, NO actualizamos el estado automáticamente.

    -- Esto obliga a que el vendedor valide el pago y el stock antes de pasar a 'completed'.

    IF v_pedido_online THEN

        RETURN NULL; 

    END IF;



    -- Si es venta física (tienda), procedemos con la automatización normal

    SELECT COALESCE(SUM(monto), 0)

    INTO v_pagado

    FROM PagoVenta

    WHERE IdVenta = v_idventa;



    IF v_pagado >= v_total AND v_total > 0 THEN

        UPDATE Venta SET estado = 'completed' WHERE IdVenta = v_idventa;

    ELSE

        UPDATE Venta SET estado = 'pending' WHERE IdVenta = v_idventa;

    END IF;



    RETURN NULL;

END;

$$;


--
-- Name: trg_actualizar_total_compra(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_actualizar_total_compra() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN



UPDATE Compra

SET monto_total = (

    SELECT COALESCE(

        SUM(cantidad * costo_unitario),

        0

    )

    FROM DetalleCompra

    WHERE IdCompra = COALESCE(NEW.IdCompra, OLD.IdCompra)

)

WHERE IdCompra = COALESCE(NEW.IdCompra, OLD.IdCompra);



RETURN NULL;



END;

$$;


--
-- Name: trg_actualizar_total_venta(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_actualizar_total_venta() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN



UPDATE Venta

SET monto_total = (

    SELECT COALESCE(

        SUM(subtotal),

        0

    )

    FROM DetalleVenta

    WHERE IdVenta = COALESCE(NEW.IdVenta, OLD.IdVenta)

)

WHERE IdVenta = COALESCE(NEW.IdVenta, OLD.IdVenta);



RETURN NULL;



END;

$$;


--
-- Name: trg_gestionar_stock_venta(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_gestionar_stock_venta() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN



IF TG_OP = 'INSERT' THEN



    UPDATE Producto

    SET stock_fisico = stock_fisico - NEW.cantidad

    WHERE IdProducto = NEW.IdProducto;



END IF;



IF TG_OP = 'UPDATE' THEN



    UPDATE Producto

    SET stock_fisico =

        stock_fisico + OLD.cantidad - NEW.cantidad

    WHERE IdProducto = NEW.IdProducto;



END IF;



IF TG_OP = 'DELETE' THEN



    UPDATE Producto

    SET stock_fisico = stock_fisico + OLD.cantidad

    WHERE IdProducto = OLD.IdProducto;



END IF;



RETURN NULL;



END;

$$;


--
-- Name: trg_sumar_stock_compra(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_sumar_stock_compra() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN



UPDATE Producto

SET stock_fisico = stock_fisico + NEW.cantidad

WHERE IdProducto = NEW.IdProducto;



RETURN NEW;



END;

$$;


--
-- Name: trg_validar_stock(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_validar_stock() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

DECLARE

v_stock INT;

BEGIN



SELECT stock_fisico

INTO v_stock

FROM Producto

WHERE IdProducto = NEW.IdProducto;



IF v_stock < NEW.cantidad THEN

    RAISE EXCEPTION

    'Stock insuficiente. Disponible: %',

    v_stock;

END IF;



RETURN NEW;



END;

$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bitacora; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bitacora (
    idbitacora integer NOT NULL,
    idusuario integer,
    usuario_nombre character varying(100) DEFAULT ''::character varying NOT NULL,
    usuario_rol character varying(20) DEFAULT ''::character varying NOT NULL,
    accion character varying(30) NOT NULL,
    modulo character varying(50) NOT NULL,
    descripcion text NOT NULL,
    ip_address character varying(45),
    fecha timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: bitacora_idbitacora_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bitacora_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bitacora_idbitacora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bitacora_idbitacora_seq OWNED BY public.bitacora.idbitacora;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- Name: categoria_idcategoria_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categoria_idcategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nombre character varying(150) NOT NULL,
    apellido character varying(150) NOT NULL,
    usuario_login character varying(50),
    correo character varying(100),
    sexo character varying(20),
    ciudad character varying(100),
    telefono character varying(20),
    fecha_nacimiento date,
    nit_ci character varying(20),
    razon_social character varying(150),
    password character varying(255),
    total_acumulado numeric(12,2) DEFAULT 0,
    descuento_disponible numeric(10,2) DEFAULT 0
);


--
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente.idcliente;


--
-- Name: compra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.compra (
    idcompra integer NOT NULL,
    idproveedor integer,
    fecha_compra timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    monto_total numeric(10,2) DEFAULT 0 NOT NULL
);


--
-- Name: compra_idcompra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.compra_idcompra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: compra_idcompra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.compra_idcompra_seq OWNED BY public.compra.idcompra;


--
-- Name: detallecompra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detallecompra (
    iddetallecompra integer NOT NULL,
    idcompra integer,
    idproducto integer,
    cantidad integer NOT NULL,
    costo_unitario numeric(10,2) NOT NULL,
    CONSTRAINT detallecompra_cantidad_check CHECK ((cantidad > 0)),
    CONSTRAINT detallecompra_costo_unitario_check CHECK ((costo_unitario >= (0)::numeric))
);


--
-- Name: detallecompra_iddetallecompra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detallecompra_iddetallecompra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detallecompra_iddetallecompra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detallecompra_iddetallecompra_seq OWNED BY public.detallecompra.iddetallecompra;


--
-- Name: detalleventa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detalleventa (
    iddetalle integer NOT NULL,
    idventa integer,
    idproducto integer,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    subtotal numeric(10,2) GENERATED ALWAYS AS (((cantidad)::numeric * precio_unitario)) STORED,
    CONSTRAINT detalleventa_cantidad_check CHECK ((cantidad > 0)),
    CONSTRAINT detalleventa_precio_unitario_check CHECK ((precio_unitario >= (0)::numeric))
);


--
-- Name: detalleventa_iddetalle_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detalleventa_iddetalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detalleventa_iddetalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detalleventa_iddetalle_seq OWNED BY public.detalleventa.iddetalle;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: factura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factura (
    idfactura integer NOT NULL,
    idventa integer,
    nro_factura bigint NOT NULL,
    cuf character varying(100) NOT NULL,
    cufd character varying(100) NOT NULL,
    estado_siat public.estado_siat DEFAULT 'PENDIENTE'::public.estado_siat,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: factura_idfactura_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factura_idfactura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factura_idfactura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factura_idfactura_seq OWNED BY public.factura.idfactura;


--
-- Name: garantia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.garantia (
    idgarantia integer NOT NULL,
    idventa integer NOT NULL,
    iddetalle integer NOT NULL,
    idproducto integer NOT NULL,
    idcliente integer,
    cantidad integer DEFAULT 1,
    meses integer DEFAULT 0,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    estado character varying(20) DEFAULT 'activa'::character varying,
    motivo_reclamo text,
    fecha_reclamo timestamp without time zone,
    resolucion text,
    fecha_resolucion timestamp without time zone
);


--
-- Name: garantia_idgarantia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.garantia_idgarantia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: garantia_idgarantia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.garantia_idgarantia_seq OWNED BY public.garantia.idgarantia;


--
-- Name: pagoventa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pagoventa (
    idpagoventa integer NOT NULL,
    idventa integer,
    monto numeric(10,2) NOT NULL,
    metodo public.metodo_pago_enum NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pagoventa_monto_check CHECK ((monto > (0)::numeric))
);


--
-- Name: pagoventa_idpagoventa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pagoventa_idpagoventa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagoventa_idpagoventa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pagoventa_idpagoventa_seq OWNED BY public.pagoventa.idpagoventa;


--
-- Name: producto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.producto (
    idproducto integer NOT NULL,
    idcategoria integer,
    nombre character varying(150) NOT NULL,
    marca character varying(50),
    modelo character varying(50),
    imagen_url text,
    precio_compra numeric(10,2),
    precio_actual numeric(10,2) NOT NULL,
    stock_fisico integer DEFAULT 0,
    stock_minimo integer DEFAULT 0,
    descripcion text,
    meses_garantia integer DEFAULT 0,
    CONSTRAINT producto_precio_actual_check CHECK ((precio_actual > (0)::numeric)),
    CONSTRAINT producto_precio_compra_check CHECK ((precio_compra >= (0)::numeric)),
    CONSTRAINT producto_stock_fisico_check CHECK ((stock_fisico >= 0)),
    CONSTRAINT producto_stock_minimo_check CHECK ((stock_minimo >= 0))
);


--
-- Name: producto_idproducto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.producto_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: producto_idproducto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.producto_idproducto_seq OWNED BY public.producto.idproducto;


--
-- Name: proveedor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proveedor (
    idproveedor integer NOT NULL,
    nombre_empresa character varying(150) NOT NULL,
    nit character varying(20) NOT NULL,
    razon_social character varying(150),
    contacto_nombre character varying(100),
    telefono character varying(20),
    correo character varying(100),
    direccion text,
    ciudad character varying(50),
    activo boolean DEFAULT true NOT NULL,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: proveedor_idproveedor_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.proveedor_idproveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proveedor_idproveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.proveedor_idproveedor_seq OWNED BY public.proveedor.idproveedor;


--
-- Name: resena; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resena (
    idresena integer NOT NULL,
    idventa integer NOT NULL,
    idcliente integer NOT NULL,
    puntuacion smallint NOT NULL,
    comentario text,
    estado character varying(20) DEFAULT 'visible'::character varying,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: resena_idresena_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resena_idresena_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resena_idresena_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resena_idresena_seq OWNED BY public.resena.idresena;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    nombre_completo character varying(150) NOT NULL,
    username character varying(50) NOT NULL,
    password_hash text NOT NULL,
    rol character varying(30) NOT NULL,
    activo boolean DEFAULT true,
    email character varying(100),
    telefono character varying(20),
    ciudad character varying(100),
    fecha_nacimiento date,
    CONSTRAINT usuario_rol_check CHECK (((rol)::text = ANY (ARRAY[('admin'::character varying)::text, ('vendedor'::character varying)::text])))
);


--
-- Name: usuario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;


--
-- Name: venta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.venta (
    idventa integer NOT NULL,
    idcliente integer,
    idusuario integer,
    fecha_venta timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    monto_total numeric(10,2) DEFAULT 0 NOT NULL,
    estado public.estado_venta DEFAULT 'pending'::public.estado_venta NOT NULL,
    estado_entrega public.estado_entrega DEFAULT 'pendiente'::public.estado_entrega NOT NULL,
    pedido_online boolean DEFAULT false NOT NULL,
    descuento_aplicado numeric(10,2) DEFAULT 0 NOT NULL,
    comprobante_url character varying(500),
    CONSTRAINT chk_entrega_pago CHECK ((NOT ((estado = 'pending'::public.estado_venta) AND (estado_entrega = 'entregado'::public.estado_entrega))))
);


--
-- Name: venta_idventa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.venta_idventa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: venta_idventa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.venta_idventa_seq OWNED BY public.venta.idventa;


--
-- Name: bitacora idbitacora; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bitacora ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacora_idbitacora_seq'::regclass);


--
-- Name: categoria idcategoria; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);


--
-- Name: cliente idcliente; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);


--
-- Name: compra idcompra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra ALTER COLUMN idcompra SET DEFAULT nextval('public.compra_idcompra_seq'::regclass);


--
-- Name: detallecompra iddetallecompra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detallecompra ALTER COLUMN iddetallecompra SET DEFAULT nextval('public.detallecompra_iddetallecompra_seq'::regclass);


--
-- Name: detalleventa iddetalle; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detalleventa ALTER COLUMN iddetalle SET DEFAULT nextval('public.detalleventa_iddetalle_seq'::regclass);


--
-- Name: factura idfactura; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura ALTER COLUMN idfactura SET DEFAULT nextval('public.factura_idfactura_seq'::regclass);


--
-- Name: garantia idgarantia; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.garantia ALTER COLUMN idgarantia SET DEFAULT nextval('public.garantia_idgarantia_seq'::regclass);


--
-- Name: pagoventa idpagoventa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagoventa ALTER COLUMN idpagoventa SET DEFAULT nextval('public.pagoventa_idpagoventa_seq'::regclass);


--
-- Name: producto idproducto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.producto ALTER COLUMN idproducto SET DEFAULT nextval('public.producto_idproducto_seq'::regclass);


--
-- Name: proveedor idproveedor; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor ALTER COLUMN idproveedor SET DEFAULT nextval('public.proveedor_idproveedor_seq'::regclass);


--
-- Name: resena idresena; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resena ALTER COLUMN idresena SET DEFAULT nextval('public.resena_idresena_seq'::regclass);


--
-- Name: usuario idusuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);


--
-- Name: venta idventa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venta ALTER COLUMN idventa SET DEFAULT nextval('public.venta_idventa_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: bitacora bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (idbitacora);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);


--
-- Name: cliente cliente_correo_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_correo_key UNIQUE (correo);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- Name: cliente cliente_usuario_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_usuario_login_key UNIQUE (usuario_login);


--
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (idcompra);


--
-- Name: detallecompra detallecompra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detallecompra
    ADD CONSTRAINT detallecompra_pkey PRIMARY KEY (iddetallecompra);


--
-- Name: detalleventa detalleventa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detalleventa
    ADD CONSTRAINT detalleventa_pkey PRIMARY KEY (iddetalle);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: factura factura_idventa_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_idventa_key UNIQUE (idventa);


--
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (idfactura);


--
-- Name: garantia garantia_iddetalle_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.garantia
    ADD CONSTRAINT garantia_iddetalle_key UNIQUE (iddetalle);


--
-- Name: garantia garantia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.garantia
    ADD CONSTRAINT garantia_pkey PRIMARY KEY (idgarantia);


--
-- Name: pagoventa pagoventa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagoventa
    ADD CONSTRAINT pagoventa_pkey PRIMARY KEY (idpagoventa);


--
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (idproducto);


--
-- Name: proveedor proveedor_nit_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_nit_key UNIQUE (nit);


--
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (idproveedor);


--
-- Name: resena resena_idventa_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_idventa_key UNIQUE (idventa);


--
-- Name: resena resena_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_pkey PRIMARY KEY (idresena);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- Name: usuario usuario_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_username_key UNIQUE (username);


--
-- Name: venta venta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (idventa);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: idx_bitacora_fecha; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bitacora_fecha ON public.bitacora USING btree (fecha DESC);


--
-- Name: idx_detallecompra_compra; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_detallecompra_compra ON public.detallecompra USING btree (idcompra);


--
-- Name: idx_detallecompra_producto; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_detallecompra_producto ON public.detallecompra USING btree (idproducto);


--
-- Name: idx_detalleventa_producto; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_detalleventa_producto ON public.detalleventa USING btree (idproducto);


--
-- Name: idx_detalleventa_venta; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_detalleventa_venta ON public.detalleventa USING btree (idventa);


--
-- Name: idx_pagoventa_venta; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pagoventa_venta ON public.pagoventa USING btree (idventa);


--
-- Name: idx_producto_categoria; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_producto_categoria ON public.producto USING btree (idcategoria);


--
-- Name: detallecompra trigger_compra_stock; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_compra_stock AFTER INSERT ON public.detallecompra FOR EACH ROW EXECUTE FUNCTION public.trg_sumar_stock_compra();


--
-- Name: pagoventa trigger_estado_venta; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_estado_venta AFTER INSERT OR DELETE OR UPDATE ON public.pagoventa FOR EACH ROW EXECUTE FUNCTION public.trg_actualizar_estado_venta();


--
-- Name: detalleventa trigger_stock_venta; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_stock_venta AFTER INSERT OR DELETE OR UPDATE ON public.detalleventa FOR EACH ROW EXECUTE FUNCTION public.trg_gestionar_stock_venta();


--
-- Name: detallecompra trigger_total_compra; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_total_compra AFTER INSERT OR DELETE OR UPDATE ON public.detallecompra FOR EACH ROW EXECUTE FUNCTION public.trg_actualizar_total_compra();


--
-- Name: detalleventa trigger_total_venta; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_total_venta AFTER INSERT OR DELETE OR UPDATE ON public.detalleventa FOR EACH ROW EXECUTE FUNCTION public.trg_actualizar_total_venta();


--
-- Name: detalleventa trigger_validar_stock; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_validar_stock BEFORE INSERT OR UPDATE ON public.detalleventa FOR EACH ROW EXECUTE FUNCTION public.trg_validar_stock();


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bitacora bitacora_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario) ON DELETE SET NULL;


--
-- Name: detallecompra detallecompra_idcompra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detallecompra
    ADD CONSTRAINT detallecompra_idcompra_fkey FOREIGN KEY (idcompra) REFERENCES public.compra(idcompra) ON DELETE CASCADE;


--
-- Name: detallecompra detallecompra_idproducto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detallecompra
    ADD CONSTRAINT detallecompra_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);


--
-- Name: detalleventa detalleventa_idproducto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detalleventa
    ADD CONSTRAINT detalleventa_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);


--
-- Name: detalleventa detalleventa_idventa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detalleventa
    ADD CONSTRAINT detalleventa_idventa_fkey FOREIGN KEY (idventa) REFERENCES public.venta(idventa) ON DELETE CASCADE;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: factura factura_idventa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_idventa_fkey FOREIGN KEY (idventa) REFERENCES public.venta(idventa);


--
-- Name: garantia garantia_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.garantia
    ADD CONSTRAINT garantia_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);


--
-- Name: garantia garantia_iddetalle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.garantia
    ADD CONSTRAINT garantia_iddetalle_fkey FOREIGN KEY (iddetalle) REFERENCES public.detalleventa(iddetalle) ON DELETE CASCADE;


--
-- Name: garantia garantia_idproducto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.garantia
    ADD CONSTRAINT garantia_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);


--
-- Name: garantia garantia_idventa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.garantia
    ADD CONSTRAINT garantia_idventa_fkey FOREIGN KEY (idventa) REFERENCES public.venta(idventa) ON DELETE CASCADE;


--
-- Name: pagoventa pagoventa_idventa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagoventa
    ADD CONSTRAINT pagoventa_idventa_fkey FOREIGN KEY (idventa) REFERENCES public.venta(idventa) ON DELETE CASCADE;


--
-- Name: producto producto_idcategoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria) ON DELETE SET NULL;


--
-- Name: resena resena_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente) ON DELETE CASCADE;


--
-- Name: resena resena_idventa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_idventa_fkey FOREIGN KEY (idventa) REFERENCES public.venta(idventa) ON DELETE CASCADE;


--
-- Name: venta venta_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- PostgreSQL database dump complete
--

\unrestrict 4DPiiLI4UXV00DRmtkcRLRsyOHnCeOs5ysfIJYcrPQbx8SxNxgtXazOxXLp2Xkd

