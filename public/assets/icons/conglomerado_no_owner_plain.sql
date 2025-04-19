--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-16 18:55:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 120407)
-- Name: consejogob; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA consejogob;


--
-- TOC entry 2 (class 3079 OID 120396)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 123414)
-- Name: TBL_USER; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob."TBL_USER" (
    id integer NOT NULL,
    nombres character varying NOT NULL,
    apellidos character varying NOT NULL,
    cedula bigint NOT NULL,
    telefono bigint NOT NULL,
    correo character varying NOT NULL,
    celular bigint NOT NULL,
    direccion character varying NOT NULL,
    ciudad character varying NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 123419)
-- Name: TBL_USER_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob."TBL_USER_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 220
-- Name: TBL_USER_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob."TBL_USER_id_seq" OWNED BY consejogob."TBL_USER".id;


--
-- TOC entry 221 (class 1259 OID 123420)
-- Name: archivo_entidad; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.archivo_entidad (
    id bigint NOT NULL,
    nit_id character varying(25) NOT NULL,
    section character varying(50) NOT NULL,
    archivo_content_type character varying(255) NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    fecha_creacion date DEFAULT ('now'::text)::date NOT NULL,
    entidad_id bigint
);


--
-- TOC entry 222 (class 1259 OID 123426)
-- Name: archivo_entidad_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.archivo_entidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 222
-- Name: archivo_entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.archivo_entidad_id_seq OWNED BY consejogob.archivo_entidad.id;


--
-- TOC entry 223 (class 1259 OID 123427)
-- Name: archivo_temas_eventos; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.archivo_temas_eventos (
    id integer NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    archivo_content_type character varying(100) NOT NULL,
    tema_evento_id bigint NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 123430)
-- Name: archivo_temas_eventos_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.archivo_temas_eventos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 224
-- Name: archivo_temas_eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.archivo_temas_eventos_id_seq OWNED BY consejogob.archivo_temas_eventos.id;


--
-- TOC entry 225 (class 1259 OID 123431)
-- Name: archivos_tarea; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.archivos_tarea (
    id integer NOT NULL,
    fecha_creacion date NOT NULL,
    task_id bigint NOT NULL,
    archivo_content_type character varying(255) NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    ruta character varying(255) NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 123436)
-- Name: archivos_tarea_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.archivos_tarea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 226
-- Name: archivos_tarea_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.archivos_tarea_id_seq OWNED BY consejogob.archivos_tarea.id;


--
-- TOC entry 227 (class 1259 OID 123437)
-- Name: banco_fotos_entidad; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.banco_fotos_entidad (
    id integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    entidad_id bigint NOT NULL,
    archivo_content_type character varying(255) NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    ruta character varying(255) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 123443)
-- Name: banco_fotos_entidad_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.banco_fotos_entidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 228
-- Name: banco_fotos_entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.banco_fotos_entidad_id_seq OWNED BY consejogob.banco_fotos_entidad.id;


--
-- TOC entry 229 (class 1259 OID 123444)
-- Name: departamentos; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.departamentos (
    id_departamento smallint NOT NULL,
    departamento character varying(255) DEFAULT ''::character varying NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 123448)
-- Name: entidad; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.entidad (
    id bigint NOT NULL,
    url_logo character varying(255) NOT NULL,
    nombre_entidad character varying(255) NOT NULL,
    nit character varying(30) NOT NULL,
    clasificacion character varying(255) NOT NULL,
    sector_desarrollo_administrativo character varying(255) NOT NULL,
    naturaleza_juridica character varying(255) NOT NULL,
    objeto_social text NOT NULL,
    mision text,
    vision text,
    tipo_entidad_id bigint,
    sigla character varying(255),
    clasificacion_situacion_financiera_resultados character varying(255),
    clasificacion_ejecucion_presupuestal character varying(255),
    centro_gestor integer
);


--
-- TOC entry 231 (class 1259 OID 123453)
-- Name: entidad_asignada; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.entidad_asignada (
    id bigint NOT NULL,
    entidad_id bigint NOT NULL,
    user_id bigint NOT NULL,
    fecha_creacion date DEFAULT ('now'::text)::date NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 123457)
-- Name: entidad_asignada_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.entidad_asignada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 232
-- Name: entidad_asignada_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.entidad_asignada_id_seq OWNED BY consejogob.entidad_asignada.id;


--
-- TOC entry 233 (class 1259 OID 123458)
-- Name: entidad_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.entidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 233
-- Name: entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.entidad_id_seq OWNED BY consejogob.entidad.id;


--
-- TOC entry 234 (class 1259 OID 123459)
-- Name: equipo_financiero; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.equipo_financiero (
    id integer NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    cargo character varying(255) NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    ruta_foto character varying(255) NOT NULL,
    fecha_creacion date DEFAULT now() NOT NULL,
    "order" numeric NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 123465)
-- Name: equipo_financiero_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.equipo_financiero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 235
-- Name: equipo_financiero_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.equipo_financiero_id_seq OWNED BY consejogob.equipo_financiero.id;


--
-- TOC entry 236 (class 1259 OID 123466)
-- Name: equipo_financiero_order_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.equipo_financiero_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 236
-- Name: equipo_financiero_order_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.equipo_financiero_order_seq OWNED BY consejogob.equipo_financiero."order";


--
-- TOC entry 237 (class 1259 OID 123467)
-- Name: estado_resultado; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.estado_resultado (
    id_registro uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    entidad_id bigint NOT NULL,
    sigla character varying(255) NOT NULL,
    fecha_corte date NOT NULL,
    clase character varying(100) NOT NULL,
    grupo character varying(100) NOT NULL,
    valor numeric NOT NULL,
    fecha_registro date DEFAULT now() NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 123474)
-- Name: eventos; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.eventos (
    id bigint NOT NULL,
    fecha date NOT NULL,
    nombre character varying(50) NOT NULL,
    fecha_creacion date DEFAULT ('now'::text)::date NOT NULL,
    descripcion character varying(250),
    creado_por_id bigint NOT NULL,
    entidad_id numeric NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    tipo_reunion character varying(25) NOT NULL,
    hora_ini time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    color character varying NOT NULL,
    tipo_entidad_id integer NOT NULL,
    procesado boolean DEFAULT false NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 123482)
-- Name: eventos_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.eventos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 239
-- Name: eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.eventos_id_seq OWNED BY consejogob.eventos.id;


--
-- TOC entry 240 (class 1259 OID 123483)
-- Name: fecha_limite_reportes; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.fecha_limite_reportes (
    id bigint NOT NULL,
    fecha_subir_inicio date NOT NULL,
    fecha_subir_final date NOT NULL,
    fecha_creacion date DEFAULT ('now'::text)::date NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 123487)
-- Name: fecha_limite_reportes_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.fecha_limite_reportes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 241
-- Name: fecha_limite_reportes_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.fecha_limite_reportes_id_seq OWNED BY consejogob.fecha_limite_reportes.id;


--
-- TOC entry 242 (class 1259 OID 123488)
-- Name: gestion_conocimiento; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.gestion_conocimiento (
    id bigint NOT NULL,
    titulo character varying(255) NOT NULL,
    tipo_archivo character varying(100) NOT NULL,
    archivo_content_type character varying(100) NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    ruta character varying(255) NOT NULL,
    fecha_creacion date DEFAULT ('now'::text)::date NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 123494)
-- Name: gestion_conocimiento_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.gestion_conocimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 243
-- Name: gestion_conocimiento_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.gestion_conocimiento_id_seq OWNED BY consejogob.gestion_conocimiento.id;


--
-- TOC entry 244 (class 1259 OID 123495)
-- Name: historial_carga_global; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.historial_carga_global (
    id bigint NOT NULL,
    entidad_id numeric NOT NULL,
    nombres character varying NOT NULL,
    apellidos character varying NOT NULL,
    cedula bigint NOT NULL,
    sigla_entidad character varying NOT NULL,
    seccion character varying NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 123501)
-- Name: historial_carga_global_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.historial_carga_global_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 245
-- Name: historial_carga_global_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.historial_carga_global_id_seq OWNED BY consejogob.historial_carga_global.id;


--
-- TOC entry 246 (class 1259 OID 123502)
-- Name: historial_carga_informes; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.historial_carga_informes (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    informe character varying(255) NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    ruta character varying(255) NOT NULL,
    fecha_descarga timestamp without time zone NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 123507)
-- Name: historial_carga_informes_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.historial_carga_informes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 247
-- Name: historial_carga_informes_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.historial_carga_informes_id_seq OWNED BY consejogob.historial_carga_informes.id;


--
-- TOC entry 248 (class 1259 OID 123508)
-- Name: logs; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.logs (
    id_registro uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    usuario character varying(100) NOT NULL,
    fecha_registro timestamp without time zone NOT NULL,
    metodo character varying(50) NOT NULL,
    ruta character varying(255),
    accion character varying(255) NOT NULL,
    ip character varying(50)
);


--
-- TOC entry 249 (class 1259 OID 123514)
-- Name: municipios; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.municipios (
    id_municipio smallint NOT NULL,
    municipio character varying(255) DEFAULT ''::character varying NOT NULL,
    estado smallint NOT NULL,
    departamento_id smallint NOT NULL
);


--
-- TOC entry 250 (class 1259 OID 123518)
-- Name: notificiaciones; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.notificiaciones (
    id bigint NOT NULL,
    nombre character varying NOT NULL,
    description character varying NOT NULL,
    section character varying NOT NULL,
    user_id integer NOT NULL,
    read boolean DEFAULT false NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    fecha_actualizacion timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 123526)
-- Name: notificiaciones_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.notificiaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 251
-- Name: notificiaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.notificiaciones_id_seq OWNED BY consejogob.notificiaciones.id;


--
-- TOC entry 252 (class 1259 OID 123527)
-- Name: plantilla_gastos; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.plantilla_gastos (
    id bigint NOT NULL,
    entidad_id integer NOT NULL,
    fondo integer NOT NULL,
    centro_gestor integer NOT NULL,
    area_funcional integer NOT NULL,
    proyecto integer NOT NULL,
    nombre_cuenta character varying NOT NULL,
    presupuesto_inicial numeric NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 253 (class 1259 OID 123533)
-- Name: plantilla_gastos_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.plantilla_gastos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 253
-- Name: plantilla_gastos_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.plantilla_gastos_id_seq OWNED BY consejogob.plantilla_gastos.id;


--
-- TOC entry 254 (class 1259 OID 123534)
-- Name: plantilla_ingresos; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.plantilla_ingresos (
    id bigint NOT NULL,
    entidad_id integer NOT NULL,
    fondo integer NOT NULL,
    centro_gestor integer NOT NULL,
    area_funcional integer NOT NULL,
    nombre_cuenta character varying NOT NULL,
    presupuesto_inicial numeric NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 123540)
-- Name: plantilla_ingresos_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.plantilla_ingresos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 255
-- Name: plantilla_ingresos_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.plantilla_ingresos_id_seq OWNED BY consejogob.plantilla_ingresos.id;


--
-- TOC entry 256 (class 1259 OID 123541)
-- Name: programa_ejecucion_ingresos; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.programa_ejecucion_ingresos (
    id_registro uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    entidad_id bigint NOT NULL,
    fecha_registro date NOT NULL,
    clasificacion_entidad character varying(255) NOT NULL,
    entidad character varying(255) NOT NULL,
    fecha_de_corte date NOT NULL,
    fondo integer NOT NULL,
    centro_gestor integer,
    area_funcional integer,
    proyecto integer NOT NULL,
    nivel integer NOT NULL,
    posicion_presupuestal_ccpet numeric NOT NULL,
    nombre_de_la_cuenta character varying(255) NOT NULL,
    presupuesto_inicial double precision NOT NULL,
    reducciones double precision NOT NULL,
    adiciones double precision NOT NULL,
    creditos double precision NOT NULL,
    contracreditos double precision NOT NULL,
    presupuesto_actual double precision NOT NULL,
    total_ejecucion_recaudo numeric NOT NULL,
    porcentaje_ejecucion numeric NOT NULL,
    total_disponible_neto_por_recaudar numeric NOT NULL
);


--
-- TOC entry 257 (class 1259 OID 123547)
-- Name: programacion_ejecucion_gastos; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.programacion_ejecucion_gastos (
    id_registro uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    entidad_id bigint NOT NULL,
    fecha_registro date NOT NULL,
    clasificacion_entidad character varying(255) NOT NULL,
    entidad character varying(255) NOT NULL,
    fecha_de_corte date NOT NULL,
    fondo integer NOT NULL,
    centro_gestor integer,
    area_funcional integer,
    proyecto integer NOT NULL,
    nivel integer NOT NULL,
    posicion_presupuestal_ccpet numeric NOT NULL,
    nombre_de_la_cuenta character varying(255),
    presupuesto_inicial double precision NOT NULL,
    reducciones double precision NOT NULL,
    adiciones double precision NOT NULL,
    creditos double precision NOT NULL,
    contracreditos double precision NOT NULL,
    presupuesto_actual double precision NOT NULL,
    compromisos double precision NOT NULL,
    facturas double precision NOT NULL,
    pagos double precision NOT NULL,
    ejecucion double precision NOT NULL,
    disponible_neto double precision NOT NULL,
    porcentaje_ejecucion double precision NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 123553)
-- Name: representantes; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.representantes (
    id bigint NOT NULL,
    entidad_id bigint NOT NULL,
    nombres character varying NOT NULL,
    apellidos character varying NOT NULL,
    email character varying NOT NULL,
    posicion character varying NOT NULL,
    nombre_archivo character varying,
    archivo_content_type character varying,
    fecha_creacion date DEFAULT ('now'::text)::date NOT NULL
);


--
-- TOC entry 259 (class 1259 OID 123559)
-- Name: representantes_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.representantes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 259
-- Name: representantes_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.representantes_id_seq OWNED BY consejogob.representantes.id;


--
-- TOC entry 260 (class 1259 OID 123560)
-- Name: roles; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.roles (
    id bigint NOT NULL,
    nombre character varying NOT NULL,
    crear_usuario boolean NOT NULL,
    actualizar_usuario boolean NOT NULL,
    eliminar_usuario boolean NOT NULL,
    asignar_permisos boolean NOT NULL,
    eliminar_permisos boolean NOT NULL,
    cargue_info boolean NOT NULL,
    actualizar_info boolean NOT NULL,
    visualizar_info boolean NOT NULL,
    eliminar_info boolean NOT NULL,
    cambio_info boolean NOT NULL,
    acceso_bd boolean NOT NULL,
    bugs boolean NOT NULL,
    errores boolean NOT NULL,
    entidades boolean NOT NULL,
    crear_entidad boolean NOT NULL,
    editar_pilares boolean NOT NULL,
    asignar_rol boolean NOT NULL,
    editar_entidad boolean NOT NULL,
    crear_eventos boolean NOT NULL,
    crear_tareas boolean NOT NULL,
    firmar_documentos boolean NOT NULL,
    modulo_financiero boolean NOT NULL,
    consultar_eventos boolean NOT NULL,
    completar_tareas boolean NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 123565)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 261
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.roles_id_seq OWNED BY consejogob.roles.id;


--
-- TOC entry 262 (class 1259 OID 123566)
-- Name: situacion_financiera; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.situacion_financiera (
    id_registro uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    entidad_id bigint NOT NULL,
    sigla character varying(255) NOT NULL,
    fecha_corte date NOT NULL,
    clase character varying(100) NOT NULL,
    grupo character varying(100),
    cuenta character varying(255),
    valor numeric NOT NULL,
    fecha_registro date DEFAULT now() NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 123573)
-- Name: tarea; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.tarea (
    id bigint NOT NULL,
    tarea character varying NOT NULL,
    descripcion character varying,
    prioridad integer NOT NULL,
    estado character varying DEFAULT 'Pendiente'::character varying NOT NULL,
    fecha_inicio date DEFAULT ('now'::text)::date NOT NULL,
    fecha_terminacion date NOT NULL,
    responsable_id bigint NOT NULL,
    form_link character varying,
    tipo_id integer NOT NULL,
    creado_por bigint NOT NULL
);


--
-- TOC entry 264 (class 1259 OID 123580)
-- Name: tarea_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.tarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 264
-- Name: tarea_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.tarea_id_seq OWNED BY consejogob.tarea.id;


--
-- TOC entry 265 (class 1259 OID 123581)
-- Name: temas_eventos; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.temas_eventos (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha_creacion timestamp without time zone,
    evento_id bigint NOT NULL,
    creado_id bigint NOT NULL
);


--
-- TOC entry 266 (class 1259 OID 123584)
-- Name: temas_eventos_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.temas_eventos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 266
-- Name: temas_eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.temas_eventos_id_seq OWNED BY consejogob.temas_eventos.id;


--
-- TOC entry 267 (class 1259 OID 123585)
-- Name: tipo_entidad; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob.tipo_entidad (
    id bigint NOT NULL,
    nombre character varying NOT NULL
);


--
-- TOC entry 268 (class 1259 OID 123590)
-- Name: tipo_entidad_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.tipo_entidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 268
-- Name: tipo_entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.tipo_entidad_id_seq OWNED BY consejogob.tipo_entidad.id;


--
-- TOC entry 269 (class 1259 OID 123591)
-- Name: user; Type: TABLE; Schema: consejogob; Owner: -
--

CREATE TABLE consejogob."user" (
    id bigint NOT NULL,
    cedula character varying NOT NULL,
    clave character varying NOT NULL,
    nombres character varying NOT NULL,
    apellidos character varying NOT NULL,
    correo character varying NOT NULL,
    celular bigint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    creado_por bigint NOT NULL,
    departamento character varying NOT NULL,
    ciudad character varying NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    terminos boolean DEFAULT false NOT NULL,
    rol bigint
);


--
-- TOC entry 270 (class 1259 OID 123599)
-- Name: user_id_seq; Type: SEQUENCE; Schema: consejogob; Owner: -
--

CREATE SEQUENCE consejogob.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 270
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: consejogob; Owner: -
--

ALTER SEQUENCE consejogob.user_id_seq OWNED BY consejogob."user".id;


--
-- TOC entry 4787 (class 2604 OID 123600)
-- Name: TBL_USER id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob."TBL_USER" ALTER COLUMN id SET DEFAULT nextval('consejogob."TBL_USER_id_seq"'::regclass);


--
-- TOC entry 4788 (class 2604 OID 123601)
-- Name: archivo_entidad id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.archivo_entidad ALTER COLUMN id SET DEFAULT nextval('consejogob.archivo_entidad_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 123602)
-- Name: archivo_temas_eventos id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.archivo_temas_eventos ALTER COLUMN id SET DEFAULT nextval('consejogob.archivo_temas_eventos_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 123603)
-- Name: archivos_tarea id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.archivos_tarea ALTER COLUMN id SET DEFAULT nextval('consejogob.archivos_tarea_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 123604)
-- Name: banco_fotos_entidad id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.banco_fotos_entidad ALTER COLUMN id SET DEFAULT nextval('consejogob.banco_fotos_entidad_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 123605)
-- Name: entidad id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.entidad ALTER COLUMN id SET DEFAULT nextval('consejogob.entidad_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 123606)
-- Name: entidad_asignada id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.entidad_asignada ALTER COLUMN id SET DEFAULT nextval('consejogob.entidad_asignada_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 123607)
-- Name: equipo_financiero id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.equipo_financiero ALTER COLUMN id SET DEFAULT nextval('consejogob.equipo_financiero_id_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 123608)
-- Name: equipo_financiero order; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.equipo_financiero ALTER COLUMN "order" SET DEFAULT nextval('consejogob.equipo_financiero_order_seq'::regclass);


--
-- TOC entry 4803 (class 2604 OID 123609)
-- Name: eventos id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.eventos ALTER COLUMN id SET DEFAULT nextval('consejogob.eventos_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 123610)
-- Name: fecha_limite_reportes id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.fecha_limite_reportes ALTER COLUMN id SET DEFAULT nextval('consejogob.fecha_limite_reportes_id_seq'::regclass);


--
-- TOC entry 4809 (class 2604 OID 123611)
-- Name: gestion_conocimiento id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.gestion_conocimiento ALTER COLUMN id SET DEFAULT nextval('consejogob.gestion_conocimiento_id_seq'::regclass);


--
-- TOC entry 4811 (class 2604 OID 123612)
-- Name: historial_carga_global id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.historial_carga_global ALTER COLUMN id SET DEFAULT nextval('consejogob.historial_carga_global_id_seq'::regclass);


--
-- TOC entry 4813 (class 2604 OID 123613)
-- Name: historial_carga_informes id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.historial_carga_informes ALTER COLUMN id SET DEFAULT nextval('consejogob.historial_carga_informes_id_seq'::regclass);


--
-- TOC entry 4816 (class 2604 OID 123614)
-- Name: notificiaciones id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.notificiaciones ALTER COLUMN id SET DEFAULT nextval('consejogob.notificiaciones_id_seq'::regclass);


--
-- TOC entry 4820 (class 2604 OID 123615)
-- Name: plantilla_gastos id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.plantilla_gastos ALTER COLUMN id SET DEFAULT nextval('consejogob.plantilla_gastos_id_seq'::regclass);


--
-- TOC entry 4822 (class 2604 OID 123616)
-- Name: plantilla_ingresos id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.plantilla_ingresos ALTER COLUMN id SET DEFAULT nextval('consejogob.plantilla_ingresos_id_seq'::regclass);


--
-- TOC entry 4826 (class 2604 OID 123617)
-- Name: representantes id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.representantes ALTER COLUMN id SET DEFAULT nextval('consejogob.representantes_id_seq'::regclass);


--
-- TOC entry 4828 (class 2604 OID 123618)
-- Name: roles id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.roles ALTER COLUMN id SET DEFAULT nextval('consejogob.roles_id_seq'::regclass);


--
-- TOC entry 4831 (class 2604 OID 123619)
-- Name: tarea id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.tarea ALTER COLUMN id SET DEFAULT nextval('consejogob.tarea_id_seq'::regclass);


--
-- TOC entry 4834 (class 2604 OID 123620)
-- Name: temas_eventos id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.temas_eventos ALTER COLUMN id SET DEFAULT nextval('consejogob.temas_eventos_id_seq'::regclass);


--
-- TOC entry 4835 (class 2604 OID 123621)
-- Name: tipo_entidad id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.tipo_entidad ALTER COLUMN id SET DEFAULT nextval('consejogob.tipo_entidad_id_seq'::regclass);


--
-- TOC entry 4836 (class 2604 OID 123622)
-- Name: user id; Type: DEFAULT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob."user" ALTER COLUMN id SET DEFAULT nextval('consejogob.user_id_seq'::regclass);


--
-- TOC entry 5071 (class 0 OID 123414)
-- Dependencies: 219
-- Data for Name: TBL_USER; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob."TBL_USER" (id, nombres, apellidos, cedula, telefono, correo, celular, direccion, ciudad) FROM stdin;
\.


--
-- TOC entry 5073 (class 0 OID 123420)
-- Dependencies: 221
-- Data for Name: archivo_entidad; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.archivo_entidad (id, nit_id, section, archivo_content_type, nombre_archivo, fecha_creacion, entidad_id) FROM stdin;
\.


--
-- TOC entry 5075 (class 0 OID 123427)
-- Dependencies: 223
-- Data for Name: archivo_temas_eventos; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.archivo_temas_eventos (id, nombre_archivo, archivo_content_type, tema_evento_id, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5077 (class 0 OID 123431)
-- Dependencies: 225
-- Data for Name: archivos_tarea; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.archivos_tarea (id, fecha_creacion, task_id, archivo_content_type, nombre_archivo, ruta) FROM stdin;
\.


--
-- TOC entry 5079 (class 0 OID 123437)
-- Dependencies: 227
-- Data for Name: banco_fotos_entidad; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.banco_fotos_entidad (id, fecha_creacion, entidad_id, archivo_content_type, nombre_archivo, ruta) FROM stdin;
\.


--
-- TOC entry 5081 (class 0 OID 123444)
-- Dependencies: 229
-- Data for Name: departamentos; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.departamentos (id_departamento, departamento) FROM stdin;
5	ANTIOQUIA
8	ATLÁNTICO
11	BOGOTÁ, D.C.
13	BOLÍVAR
15	BOYACÁ
17	CALDAS
18	CAQUETÁ
19	CAUCA
20	CESAR
23	CÓRDOBA
25	CUNDINAMARCA
27	CHOCÓ
41	HUILA
44	LA GUAJIRA
47	MAGDALENA
50	META
52	NARIÑO
54	NORTE DE SANTANDER
63	QUINDÍO
66	RISARALDA
68	SANTANDER
70	SUCRE
73	TOLIMA
76	VALLE DEL CAUCA
81	ARAUCA
85	CASANARE
86	PUTUMAYO
88	ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA
91	AMAZONAS
94	GUAINÍA
95	GUAVIARE
97	VAUPÉS
99	VICHADA
\.


--
-- TOC entry 5082 (class 0 OID 123448)
-- Dependencies: 230
-- Data for Name: entidad; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.entidad (id, url_logo, nombre_entidad, nit, clasificacion, sector_desarrollo_administrativo, naturaleza_juridica, objeto_social, mision, vision, tipo_entidad_id, sigla, clasificacion_situacion_financiera_resultados, clasificacion_ejecucion_presupuestal, centro_gestor) FROM stdin;
13	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-parque-explora-150x84.png	Corporación Parque Explora	900145472-0	Indirecta	Educación, Cultura, Participación, Recreación y Deporte	Entidad Sin Ánimo De Lucro - Corporación	Organización, fomento, desarrollo y operación de actividades relacionadas con la apropiación social de la ciencia y la tecnología. Es una entidad de educación informal, que impulsa, además, la cultura y la recreación social mediante múltiples actividades y en asocio con museos, parques y organizaciones que llevan a cabo actividades afines	\N	\N	\N	Parque Explora	Entidades que no reportan al CHIP	Entidades que no reportan al CHIP	\N
36	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-terminales.png	Terminales De Transporte De Medellín S.A.	890919291-1	Vinculada	Habitat, Movilidad, Infraestructura y Sostenibilidad	Economía Mixta	Contribuir a la solución del transporte público y a la mejor prestación de éste	\N	\N	\N	Terminales	Empresas no cotizantes	Empresas territoriales no financieras	\N
20	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-fonvalmed-300x283.png	Fondo de Valorización del Municipio de Medellín	900158929-0	Adscrita	Apoyo Institucional	Establecimiento Público	Administrar los bienes, rentas y los demás ingresos originados en la ejecución de obras públicas financiadas total o parcialmente a través del sistema de la contribución de valorización	\N	\N	\N	Fonvalmed	Entidades de gobierno	Establecimientos publicos territoriales	91200000
26	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-pacual-bravo-300x163.png	Institución Universitaria Pascual Bravo	890980153-1	Adscrita	Educación, Cultura, Participación, Recreación y Deporte	Establecimiento Público	Búsqueda, desarrollo y difusión del conocimiento en los campos de las humanidades, la ciencia, las artes, la técnica y la tecnología, mediante las actividades de Docencia, Investigación y de Extensión y Proyección Social realizadas en los programas de Educación Superior de pregrado y de posgrado, con metodologías presencial, abierta y a distancia, incluyendo educación virtual, puestas al servicio de una concepción integral del hombre y de la sociedad	\N	\N	\N	Pascual Bravo	Entidades de gobierno	Establecimientos publicos territoriales	91100000
4	https://becapedia.com.co/wp-content/uploads/2023/06/fondos-sapiencia-medellin.jpg.webp	Agencia De Educación Postsecundaria De Medellín	900602106-0	Adscrita	Educación, Cultura, Participación, Recreación y Deporte	Unidad Administrativa Especial	Liderar la ejecución de la política y los lineamientos del sistema de la educación pública superior del Municipio de Medellín, promoviendo que las instituciones públicas que lo integran presten un servicio especializado, coordinado y complementario, acorde con las necesidades tecnológicas y profesionales que demanda el desarrollo del municipio, el departamento y el país; proponiendo, impulsando y desarrollando herramientas orientadas a la organización y articulación de los procesos administrativos y académicos estratégicos de las Instituciones públicas del Sistema de Educación Superior de Medellín	\N	\N	\N	Sapiencia	Entidades de gobierno	Establecimientos publicos territoriales	91500000
9	https://image.slidesharecdn.com/creameincubadoradeempresasgrupo-220925051934-981a650f/75/CREAME-INCUBADORA-DE-EMPRESAS-GRUPO-pptx-2-2048.jpg	Corporación Creáme	811007547-0	Indirecta	Ciencia, Tecnología e Innovación, Desarrollo Económico, Internacionalización	Entidad Sin Ánimo De Lucro - Corporación	Facilitar la aplicación del conocimiento científico y tecnológico a la generación de productos y servicios comercializables y competitivos, a través de la incubación de empresas de base tecnológica, proceso que además de comprometer el desarrollo de investigaciones y avances de carácter científico y tecnológico, brinda un ambiente propicio para el crecimiento y consolidación durante los primeros años de existencia de esas empresas	\N	\N	\N	Creame	Entidades que no reportan al CHIP	Entidades que no reportan al CHIP	\N
11	https://hospinfantilcm.org/wp-content/uploads/2019/10/Logo-Hicm-1-300x210.png	Corporación Hospital Infantil Concejo De Medellín	900625317-7	Indirecta	Salud, Inclusión Social y Familia y la No-violencia	Entidad Sin Ánimo De Lucro - Corporación	Prestación de servicios de salud en todos los niveles de complejidad, así mismo la administración, coordinación, organización fomento, desarrollo, difusión y operación del Hospital Infantil Concejo de Medellín	\N	\N	\N	Hospital Infantil	Empresas no cotizantes	Empresas territoriales no financieras	\N
12	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-parque-arvi-150x134.png	Corporación Parque Arví	900154128-1	Indirecta	Habitat, Movilidad, Infraestructura y Sostenibilidad	Entidad Sin Ánimo De Lucro - Corporación	Trabajar por la consolidación del Proyecto Parque Arví. De igual manera, realizará todas las actividades que estén encaminadas a la operación de las adecuaciones físicas e inmuebles mediante los cuales se desarrolle el Proyecto, con la finalidad de que cumpla con su vocación ambiental, cultural, turística y educativa	\N	\N	\N	Parque Arvi	Entidades que no reportan al CHIP	Entidades que no reportan al CHIP	\N
14	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-ruta-n-150x88.png	Corporación Ruta N Medellín	900323466-1	Indirecta	Ciencia, Tecnología e Innovación, Desarrollo Económico, Internacionalización	Entidad Sin Ánimo De Lucro - Corporación	Direccionamiento, organización, fomento, desarrollo, difusión y operación de la política y las actividades de ciencia, tecnología, innovación y emprendimiento de base tecnológica en todos los campos en los que los asociados lo requieran, dentro de la política de desarrollo económico de Medellín	\N	\N	\N	Ruta N	Entidades de gobierno	Establecimientos publicos territoriales	\N
16	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-metro-103x150.png	Empresa De Transporte Masivo Del Valle De Aburrá Ltda	890923668-1	Vinculada	Habitat, Movilidad, Infraestructura y Sostenibilidad	Sociedad Pública	Prestación del servicio de transporte público masivo de pasajeros	\N	\N	\N	Metro de Medellin	Empresas cotizantes	Empresas territoriales no financieras	\N
17	https://www.esucontratacion.com/img/logo_esu.png	Empresa Para La Seguridad y Soluciones Urbanas	890984761-8	Vinculada	Gobernabilidad y Seguridad	Empresa Industrial y Comercial del Estado	Obtener recursos, con entidades públicas o privadas, nacionales o internacionales, para ser destinados a labores de apoyo logístico e institucional a los organismos de seguridad, a las fuerzas armadas y de policía, aplicándolos al desarrollo de planes y programas y proyectos que sean diseñados por tales organismos y el Distrito de Medellín, para la prestación eficiente y oportuna de las actividades tendientes a garantizar la seguridad integral de la ciudadanía	\N	\N	\N	ESU	Empresas no cotizantes	Empresas territoriales no financieras	\N
18	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-epm.png	Empresas Públicas De Medellín E.S.P	890904996-1	Vinculada	Despacho Alcalde	Empresa De Servicios Públicos	Prestación de servicios públicos domiciliarios de acueducto, alcantarillado, energía y distribución de gas combustible, telefonía fija pública básica conmutada y telefonía local móvil rural y demás servicios de telecomunicaciones. Podrá también prestar el servicio público domiciliario de aseo, así como actividades complementarias propias de todos y cada uno de estos servicios públicos y el tratamiento y aprovechamiento de basuras	\N	\N	\N	EPM	Empresas cotizantes	Empresas territoriales no financieras	\N
19	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-fondo-garantias.png	Fondo De Garantías S.A.	811010485-3	Indirecta	Ciencia, Tecnología e Innovación, Desarrollo Económico, Internacionalización	Sociedad Anónima de Economía Mixta	Otorgar, ofrecer y promover garantías y servicios financieros afines, tanto a personas naturales como a las micro, pequeñas y medianas empresas, facilitando el acceso al crédito y contribuyendo al desarrollo económico del país	\N	\N	\N	FGA	Entidades que no reportan al CHIP	Empresas territoriales financieras	\N
21	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-fundacion-ferrocarril-138x150.png	Fundación Ferrocarril De Antioquia	900988911-1	Indirecta	Educación, Cultura, Participación, Recreación y Deporte	Entidad Sin Ánimo De Lucro - Fundación	Gestión integral del patrimonio cultural, constituido por todos los bienes materiales, las manifestaciones inmateriales, los productos y las representaciones de la cultura en los ámbitos municipal, departamental, nacional y mundial	\N	\N	\N	Ferrocarril	Entidades que no reportan al CHIP	Entidades que no reportan al CHIP	\N
22	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-bureau.png	Fundación Greater Medellín Convention & Visitors Bureau	811008634-8	Indirecta	Ciencia, Tecnología e Innovación, Desarrollo Económico, Internacionalización	Entidad Sin Ánimo De Lucro - Fundación	Fomentar y desarrollar el turismo del Departamento de Antioquia y especialmente en la ciudad de Medellín, a través de la promoción de la Ciudad como sede de congresos, convenciones, ferias y certámenes de carácter cultural que le generen turismo receptivo	\N	\N	\N	Bureau	Entidades que no reportan al CHIP	Entidades que no reportan al CHIP	\N
23	https://sibcolombia.net/wp-content/uploads/2016/06/logo-jb.medellin-1.png	Fundación Jardín Botánico Joaquín Antonio Uribe de Medellin	890980756-2	Indirecta	Habitat, Movilidad, Infraestructura y Sostenibilidad	Entidad Sin Ánimo De Lucro - Fundación	Crear experiencias de encuentro y convivencia, integradas a estrategias de educación y cultura en torno a la biodiversidad y la relación del ser humano con su medio natural. Se concentra en generar, difundir y aplicar conocimientos científicos sobre la diversidad florística de Antioquia y del país, aportando a su conservación, restauración y manejo, en aras de aprovechar la flora de manera sostenible y ética. Como centro de ciencia, el jardín ejecuta programas permanentes de investigación, básica y aplicada, sobre conservación en el entorno nativo de la planta o fuera de él	\N	\N	\N	Jardin Botanico	Entidades que no reportan al CHIP	Entidades que no reportan al CHIP	\N
24	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-hospital-general-300x177.png	Hospital General de Medellín Luz Castro de Gutiérrez E. S. E.	890904646-7	Adscrita	Salud, Inclusión Social y Familia y la No-violencia	Empresa Social Del Estado	Prestación de servicios de salud del tercer nivel de atención, consolidando y manteniendo un modelo de gestión integral del proceso de atención, que genere valor para el usuario y su familia	\N	\N	\N	Hospital General	Empresas no cotizantes	Empresas territoriales no financieras	\N
28	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-metrosalud-150x75.png	Instituto Metropolitando De Salud	800058016-1	Adscrita	Salud, Inclusión Social y Familia y la No-violencia	Empresa Social Del Estado	Contribuir al mejoramiento de la calidad de vida de la población usuaria mediante la prestación de servicios de salud de baja y mediana complejidad con criterios de calidad integral y productividad para lograr impactar su perfil epidemiológico, teniendo como pilar fundamental el sistema de garantía de la calidad de atención en salud	\N	\N	\N	Metrosalud	Empresas no cotizantes	Empresas territoriales no financieras	\N
25	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-colmayor-300x122.png	Institución Universitaria Colegio Mayor De Antioquia	890980134-1	Adscrita	Educación, Cultura, Participación, Recreación y Deporte	Establecimiento Público	Definición, observancia y ejecución de políticas públicas que buscan incidir en la asignación de bienes y servicios, en la redistribución de la renta y la riqueza, y en el nivel de bienestar de la sociedad. Estos bienes y servicios incluyen, entre otros, programas de bienestar y mantenimiento del orden, educación pública, seguridad nacional y servicios de defensa	\N	\N	\N	Colegio Mayor	Entidades de gobierno	Establecimientos publicos territoriales	90300000
27	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-inder-150x59.png	Instituto Deporte y Recreación De Medellín	800194096-0	Adscrita	Educación, Cultura, Participación, Recreación y Deporte	Establecimiento Público	Fomentar el deporte, la actividad fisica, la recreación y el aprovechamiento del tiempo libre, mediante la oferta de programas en espacios que contribuyan al mejoramiento de la cultura ciudadana y la calidad de vida de los habitantes del municipio de Medellín	\N	\N	\N	Inder	Entidades de gobierno	Establecimientos publicos territoriales	90500000
29	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-isvimed-150x64.png	Instituto Social de Vivienda y Hábitat de Medellín	900014480-8	Adscrita	Habitat, Movilidad, Infraestructura y Sostenibilidad	Establecimiento Público	Gerenciar políticas y programas de vivienda y hábitat, conduciendo a la solución de las necesidades habitacionales, especialmente de los asentamientos humanos y grupos familiares en situación de pobreza y vulnerabilidad, involucrando actores públicos, privados y comunitarios en la gestión y ejecución de proyectos de vivienda, titulación y legalización, mejoramiento de vivienda y hábitat, reasentamiento, acompañamiento social, gestión urbana, relacionados con vivienda y el hábitat en el contexto urbano y rural	\N	\N	\N	Isvimed	Entidades de gobierno	Establecimientos publicos territoriales	91400000
8	https://www.bibliotecapiloto.gov.co/wp-content/uploads/2020/04/logo.png	Biblioteca Pública Piloto de Medellín para America Latina	890980150-1	Adscrita	Educación, Cultura, Participación, Recreación y Deporte	Establecimiento Público	Fomentar el libre acceso a la información, la cultura, el aprendizaje y la generación de conocimientos. Es un puente entre tiempos que: promueve la identificación, organización, valoración, preservación y divulgación del patrimonio bibliográfico y documental, contribuye a la formación de sujetos críticos e independientes, al diálogo de saberes y la comprensión del entorno. Estimula la convivencia y la diversidad cultural; el fortalecimiento de las identidades y memorias locales, nacionales y latinoamericanas	\N	\N	\N	BPP	Entidades de gobierno	Establecimientos publicos territoriales	90200000
33	https://patrimoniomedellin.gov.co/wp-content/uploads/2017/05/logoMuseoCasadelaMemoria-300x117.png	Museo Casa De La Memoria	900857221-4	Adscrita	Educación, Cultura, Participación, Recreación y Deporte	Establecimiento Público	Fortalecer prácticas de conversación en Medellín y Antioquia a través de la argumentación, la deliberación, la comunicación, la creación y la acción, para el trámite de la diferencia, frente a procesos de construcción de memoria, que permitan ampliar la comprensión – reflexión sobre el conflicto armado y violencia relacionadas que ha vivido y aún vive Medellín, Antioquia y el país, que interpelando a todos como ciudadanos corresponsables del bien común, se contribuya a la reconciliación y a la no repetición	\N	\N	\N	Museo Casa	Entidades de gobierno	Establecimientos publicos territoriales	91700000
31	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-metroparques.png	Metroparques E.I.C.E	890984630-1	Vinculada	Educación, Cultura, Participación, Recreación y Deporte	Empresa Industrial y Comercial del Estado	Aprovechamiento de la industria del entretenimiento, promoviendo programas de interés público y social, favoreciendo el sano esparcimiento en beneficio de la comunidad, a través de la prestación de servicios en parques, alquiler de espacios, producción y comercialización de alimentos y bebidas; así como el apoyo a entidades públicas y privadas, ya sea logístico, administrativo o de otra naturaleza. Así mismo ejecuta toda clase de proyectos encaminados al mantenimiento de infraestructura física de espacios públicos y privados, de igual manera puede desarrollar toda clase de proyectos encaminados a proteger la diversidad e integridad del medio ambiente	\N	\N	\N	Metroparques	Empresas no cotizantes	Empresas territoriales no financieras	\N
32	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-metroplus-150x128.png	Metroplús S.A.	900019519-9	Vinculada	Habitat, Movilidad, Infraestructura y Sostenibilidad	Sociedad Pública	Planear, ejecutar, poner en marcha y controlar la adecuación de la infraestructura y la operación del Sistema Integrado de Transporte Masivo de Pasajeros de mediana capacidad en el Valle de Aburrá y su respectiva área de influencia, bajo la modalidad de transporte terrestre automotor, así como ejercer la titularidad sobre el mismo, buscando promover y beneficiar la prestación del servicio de transporte público masivo de conformidad con las normas vigentes	\N	\N	\N	Metroplus	Empresas no cotizantes	Empresas territoriales no financieras	\N
34	https://plazamayor.com.co/wp-content/uploads/Logo_PlazaMayor_Medell%C3%ADn.png	Plaza Mayor Medellín Convenciones Y Exposiciones S.A.	890909297-2	Vinculada	Ciencia, Tecnología e Innovación, Desarrollo Económico, Internacionalización	Economía Mixta	Operador profesional de eventos y actividades BTL, así como la prestación de servicios complementarios tales como alimentos y bebidas, mobiliario, ayudas audiovisuales, entre otros, directamente o a través de terceros, en los diferentes eventos	\N	\N	\N	Plaza Mayor	Empresas no cotizantes	Establecimientos publicos territoriales	\N
35	https://www.teleantioquia.co/wp-content/uploads/2024/04/cropped-Logo-nuevo-Teleantioquia-2024-negro.png	Sociedad Televisión De Antioquia Ltda	89093723-3\n	Indirecta	Ciencia, Tecnología e Innovación, Desarrollo Económico, Internacionalización	Sociedad de Responsabilidad Limitada	Prestación del servicio de televisión regional, mediante la programación, administración y operación de canal o canales a su cargo, al igual que la prestación de servicios de telecomunicaciones y aplicaciones que permitan la convergencia digital	\N	\N	\N	Teleantioquia	Empresas no cotizantes	Empresas territoriales no financieras	\N
1	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Fcv3cdMIn-cyamJYsmjT0S1tiAvqaLflDA&s	Administrador Del Patrimonio Escindido De Empresas Varias De Medellín E.S.P	900266932-6	Adscrita	Apoyo Institucional	Establecimiento Público	Recibir y administrar la porción patrimonial que se escinde de Empresas Varias de Medellín ESP (APEV)	\N	\N	\N	APEV	Entidades de gobierno	Establecimientos publicos territoriales	91300000
3	https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/042013/logo_aci.png?itok=YyTkhaVU	Agencia De Cooperación e Inversión de Medellín y el Área Metropolitana	811036423-1	Indirecta	Ciencia, Tecnología e Innovación, Desarrollo Económico, Internacionalización	Entidad Sin Ánimo De Lucro - Asociación entre Entidades Públicas	Explorar, identificar y gestionar, por cuenta y en interés de cualquiera de los asociados, según corresponda a su particular actividad, proyectos que, presentados de acuerdo con las exigencias de las instituciones de cooperación internacional o nacional, califiquen para recibir de éstas recursos económicos, humanos y tecnológicos, contribuyéndose así al mejoramiento de la calidad de vida de los habitantes de la ciudad de Medellín y del territorio nacional	\N	\N	\N	ACI	Entidades de gobierno	Establecimientos publicos territoriales	\N
30	https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Logo-ITM-01.png/1200px-Logo-ITM-01.png	Instituto Tecnológico Metropolitano	800214750-7	Adscrita	Educación, Cultura, Participación, Recreación y Deporte	Establecimiento Público	Ofrecer el servicio de educación superior para la formación integral del talento humano con excelencia en la investigación, la innovación, el desarrollo, la docencia, la extensión y la administración, que busca habilitar para la vida y el trabajo con proyección nacional e internacional desde la dignidad humana y la solidaridad, con conciencia social y ambiental	\N	\N	\N	ITM	Entidades de gobierno	Establecimientos publicos territoriales	90600000
2	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-olaya-herrera.png	Aeropuerto Olaya Herrera	800157073-4	Adscrita	Habitat, Movilidad, Infraestructura y Sostenibilidad	Establecimiento Público	Conectividad, competitividad y calidad de vida de la región, garantizando la prestación de un servicio de gestión aeroportuario y de servicios a la comunidad, confortables y seguros, con una gestión eficiente de los recursos	\N	\N	\N	Aeropuerto	Entidades de gobierno	Establecimientos publicos territoriales	90100000
5	https://app.gov.co/assets/img/carcel/Logo-Agencia-APP-morado.png	Agencia Para La Gestión Del Paisaje, El Patrimonio y las Alianzas Público Privadas	900623766-1	Adscrita	Planeación y Gestión Territorial	Unidad Administrativa Especial	Gestionar y promover las acciones que garanticen la cualificación, sostenibilidad y mantenimiento del Sistema Público y Colectivo definido en el Plan de Ordenamiento Territorial, enfocándose al espacio público de esparcimiento y encuentro, paisaje, patrimonio, los equipamientos y demás bienes fiscales que hagan parte de los correspondientes proyectos; realizar la gestión requerida para promover la generación o incremento de recursos a través de la implementación y gestión de los instrumentos financieros definidos en el POT y fomentar la incorporación de capital privados a proyectos de inversión de beneficio público	\N	\N	\N	APP	Entidades de gobierno	Establecimientos publicos territoriales	91800000
6	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-savia-300x148.png	Alianza Medellín Antioquia EPS S.A.S - Savia Salud Eps	900604350-0	Vinculada	Salud, Inclusión Social y Familia y la No-violencia	Economía Mixta	Entidad Administradora de Planes de Beneficios de Salud, que gestiona el aseguramiento de la población pobre y vulnerable, para impactar en la calidad de vida de sus afiliados	\N	\N	\N	Savia	Empresas no cotizantes	Empresas territoriales no financieras	\N
15	https://www.edu.gov.co/images/logoedu.png	Empresa De Desarrollo Urbano	800223337-6	Vinculada	Habitat, Movilidad, Infraestructura y Sostenibilidad	Empresa Industrial y Comercial del Estado	Empresa es la gestión y operación urbana e inmobiliaria, el desarrollo, la ejecución, la asesoría y la consultoría de planes, programas y proyectos urbanos e inmobiliarios, en el ámbito municipal, departamental, nacional e internacional	\N	\N	\N	EDU	Empresas no cotizantes	Empresas territoriales no financieras	\N
10	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-cuenca-verde-150x92.png	Corporación Cuenca Verde	900680466-1	Indirecta	Habitat, Movilidad, Infraestructura y Sostenibilidad	Entidad Sin Ánimo De Lucro - Corporación	Consecución, administración, gestión, inversión, asignación y disposición de recursos financieros destinados a proteger, mantener, preservar los servicios ambientales, especialmente el agua, en las cuencas abastecedoras de los embalses que proveen de agua a los municipios del Valle de Aburrá	\N	\N	\N	Cuenca Verde	Entidades que no reportan al CHIP	Entidades que no reportan al CHIP	\N
7	https://cdnwordpresstest-f0ekdgevcngegudb.z01.azurefd.net/es/wp-content/uploads/2022/10/logo-telemedellin-150x95.png	Asociación Canal Local De Televisión De Medellín	811006762-3	Indirecta	Ciencia, Tecnología e Innovación, Desarrollo Económico, Internacionalización	Entidad Sin Ánimo De Lucro - Asociación entre Entidades Públicas	Prestación del servicio público de televisión local, con énfasis en una programación de contenido social, comunitario, educativo, cultural y científico e, igualmente, desarrollar actividades de mercadeo, publicidad, investigación y planeación de medios que le permitan a éste ser una alternativa importante de pauta tanto para el Distrito de Medellín como para otras empresas de diferentes sectores económicos	\N	\N	\N	Telemedellin	Empresas no cotizantes	Empresas territoriales no financieras	90700000
\.


--
-- TOC entry 5083 (class 0 OID 123453)
-- Dependencies: 231
-- Data for Name: entidad_asignada; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.entidad_asignada (id, entidad_id, user_id, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5086 (class 0 OID 123459)
-- Dependencies: 234
-- Data for Name: equipo_financiero; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.equipo_financiero (id, nombres, apellidos, email, cargo, nombre_archivo, ruta_foto, fecha_creacion, "order") FROM stdin;
\.


--
-- TOC entry 5089 (class 0 OID 123467)
-- Dependencies: 237
-- Data for Name: estado_resultado; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.estado_resultado (id_registro, entidad_id, sigla, fecha_corte, clase, grupo, valor, fecha_registro) FROM stdin;
\.


--
-- TOC entry 5090 (class 0 OID 123474)
-- Dependencies: 238
-- Data for Name: eventos; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.eventos (id, fecha, nombre, fecha_creacion, descripcion, creado_por_id, entidad_id, estado, tipo_reunion, hora_ini, hora_fin, color, tipo_entidad_id, procesado) FROM stdin;
\.


--
-- TOC entry 5092 (class 0 OID 123483)
-- Dependencies: 240
-- Data for Name: fecha_limite_reportes; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.fecha_limite_reportes (id, fecha_subir_inicio, fecha_subir_final, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5094 (class 0 OID 123488)
-- Dependencies: 242
-- Data for Name: gestion_conocimiento; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.gestion_conocimiento (id, titulo, tipo_archivo, archivo_content_type, nombre_archivo, ruta, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5096 (class 0 OID 123495)
-- Dependencies: 244
-- Data for Name: historial_carga_global; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.historial_carga_global (id, entidad_id, nombres, apellidos, cedula, sigla_entidad, seccion, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5098 (class 0 OID 123502)
-- Dependencies: 246
-- Data for Name: historial_carga_informes; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.historial_carga_informes (id, user_id, informe, nombre_archivo, ruta, fecha_descarga) FROM stdin;
\.


--
-- TOC entry 5100 (class 0 OID 123508)
-- Dependencies: 248
-- Data for Name: logs; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.logs (id_registro, usuario, fecha_registro, metodo, ruta, accion, ip) FROM stdin;
\.


--
-- TOC entry 5101 (class 0 OID 123514)
-- Dependencies: 249
-- Data for Name: municipios; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.municipios (id_municipio, municipio, estado, departamento_id) FROM stdin;
1	Abriaquí	1	5
2	Acacías	1	50
3	Acandí	1	27
4	Acevedo	1	41
5	Achí	1	13
6	Agrado	1	41
7	Agua de Dios	1	25
8	Aguachica	1	20
9	Aguada	1	68
10	Aguadas	1	17
11	Aguazul	1	85
12	Agustín Codazzi	1	20
13	Aipe	1	41
14	Albania	1	18
15	Albania	1	44
16	Albania	1	68
17	Albán	1	25
18	Albán (San José)	1	52
19	Alcalá	1	76
20	Alejandria	1	5
21	Algarrobo	1	47
22	Algeciras	1	41
23	Almaguer	1	19
24	Almeida	1	15
25	Alpujarra	1	73
26	Altamira	1	41
27	Alto Baudó (Pie de Pato)	1	27
28	Altos del Rosario	1	13
29	Alvarado	1	73
30	Amagá	1	5
31	Amalfi	1	5
32	Ambalema	1	73
33	Anapoima	1	25
34	Ancuya	1	52
35	Andalucía	1	76
36	Andes	1	5
37	Angelópolis	1	5
38	Angostura	1	5
39	Anolaima	1	25
40	Anorí	1	5
41	Anserma	1	17
42	Ansermanuevo	1	76
43	Anzoátegui	1	73
44	Anzá	1	5
45	Apartadó	1	5
46	Apulo	1	25
47	Apía	1	66
48	Aquitania	1	15
49	Aracataca	1	47
50	Aranzazu	1	17
51	Aratoca	1	68
52	Arauca	1	81
53	Arauquita	1	81
54	Arbeláez	1	25
55	Arboleda (Berruecos)	1	52
56	Arboledas	1	54
57	Arboletes	1	5
58	Arcabuco	1	15
59	Arenal	1	13
60	Argelia	1	5
61	Argelia	1	19
62	Argelia	1	76
63	Ariguaní (El Difícil)	1	47
64	Arjona	1	13
65	Armenia	1	5
66	Armenia	1	63
67	Armero (Guayabal)	1	73
68	Arroyohondo	1	13
69	Astrea	1	20
70	Ataco	1	73
71	Atrato (Yuto)	1	27
72	Ayapel	1	23
73	Bagadó	1	27
74	Bahía Solano (Mútis)	1	27
75	Bajo Baudó (Pizarro)	1	27
76	Balboa	1	19
77	Balboa	1	66
78	Baranoa	1	8
79	Baraya	1	41
80	Barbacoas	1	52
81	Barbosa	1	5
82	Barbosa	1	68
83	Barichara	1	68
84	Barranca de Upía	1	50
85	Barrancabermeja	1	68
86	Barrancas	1	44
87	Barranco de Loba	1	13
88	Barranquilla	1	8
89	Becerríl	1	20
90	Belalcázar	1	17
91	Bello	1	5
92	Belmira	1	5
93	Beltrán	1	25
94	Belén	1	15
95	Belén	1	52
96	Belén de Bajirá	1	27
97	Belén de Umbría	1	66
98	Belén de los Andaquíes	1	18
99	Berbeo	1	15
100	Betania	1	5
101	Beteitiva	1	15
102	Betulia	1	5
103	Betulia	1	68
104	Bituima	1	25
105	Boavita	1	15
106	Bochalema	1	54
107	Bogotá D.C.	1	11
108	Bojacá	1	25
109	Bojayá (Bellavista)	1	27
110	Bolívar	1	5
111	Bolívar	1	19
112	Bolívar	1	68
113	Bolívar	1	76
114	Bosconia	1	20
115	Boyacá	1	15
116	Briceño	1	5
117	Briceño	1	15
118	Bucaramanga	1	68
119	Bucarasica	1	54
120	Buenaventura	1	76
121	Buenavista	1	15
122	Buenavista	1	23
123	Buenavista	1	63
124	Buenavista	1	70
125	Buenos Aires	1	19
126	Buesaco	1	52
127	Buga	1	76
128	Bugalagrande	1	76
129	Burítica	1	5
130	Busbanza	1	15
131	Cabrera	1	25
132	Cabrera	1	68
133	Cabuyaro	1	50
134	Cachipay	1	25
135	Caicedo	1	5
136	Caicedonia	1	76
137	Caimito	1	70
138	Cajamarca	1	73
139	Cajibío	1	19
140	Cajicá	1	25
141	Calamar	1	13
142	Calamar	1	95
143	Calarcá	1	63
144	Caldas	1	5
145	Caldas	1	15
146	Caldono	1	19
147	California	1	68
148	Calima (Darién)	1	76
149	Caloto	1	19
150	Calí	1	76
151	Campamento	1	5
152	Campo de la Cruz	1	8
153	Campoalegre	1	41
154	Campohermoso	1	15
155	Canalete	1	23
156	Candelaria	1	8
157	Candelaria	1	76
158	Cantagallo	1	13
159	Cantón de San Pablo	1	27
160	Caparrapí	1	25
161	Capitanejo	1	68
162	Caracolí	1	5
163	Caramanta	1	5
164	Carcasí	1	68
165	Carepa	1	5
166	Carmen de Apicalá	1	73
167	Carmen de Carupa	1	25
168	Carmen de Viboral	1	5
169	Carmen del Darién (CURBARADÓ)	1	27
170	Carolina	1	5
171	Cartagena	1	13
172	Cartagena del Chairá	1	18
173	Cartago	1	76
174	Carurú	1	97
175	Casabianca	1	73
176	Castilla la Nueva	1	50
177	Caucasia	1	5
178	Cañasgordas	1	5
179	Cepita	1	68
180	Cereté	1	23
181	Cerinza	1	15
182	Cerrito	1	68
183	Cerro San Antonio	1	47
184	Chachaguí	1	52
185	Chaguaní	1	25
186	Chalán	1	70
187	Chaparral	1	73
188	Charalá	1	68
189	Charta	1	68
190	Chigorodó	1	5
191	Chima	1	68
192	Chimichagua	1	20
193	Chimá	1	23
194	Chinavita	1	15
195	Chinchiná	1	17
196	Chinácota	1	54
197	Chinú	1	23
198	Chipaque	1	25
199	Chipatá	1	68
200	Chiquinquirá	1	15
201	Chiriguaná	1	20
202	Chiscas	1	15
203	Chita	1	15
204	Chitagá	1	54
205	Chitaraque	1	15
206	Chivatá	1	15
207	Chivolo	1	47
208	Choachí	1	25
209	Chocontá	1	25
210	Chámeza	1	85
211	Chía	1	25
212	Chíquiza	1	15
213	Chívor	1	15
214	Cicuco	1	13
215	Cimitarra	1	68
216	Circasia	1	63
217	Cisneros	1	5
218	Ciénaga	1	15
219	Ciénaga	1	47
220	Ciénaga de Oro	1	23
221	Clemencia	1	13
222	Cocorná	1	5
223	Coello	1	73
224	Cogua	1	25
225	Colombia	1	41
226	Colosó (Ricaurte)	1	70
227	Colón	1	86
228	Colón (Génova)	1	52
229	Concepción	1	5
230	Concepción	1	68
231	Concordia	1	5
232	Concordia	1	47
233	Condoto	1	27
234	Confines	1	68
235	Consaca	1	52
236	Contadero	1	52
237	Contratación	1	68
238	Convención	1	54
239	Copacabana	1	5
240	Coper	1	15
241	Cordobá	1	63
242	Corinto	1	19
243	Coromoro	1	68
244	Corozal	1	70
245	Corrales	1	15
246	Cota	1	25
247	Cotorra	1	23
248	Covarachía	1	15
249	Coveñas	1	70
250	Coyaima	1	73
251	Cravo Norte	1	81
252	Cuaspud (Carlosama)	1	52
253	Cubarral	1	50
254	Cubará	1	15
255	Cucaita	1	15
256	Cucunubá	1	25
257	Cucutilla	1	54
258	Cuitiva	1	15
259	Cumaral	1	50
260	Cumaribo	1	99
261	Cumbal	1	52
262	Cumbitara	1	52
263	Cunday	1	73
264	Curillo	1	18
265	Curití	1	68
266	Curumaní	1	20
267	Cáceres	1	5
268	Cáchira	1	54
269	Cácota	1	54
270	Cáqueza	1	25
271	Cértegui	1	27
272	Cómbita	1	15
273	Córdoba	1	13
274	Córdoba	1	52
275	Cúcuta	1	54
276	Dabeiba	1	5
277	Dagua	1	76
278	Dibulla	1	44
279	Distracción	1	44
280	Dolores	1	73
281	Don Matías	1	5
282	Dos Quebradas	1	66
283	Duitama	1	15
284	Durania	1	54
285	Ebéjico	1	5
286	El Bagre	1	5
287	El Banco	1	47
288	El Cairo	1	76
289	El Calvario	1	50
290	El Carmen	1	54
291	El Carmen	1	68
292	El Carmen de Atrato	1	27
293	El Carmen de Bolívar	1	13
294	El Castillo	1	50
295	El Cerrito	1	76
296	El Charco	1	52
297	El Cocuy	1	15
298	El Colegio	1	25
299	El Copey	1	20
300	El Doncello	1	18
301	El Dorado	1	50
302	El Dovio	1	76
303	El Espino	1	15
304	El Guacamayo	1	68
305	El Guamo	1	13
306	El Molino	1	44
307	El Paso	1	20
308	El Paujil	1	18
309	El Peñol	1	52
310	El Peñon	1	13
311	El Peñon	1	68
312	El Peñón	1	25
313	El Piñon	1	47
314	El Playón	1	68
315	El Retorno	1	95
316	El Retén	1	47
317	El Roble	1	70
318	El Rosal	1	25
319	El Rosario	1	52
320	El Tablón de Gómez	1	52
321	El Tambo	1	19
322	El Tambo	1	52
323	El Tarra	1	54
324	El Zulia	1	54
325	El Águila	1	76
326	Elías	1	41
327	Encino	1	68
328	Enciso	1	68
329	Entrerríos	1	5
330	Envigado	1	5
331	Espinal	1	73
332	Facatativá	1	25
333	Falan	1	73
334	Filadelfia	1	17
335	Filandia	1	63
336	Firavitoba	1	15
337	Flandes	1	73
338	Florencia	1	18
339	Florencia	1	19
340	Floresta	1	15
341	Florida	1	76
342	Floridablanca	1	68
343	Florián	1	68
344	Fonseca	1	44
345	Fortúl	1	81
346	Fosca	1	25
347	Francisco Pizarro	1	52
348	Fredonia	1	5
349	Fresno	1	73
350	Frontino	1	5
351	Fuente de Oro	1	50
352	Fundación	1	47
353	Funes	1	52
354	Funza	1	25
355	Fusagasugá	1	25
356	Fómeque	1	25
357	Fúquene	1	25
358	Gachalá	1	25
359	Gachancipá	1	25
360	Gachantivá	1	15
361	Gachetá	1	25
362	Galapa	1	8
363	Galeras (Nueva Granada)	1	70
364	Galán	1	68
365	Gama	1	25
366	Gamarra	1	20
367	Garagoa	1	15
368	Garzón	1	41
369	Gigante	1	41
370	Ginebra	1	76
371	Giraldo	1	5
372	Girardot	1	25
373	Girardota	1	5
374	Girón	1	68
375	Gonzalez	1	20
376	Gramalote	1	54
377	Granada	1	5
378	Granada	1	25
379	Granada	1	50
380	Guaca	1	68
381	Guacamayas	1	15
382	Guacarí	1	76
383	Guachavés	1	52
384	Guachené	1	19
385	Guachetá	1	25
386	Guachucal	1	52
387	Guadalupe	1	5
388	Guadalupe	1	41
389	Guadalupe	1	68
390	Guaduas	1	25
391	Guaitarilla	1	52
392	Gualmatán	1	52
393	Guamal	1	47
394	Guamal	1	50
395	Guamo	1	73
396	Guapota	1	68
397	Guapí	1	19
398	Guaranda	1	70
399	Guarne	1	5
400	Guasca	1	25
401	Guatapé	1	5
402	Guataquí	1	25
403	Guatavita	1	25
404	Guateque	1	15
405	Guavatá	1	68
406	Guayabal de Siquima	1	25
407	Guayabetal	1	25
408	Guayatá	1	15
409	Guepsa	1	68
410	Guicán	1	15
411	Gutiérrez	1	25
412	Guática	1	66
413	Gámbita	1	68
414	Gámeza	1	15
415	Génova	1	63
416	Gómez Plata	1	5
417	Hacarí	1	54
418	Hatillo de Loba	1	13
419	Hato	1	68
420	Hato Corozal	1	85
421	Hatonuevo	1	44
422	Heliconia	1	5
423	Herrán	1	54
424	Herveo	1	73
425	Hispania	1	5
426	Hobo	1	41
427	Honda	1	73
428	Ibagué	1	73
429	Icononzo	1	73
430	Iles	1	52
431	Imúes	1	52
432	Inzá	1	19
433	Inírida	1	94
434	Ipiales	1	52
435	Isnos	1	41
436	Istmina	1	27
437	Itagüí	1	5
438	Ituango	1	5
439	Izá	1	15
440	Jambaló	1	19
441	Jamundí	1	76
442	Jardín	1	5
443	Jenesano	1	15
444	Jericó	1	5
445	Jericó	1	15
446	Jerusalén	1	25
447	Jesús María	1	68
448	Jordán	1	68
449	Juan de Acosta	1	8
450	Junín	1	25
451	Juradó	1	27
452	La Apartada y La Frontera	1	23
453	La Argentina	1	41
454	La Belleza	1	68
455	La Calera	1	25
456	La Capilla	1	15
457	La Ceja	1	5
458	La Celia	1	66
459	La Cruz	1	52
460	La Cumbre	1	76
461	La Dorada	1	17
462	La Esperanza	1	54
463	La Estrella	1	5
464	La Florida	1	52
465	La Gloria	1	20
466	La Jagua de Ibirico	1	20
467	La Jagua del Pilar	1	44
468	La Llanada	1	52
469	La Macarena	1	50
470	La Merced	1	17
471	La Mesa	1	25
472	La Montañita	1	18
473	La Palma	1	25
474	La Paz	1	68
475	La Paz (Robles)	1	20
476	La Peña	1	25
477	La Pintada	1	5
478	La Plata	1	41
479	La Playa	1	54
480	La Primavera	1	99
481	La Salina	1	85
482	La Sierra	1	19
483	La Tebaida	1	63
484	La Tola	1	52
485	La Unión	1	5
486	La Unión	1	52
487	La Unión	1	70
488	La Unión	1	76
489	La Uvita	1	15
490	La Vega	1	19
491	La Vega	1	25
492	La Victoria	1	15
493	La Victoria	1	17
494	La Victoria	1	76
495	La Virginia	1	66
496	Labateca	1	54
497	Labranzagrande	1	15
498	Landázuri	1	68
499	Lebrija	1	68
500	Leiva	1	52
501	Lejanías	1	50
502	Lenguazaque	1	25
503	Leticia	1	91
504	Liborina	1	5
505	Linares	1	52
506	Lloró	1	27
507	Lorica	1	23
508	Los Córdobas	1	23
509	Los Palmitos	1	70
510	Los Patios	1	54
511	Los Santos	1	68
512	Lourdes	1	54
513	Luruaco	1	8
514	Lérida	1	73
515	Líbano	1	73
516	López (Micay)	1	19
517	Macanal	1	15
518	Macaravita	1	68
519	Maceo	1	5
520	Machetá	1	25
521	Madrid	1	25
522	Magangué	1	13
523	Magüi (Payán)	1	52
524	Mahates	1	13
525	Maicao	1	44
526	Majagual	1	70
527	Malambo	1	8
528	Mallama (Piedrancha)	1	52
529	Manatí	1	8
530	Manaure	1	44
531	Manaure Balcón del Cesar	1	20
532	Manizales	1	17
533	Manta	1	25
534	Manzanares	1	17
535	Maní	1	85
536	Mapiripan	1	50
537	Margarita	1	13
538	Marinilla	1	5
539	Maripí	1	15
540	Mariquita	1	73
541	Marmato	1	17
542	Marquetalia	1	17
543	Marsella	1	66
544	Marulanda	1	17
545	María la Baja	1	13
546	Matanza	1	68
547	Medellín	1	5
548	Medina	1	25
549	Medio Atrato	1	27
550	Medio Baudó	1	27
551	Medio San Juan (ANDAGOYA)	1	27
552	Melgar	1	73
553	Mercaderes	1	19
554	Mesetas	1	50
555	Milán	1	18
556	Miraflores	1	15
557	Miraflores	1	95
558	Miranda	1	19
559	Mistrató	1	66
560	Mitú	1	97
561	Mocoa	1	86
562	Mogotes	1	68
563	Molagavita	1	68
564	Momil	1	23
565	Mompós	1	13
566	Mongua	1	15
567	Monguí	1	15
568	Moniquirá	1	15
569	Montebello	1	5
570	Montecristo	1	13
571	Montelíbano	1	23
572	Montenegro	1	63
573	Monteria	1	23
574	Monterrey	1	85
575	Morales	1	13
576	Morales	1	19
577	Morelia	1	18
578	Morroa	1	70
579	Mosquera	1	25
580	Mosquera	1	52
581	Motavita	1	15
582	Moñitos	1	23
583	Murillo	1	73
584	Murindó	1	5
585	Mutatá	1	5
586	Mutiscua	1	54
587	Muzo	1	15
588	Málaga	1	68
589	Nariño	1	5
590	Nariño	1	25
591	Nariño	1	52
592	Natagaima	1	73
593	Nechí	1	5
594	Necoclí	1	5
595	Neira	1	17
596	Neiva	1	41
597	Nemocón	1	25
598	Nilo	1	25
599	Nimaima	1	25
600	Nobsa	1	15
601	Nocaima	1	25
602	Norcasia	1	17
603	Norosí	1	13
604	Novita	1	27
605	Nueva Granada	1	47
606	Nuevo Colón	1	15
607	Nunchía	1	85
608	Nuquí	1	27
609	Nátaga	1	41
610	Obando	1	76
611	Ocamonte	1	68
612	Ocaña	1	54
613	Oiba	1	68
614	Oicatá	1	15
615	Olaya	1	5
616	Olaya Herrera	1	52
617	Onzaga	1	68
618	Oporapa	1	41
619	Orito	1	86
620	Orocué	1	85
621	Ortega	1	73
622	Ospina	1	52
623	Otanche	1	15
624	Ovejas	1	70
625	Pachavita	1	15
626	Pacho	1	25
627	Padilla	1	19
628	Paicol	1	41
629	Pailitas	1	20
630	Paime	1	25
631	Paipa	1	15
632	Pajarito	1	15
633	Palermo	1	41
634	Palestina	1	17
635	Palestina	1	41
636	Palmar	1	68
637	Palmar de Varela	1	8
638	Palmas del Socorro	1	68
639	Palmira	1	76
640	Palmito	1	70
641	Palocabildo	1	73
642	Pamplona	1	54
643	Pamplonita	1	54
644	Pandi	1	25
645	Panqueba	1	15
646	Paratebueno	1	25
647	Pasca	1	25
648	Patía (El Bordo)	1	19
649	Pauna	1	15
650	Paya	1	15
651	Paz de Ariporo	1	85
652	Paz de Río	1	15
653	Pedraza	1	47
654	Pelaya	1	20
655	Pensilvania	1	17
656	Peque	1	5
657	Pereira	1	66
658	Pesca	1	15
659	Peñol	1	5
660	Piamonte	1	19
661	Pie de Cuesta	1	68
662	Piedras	1	73
663	Piendamó	1	19
664	Pijao	1	63
665	Pijiño	1	47
666	Pinchote	1	68
667	Pinillos	1	13
668	Piojo	1	8
669	Pisva	1	15
670	Pital	1	41
671	Pitalito	1	41
672	Pivijay	1	47
673	Planadas	1	73
674	Planeta Rica	1	23
675	Plato	1	47
676	Policarpa	1	52
677	Polonuevo	1	8
678	Ponedera	1	8
679	Popayán	1	19
680	Pore	1	85
681	Potosí	1	52
682	Pradera	1	76
683	Prado	1	73
684	Providencia	1	52
685	Providencia	1	88
686	Pueblo Bello	1	20
687	Pueblo Nuevo	1	23
688	Pueblo Rico	1	66
689	Pueblorrico	1	5
690	Puebloviejo	1	47
691	Puente Nacional	1	68
692	Puerres	1	52
693	Puerto Asís	1	86
694	Puerto Berrío	1	5
695	Puerto Boyacá	1	15
696	Puerto Caicedo	1	86
697	Puerto Carreño	1	99
698	Puerto Colombia	1	8
699	Puerto Concordia	1	50
700	Puerto Escondido	1	23
701	Puerto Gaitán	1	50
702	Puerto Guzmán	1	86
703	Puerto Leguízamo	1	86
704	Puerto Libertador	1	23
705	Puerto Lleras	1	50
706	Puerto López	1	50
707	Puerto Nare	1	5
708	Puerto Nariño	1	91
709	Puerto Parra	1	68
710	Puerto Rico	1	18
711	Puerto Rico	1	50
712	Puerto Rondón	1	81
713	Puerto Salgar	1	25
714	Puerto Santander	1	54
715	Puerto Tejada	1	19
716	Puerto Triunfo	1	5
717	Puerto Wilches	1	68
718	Pulí	1	25
719	Pupiales	1	52
720	Puracé (Coconuco)	1	19
721	Purificación	1	73
722	Purísima	1	23
723	Pácora	1	17
724	Páez	1	15
725	Páez (Belalcazar)	1	19
726	Páramo	1	68
727	Quebradanegra	1	25
728	Quetame	1	25
729	Quibdó	1	27
730	Quimbaya	1	63
731	Quinchía	1	66
732	Quipama	1	15
733	Quipile	1	25
734	Ragonvalia	1	54
735	Ramiriquí	1	15
736	Recetor	1	85
737	Regidor	1	13
738	Remedios	1	5
739	Remolino	1	47
740	Repelón	1	8
741	Restrepo	1	50
742	Restrepo	1	76
743	Retiro	1	5
744	Ricaurte	1	25
745	Ricaurte	1	52
746	Rio Negro	1	68
747	Rioblanco	1	73
748	Riofrío	1	76
749	Riohacha	1	44
750	Risaralda	1	17
751	Rivera	1	41
752	Roberto Payán (San José)	1	52
753	Roldanillo	1	76
754	Roncesvalles	1	73
755	Rondón	1	15
756	Rosas	1	19
757	Rovira	1	73
758	Ráquira	1	15
759	Río Iró	1	27
760	Río Quito	1	27
761	Río Sucio	1	17
762	Río Viejo	1	13
763	Río de oro	1	20
764	Ríonegro	1	5
765	Ríosucio	1	27
766	Sabana de Torres	1	68
767	Sabanagrande	1	8
768	Sabanalarga	1	5
769	Sabanalarga	1	8
770	Sabanalarga	1	85
771	Sabanas de San Angel (SAN ANGEL)	1	47
772	Sabaneta	1	5
773	Saboyá	1	15
774	Sahagún	1	23
775	Saladoblanco	1	41
776	Salamina	1	17
777	Salamina	1	47
778	Salazar	1	54
779	Saldaña	1	73
780	Salento	1	63
781	Salgar	1	5
782	Samacá	1	15
783	Samaniego	1	52
784	Samaná	1	17
785	Sampués	1	70
786	San Agustín	1	41
787	San Alberto	1	20
788	San Andrés	1	68
789	San Andrés Sotavento	1	23
790	San Andrés de Cuerquía	1	5
791	San Antero	1	23
792	San Antonio	1	73
793	San Antonio de Tequendama	1	25
794	San Benito	1	68
795	San Benito Abad	1	70
796	San Bernardo	1	25
797	San Bernardo	1	52
798	San Bernardo del Viento	1	23
799	San Calixto	1	54
800	San Carlos	1	5
801	San Carlos	1	23
802	San Carlos de Guaroa	1	50
803	San Cayetano	1	25
804	San Cayetano	1	54
805	San Cristobal	1	13
806	San Diego	1	20
807	San Eduardo	1	15
808	San Estanislao	1	13
809	San Fernando	1	13
810	San Francisco	1	5
811	San Francisco	1	25
812	San Francisco	1	86
813	San Gíl	1	68
814	San Jacinto	1	13
815	San Jacinto del Cauca	1	13
816	San Jerónimo	1	5
817	San Joaquín	1	68
818	San José	1	17
819	San José de Miranda	1	68
820	San José de Montaña	1	5
821	San José de Pare	1	15
822	San José de Uré	1	23
823	San José del Fragua	1	18
824	San José del Guaviare	1	95
825	San José del Palmar	1	27
826	San Juan de Arama	1	50
827	San Juan de Betulia	1	70
828	San Juan de Nepomuceno	1	13
829	San Juan de Pasto	1	52
830	San Juan de Río Seco	1	25
831	San Juan de Urabá	1	5
832	San Juan del Cesar	1	44
833	San Juanito	1	50
834	San Lorenzo	1	52
835	San Luis	1	73
836	San Luís	1	5
837	San Luís de Gaceno	1	15
838	San Luís de Palenque	1	85
839	San Marcos	1	70
840	San Martín	1	20
841	San Martín	1	50
842	San Martín de Loba	1	13
843	San Mateo	1	15
844	San Miguel	1	68
845	San Miguel	1	86
846	San Miguel de Sema	1	15
847	San Onofre	1	70
848	San Pablo	1	13
849	San Pablo	1	52
850	San Pablo de Borbur	1	15
851	San Pedro	1	5
852	San Pedro	1	70
853	San Pedro	1	76
854	San Pedro de Cartago	1	52
855	San Pedro de Urabá	1	5
856	San Pelayo	1	23
857	San Rafael	1	5
858	San Roque	1	5
859	San Sebastián	1	19
860	San Sebastián de Buenavista	1	47
861	San Vicente	1	5
862	San Vicente del Caguán	1	18
863	San Vicente del Chucurí	1	68
864	San Zenón	1	47
865	Sandoná	1	52
866	Santa Ana	1	47
867	Santa Bárbara	1	5
868	Santa Bárbara	1	68
869	Santa Bárbara (Iscuandé)	1	52
870	Santa Bárbara de Pinto	1	47
871	Santa Catalina	1	13
872	Santa Fé de Antioquia	1	5
873	Santa Genoveva de Docorodó	1	27
874	Santa Helena del Opón	1	68
875	Santa Isabel	1	73
876	Santa Lucía	1	8
877	Santa Marta	1	47
878	Santa María	1	15
879	Santa María	1	41
880	Santa Rosa	1	13
881	Santa Rosa	1	19
882	Santa Rosa de Cabal	1	66
883	Santa Rosa de Osos	1	5
884	Santa Rosa de Viterbo	1	15
885	Santa Rosa del Sur	1	13
886	Santa Rosalía	1	99
887	Santa Sofía	1	15
888	Santana	1	15
889	Santander de Quilichao	1	19
890	Santiago	1	54
891	Santiago	1	86
892	Santo Domingo	1	5
893	Santo Tomás	1	8
894	Santuario	1	5
895	Santuario	1	66
896	Sapuyes	1	52
897	Saravena	1	81
898	Sardinata	1	54
899	Sasaima	1	25
900	Sativanorte	1	15
901	Sativasur	1	15
902	Segovia	1	5
903	Sesquilé	1	25
904	Sevilla	1	76
905	Siachoque	1	15
906	Sibaté	1	25
907	Sibundoy	1	86
908	Silos	1	54
909	Silvania	1	25
910	Silvia	1	19
911	Simacota	1	68
912	Simijaca	1	25
913	Simití	1	13
914	Sincelejo	1	70
915	Sincé	1	70
916	Sipí	1	27
917	Sitionuevo	1	47
918	Soacha	1	25
919	Soatá	1	15
920	Socha	1	15
921	Socorro	1	68
922	Socotá	1	15
923	Sogamoso	1	15
924	Solano	1	18
925	Soledad	1	8
926	Solita	1	18
927	Somondoco	1	15
928	Sonsón	1	5
929	Sopetrán	1	5
930	Soplaviento	1	13
931	Sopó	1	25
932	Sora	1	15
933	Soracá	1	15
934	Sotaquirá	1	15
935	Sotara (Paispamba)	1	19
936	Sotomayor (Los Andes)	1	52
937	Suaita	1	68
938	Suan	1	8
939	Suaza	1	41
940	Subachoque	1	25
941	Sucre	1	19
942	Sucre	1	68
943	Sucre	1	70
944	Suesca	1	25
945	Supatá	1	25
946	Supía	1	17
947	Suratá	1	68
948	Susa	1	25
949	Susacón	1	15
950	Sutamarchán	1	15
951	Sutatausa	1	25
952	Sutatenza	1	15
953	Suárez	1	19
954	Suárez	1	73
955	Sácama	1	85
956	Sáchica	1	15
957	Tabio	1	25
958	Tadó	1	27
959	Talaigua Nuevo	1	13
960	Tamalameque	1	20
961	Tame	1	81
962	Taminango	1	52
963	Tangua	1	52
964	Taraira	1	97
965	Tarazá	1	5
966	Tarqui	1	41
967	Tarso	1	5
968	Tasco	1	15
969	Tauramena	1	85
970	Tausa	1	25
971	Tello	1	41
972	Tena	1	25
973	Tenerife	1	47
974	Tenjo	1	25
975	Tenza	1	15
976	Teorama	1	54
977	Teruel	1	41
978	Tesalia	1	41
979	Tibacuy	1	25
980	Tibaná	1	15
981	Tibasosa	1	15
982	Tibirita	1	25
983	Tibú	1	54
984	Tierralta	1	23
985	Timaná	1	41
986	Timbiquí	1	19
987	Timbío	1	19
988	Tinjacá	1	15
989	Tipacoque	1	15
990	Tiquisio (Puerto Rico)	1	13
991	Titiribí	1	5
992	Toca	1	15
993	Tocaima	1	25
994	Tocancipá	1	25
995	Toguí	1	15
996	Toledo	1	5
997	Toledo	1	54
998	Tolú	1	70
999	Tolú Viejo	1	70
1000	Tona	1	68
1001	Topagá	1	15
1002	Topaipí	1	25
1003	Toribío	1	19
1004	Toro	1	76
1005	Tota	1	15
1006	Totoró	1	19
1007	Trinidad	1	85
1008	Trujillo	1	76
1009	Tubará	1	8
1010	Tuchín	1	23
1011	Tulúa	1	76
1012	Tumaco	1	52
1013	Tunja	1	15
1014	Tunungua	1	15
1015	Turbaco	1	13
1016	Turbaná	1	13
1017	Turbo	1	5
1018	Turmequé	1	15
1019	Tuta	1	15
1020	Tutasá	1	15
1021	Támara	1	85
1022	Támesis	1	5
1023	Túquerres	1	52
1024	Ubalá	1	25
1025	Ubaque	1	25
1026	Ubaté	1	25
1027	Ulloa	1	76
1028	Une	1	25
1029	Unguía	1	27
1030	Unión Panamericana (ÁNIMAS)	1	27
1031	Uramita	1	5
1032	Uribe	1	50
1033	Uribia	1	44
1034	Urrao	1	5
1035	Urumita	1	44
1036	Usiacuri	1	8
1037	Valdivia	1	5
1038	Valencia	1	23
1039	Valle de San José	1	68
1040	Valle de San Juan	1	73
1041	Valle del Guamuez	1	86
1042	Valledupar	1	20
1043	Valparaiso	1	5
1044	Valparaiso	1	18
1045	Vegachí	1	5
1046	Venadillo	1	73
1047	Venecia	1	5
1048	Venecia (Ospina Pérez)	1	25
1049	Ventaquemada	1	15
1050	Vergara	1	25
1051	Versalles	1	76
1052	Vetas	1	68
1053	Viani	1	25
1054	Vigía del Fuerte	1	5
1055	Vijes	1	76
1056	Villa Caro	1	54
1057	Villa Rica	1	19
1058	Villa de Leiva	1	15
1059	Villa del Rosario	1	54
1060	Villagarzón	1	86
1061	Villagómez	1	25
1062	Villahermosa	1	73
1063	Villamaría	1	17
1064	Villanueva	1	13
1065	Villanueva	1	44
1066	Villanueva	1	68
1067	Villanueva	1	85
1068	Villapinzón	1	25
1069	Villarrica	1	73
1070	Villavicencio	1	50
1071	Villavieja	1	41
1072	Villeta	1	25
1073	Viotá	1	25
1074	Viracachá	1	15
1075	Vista Hermosa	1	50
1076	Viterbo	1	17
1077	Vélez	1	68
1078	Yacopí	1	25
1079	Yacuanquer	1	52
1080	Yaguará	1	41
1081	Yalí	1	5
1082	Yarumal	1	5
1083	Yolombó	1	5
1084	Yondó (Casabe)	1	5
1085	Yopal	1	85
1086	Yotoco	1	76
1087	Yumbo	1	76
1088	Zambrano	1	13
1089	Zapatoca	1	68
1090	Zapayán (PUNTA DE PIEDRAS)	1	47
1091	Zaragoza	1	5
1092	Zarzal	1	76
1093	Zetaquirá	1	15
1094	Zipacón	1	25
1095	Zipaquirá	1	25
1096	Zona Bananera (PRADO - SEVILLA)	1	47
1097	Ábrego	1	54
1098	Íquira	1	41
1099	Úmbita	1	15
1100	Útica	1	25
\.


--
-- TOC entry 5102 (class 0 OID 123518)
-- Dependencies: 250
-- Data for Name: notificiaciones; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.notificiaciones (id, nombre, description, section, user_id, read, fecha_creacion, fecha_actualizacion) FROM stdin;
\.


--
-- TOC entry 5104 (class 0 OID 123527)
-- Dependencies: 252
-- Data for Name: plantilla_gastos; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.plantilla_gastos (id, entidad_id, fondo, centro_gestor, area_funcional, proyecto, nombre_cuenta, presupuesto_inicial, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5106 (class 0 OID 123534)
-- Dependencies: 254
-- Data for Name: plantilla_ingresos; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.plantilla_ingresos (id, entidad_id, fondo, centro_gestor, area_funcional, nombre_cuenta, presupuesto_inicial, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5108 (class 0 OID 123541)
-- Dependencies: 256
-- Data for Name: programa_ejecucion_ingresos; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.programa_ejecucion_ingresos (id_registro, entidad_id, fecha_registro, clasificacion_entidad, entidad, fecha_de_corte, fondo, centro_gestor, area_funcional, proyecto, nivel, posicion_presupuestal_ccpet, nombre_de_la_cuenta, presupuesto_inicial, reducciones, adiciones, creditos, contracreditos, presupuesto_actual, total_ejecucion_recaudo, porcentaje_ejecucion, total_disponible_neto_por_recaudar) FROM stdin;
\.


--
-- TOC entry 5109 (class 0 OID 123547)
-- Dependencies: 257
-- Data for Name: programacion_ejecucion_gastos; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.programacion_ejecucion_gastos (id_registro, entidad_id, fecha_registro, clasificacion_entidad, entidad, fecha_de_corte, fondo, centro_gestor, area_funcional, proyecto, nivel, posicion_presupuestal_ccpet, nombre_de_la_cuenta, presupuesto_inicial, reducciones, adiciones, creditos, contracreditos, presupuesto_actual, compromisos, facturas, pagos, ejecucion, disponible_neto, porcentaje_ejecucion) FROM stdin;
\.


--
-- TOC entry 5110 (class 0 OID 123553)
-- Dependencies: 258
-- Data for Name: representantes; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.representantes (id, entidad_id, nombres, apellidos, email, posicion, nombre_archivo, archivo_content_type, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5112 (class 0 OID 123560)
-- Dependencies: 260
-- Data for Name: roles; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.roles (id, nombre, crear_usuario, actualizar_usuario, eliminar_usuario, asignar_permisos, eliminar_permisos, cargue_info, actualizar_info, visualizar_info, eliminar_info, cambio_info, acceso_bd, bugs, errores, entidades, crear_entidad, editar_pilares, asignar_rol, editar_entidad, crear_eventos, crear_tareas, firmar_documentos, modulo_financiero, consultar_eventos, completar_tareas) FROM stdin;
1	Super Administrador	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t
8	Miembro Junta Directiva	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t
15	Miembro Junta Presidente	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	t	f	t	f	t	t
16	Financiero	f	f	f	f	f	t	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f
7	Secretario General	f	f	f	f	f	f	t	t	f	t	f	f	f	f	f	f	f	f	t	t	t	f	t	f
12	Entidades	t	t	t	t	t	t	t	t	t	f	f	f	f	t	f	t	t	t	t	t	t	t	t	t
17	Pilar Financiero	f	f	f	t	f	t	t	t	t	t	f	f	f	t	f	f	t	t	f	f	f	t	f	f
9	Usuario	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f
\.


--
-- TOC entry 5114 (class 0 OID 123566)
-- Dependencies: 262
-- Data for Name: situacion_financiera; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.situacion_financiera (id_registro, entidad_id, sigla, fecha_corte, clase, grupo, cuenta, valor, fecha_registro) FROM stdin;
\.


--
-- TOC entry 5115 (class 0 OID 123573)
-- Dependencies: 263
-- Data for Name: tarea; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.tarea (id, tarea, descripcion, prioridad, estado, fecha_inicio, fecha_terminacion, responsable_id, form_link, tipo_id, creado_por) FROM stdin;
\.


--
-- TOC entry 5117 (class 0 OID 123581)
-- Dependencies: 265
-- Data for Name: temas_eventos; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.temas_eventos (id, nombre, fecha_creacion, evento_id, creado_id) FROM stdin;
\.


--
-- TOC entry 5119 (class 0 OID 123585)
-- Dependencies: 267
-- Data for Name: tipo_entidad; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob.tipo_entidad (id, nombre) FROM stdin;
3	Otro
1	Junta Y Asamblea
2	Junta
\.


--
-- TOC entry 5121 (class 0 OID 123591)
-- Dependencies: 269
-- Data for Name: user; Type: TABLE DATA; Schema: consejogob; Owner: -
--

COPY consejogob."user" (id, cedula, clave, nombres, apellidos, correo, celular, active, creado_por, departamento, ciudad, fecha_creacion, terminos, rol) FROM stdin;
\.


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 220
-- Name: TBL_USER_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob."TBL_USER_id_seq"', 1, false);


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 222
-- Name: archivo_entidad_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.archivo_entidad_id_seq', 1, false);


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 224
-- Name: archivo_temas_eventos_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.archivo_temas_eventos_id_seq', 1, false);


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 226
-- Name: archivos_tarea_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.archivos_tarea_id_seq', 1, false);


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 228
-- Name: banco_fotos_entidad_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.banco_fotos_entidad_id_seq', 1, false);


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 232
-- Name: entidad_asignada_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.entidad_asignada_id_seq', 1, false);


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 233
-- Name: entidad_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.entidad_id_seq', 1, false);


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 235
-- Name: equipo_financiero_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.equipo_financiero_id_seq', 1, false);


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 236
-- Name: equipo_financiero_order_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.equipo_financiero_order_seq', 1, false);


--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 239
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.eventos_id_seq', 1, false);


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 241
-- Name: fecha_limite_reportes_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.fecha_limite_reportes_id_seq', 1, false);


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 243
-- Name: gestion_conocimiento_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.gestion_conocimiento_id_seq', 1, false);


--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 245
-- Name: historial_carga_global_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.historial_carga_global_id_seq', 1, false);


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 247
-- Name: historial_carga_informes_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.historial_carga_informes_id_seq', 1, false);


--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 251
-- Name: notificiaciones_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.notificiaciones_id_seq', 1, false);


--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 253
-- Name: plantilla_gastos_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.plantilla_gastos_id_seq', 1, false);


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 255
-- Name: plantilla_ingresos_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.plantilla_ingresos_id_seq', 1, false);


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 259
-- Name: representantes_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.representantes_id_seq', 1, false);


--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 261
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.roles_id_seq', 1, false);


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 264
-- Name: tarea_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.tarea_id_seq', 1, false);


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 266
-- Name: temas_eventos_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.temas_eventos_id_seq', 1, false);


--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 268
-- Name: tipo_entidad_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.tipo_entidad_id_seq', 1, false);


--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 270
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: consejogob; Owner: -
--

SELECT pg_catalog.setval('consejogob.user_id_seq', 1, false);


--
-- TOC entry 4841 (class 2606 OID 123624)
-- Name: TBL_USER Duplicate cedula; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob."TBL_USER"
    ADD CONSTRAINT "Duplicate cedula" UNIQUE (cedula);


--
-- TOC entry 4853 (class 2606 OID 123626)
-- Name: departamentos PK_0bb3cb2d40a474943f0aedb666f; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.departamentos
    ADD CONSTRAINT "PK_0bb3cb2d40a474943f0aedb666f" PRIMARY KEY (id_departamento);


--
-- TOC entry 4891 (class 2606 OID 123628)
-- Name: representantes PK_2db44b2bea51292b51208f5c60e; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.representantes
    ADD CONSTRAINT "PK_2db44b2bea51292b51208f5c60e" PRIMARY KEY (id);


--
-- TOC entry 4851 (class 2606 OID 123630)
-- Name: banco_fotos_entidad PK_2f6a97b6303712c85b82dee2eaa; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.banco_fotos_entidad
    ADD CONSTRAINT "PK_2f6a97b6303712c85b82dee2eaa" PRIMARY KEY (id);


--
-- TOC entry 4871 (class 2606 OID 123632)
-- Name: gestion_conocimiento PK_3600d0a0404a6943744e63de71f; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.gestion_conocimiento
    ADD CONSTRAINT "PK_3600d0a0404a6943744e63de71f" PRIMARY KEY (id);


--
-- TOC entry 4867 (class 2606 OID 123634)
-- Name: eventos PK_40d4a3c6a4bfd24280cb97a509e; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.eventos
    ADD CONSTRAINT "PK_40d4a3c6a4bfd24280cb97a509e" PRIMARY KEY (id);


--
-- TOC entry 4875 (class 2606 OID 123636)
-- Name: historial_carga_informes PK_458092a1cdf83cc559a4f775262; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.historial_carga_informes
    ADD CONSTRAINT "PK_458092a1cdf83cc559a4f775262" PRIMARY KEY (id);


--
-- TOC entry 4845 (class 2606 OID 123638)
-- Name: archivo_entidad PK_47b68e36b2907aca801364d9966; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.archivo_entidad
    ADD CONSTRAINT "PK_47b68e36b2907aca801364d9966" PRIMARY KEY (id);


--
-- TOC entry 4901 (class 2606 OID 123640)
-- Name: tarea PK_52df0f8fc74f81d0531ad890f0e; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.tarea
    ADD CONSTRAINT "PK_52df0f8fc74f81d0531ad890f0e" PRIMARY KEY (id);


--
-- TOC entry 4881 (class 2606 OID 123642)
-- Name: notificiaciones PK_55ec5d95fab77e538f7e9c4c06c; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.notificiaciones
    ADD CONSTRAINT "PK_55ec5d95fab77e538f7e9c4c06c" PRIMARY KEY (id);


--
-- TOC entry 4903 (class 2606 OID 123644)
-- Name: temas_eventos PK_58899755d966c4b86c56968769a; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.temas_eventos
    ADD CONSTRAINT "PK_58899755d966c4b86c56968769a" PRIMARY KEY (id);


--
-- TOC entry 4883 (class 2606 OID 123646)
-- Name: plantilla_gastos PK_7deb9ba79bc5c3da556fefeba9c; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.plantilla_gastos
    ADD CONSTRAINT "PK_7deb9ba79bc5c3da556fefeba9c" PRIMARY KEY (id);


--
-- TOC entry 4889 (class 2606 OID 123648)
-- Name: programacion_ejecucion_gastos PK_873fa5c5347b7994d4953839943; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.programacion_ejecucion_gastos
    ADD CONSTRAINT "PK_873fa5c5347b7994d4953839943" PRIMARY KEY (id_registro);


--
-- TOC entry 4885 (class 2606 OID 123650)
-- Name: plantilla_ingresos PK_87990acb9c2c8c69ab235de3aad; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.plantilla_ingresos
    ADD CONSTRAINT "PK_87990acb9c2c8c69ab235de3aad" PRIMARY KEY (id);


--
-- TOC entry 4887 (class 2606 OID 123652)
-- Name: programa_ejecucion_ingresos PK_8ec558e0ef05fdb907f7fc89ec5; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.programa_ejecucion_ingresos
    ADD CONSTRAINT "PK_8ec558e0ef05fdb907f7fc89ec5" PRIMARY KEY (id_registro);


--
-- TOC entry 4905 (class 2606 OID 123654)
-- Name: tipo_entidad PK_8f08c00c6ff71b0afc1b82506a4; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.tipo_entidad
    ADD CONSTRAINT "PK_8f08c00c6ff71b0afc1b82506a4" PRIMARY KEY (id);


--
-- TOC entry 4847 (class 2606 OID 123656)
-- Name: archivo_temas_eventos PK_a51bf778f6b734d6fab1d9ddba5; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.archivo_temas_eventos
    ADD CONSTRAINT "PK_a51bf778f6b734d6fab1d9ddba5" PRIMARY KEY (id);


--
-- TOC entry 4849 (class 2606 OID 123658)
-- Name: archivos_tarea PK_b40d8d988c61738e2b3ed028856; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.archivos_tarea
    ADD CONSTRAINT "PK_b40d8d988c61738e2b3ed028856" PRIMARY KEY (id);


--
-- TOC entry 4861 (class 2606 OID 123660)
-- Name: equipo_financiero PK_b49f4d041cb95c5026259ee3276; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.equipo_financiero
    ADD CONSTRAINT "PK_b49f4d041cb95c5026259ee3276" PRIMARY KEY (id);


--
-- TOC entry 4895 (class 2606 OID 123662)
-- Name: roles PK_c1433d71a4838793a49dcad46ab; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.roles
    ADD CONSTRAINT "PK_c1433d71a4838793a49dcad46ab" PRIMARY KEY (id);


--
-- TOC entry 4907 (class 2606 OID 123664)
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- TOC entry 4865 (class 2606 OID 123666)
-- Name: estado_resultado PK_d4a693342bd01e0d7179cbb2380; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.estado_resultado
    ADD CONSTRAINT "PK_d4a693342bd01e0d7179cbb2380" PRIMARY KEY (id_registro);


--
-- TOC entry 4877 (class 2606 OID 123668)
-- Name: logs PK_d713ceea4cbf64093e022248c4b; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.logs
    ADD CONSTRAINT "PK_d713ceea4cbf64093e022248c4b" PRIMARY KEY (id_registro);


--
-- TOC entry 4899 (class 2606 OID 123670)
-- Name: situacion_financiera PK_d8a2f91994a09198f17d1e7778e; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.situacion_financiera
    ADD CONSTRAINT "PK_d8a2f91994a09198f17d1e7778e" PRIMARY KEY (id_registro);


--
-- TOC entry 4879 (class 2606 OID 123672)
-- Name: municipios PK_da5d86d82419fc6467cd4f3fa83; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.municipios
    ADD CONSTRAINT "PK_da5d86d82419fc6467cd4f3fa83" PRIMARY KEY (id_municipio);


--
-- TOC entry 4873 (class 2606 OID 123674)
-- Name: historial_carga_global PK_dfe8e557f08d477c91b55123a5c; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.historial_carga_global
    ADD CONSTRAINT "PK_dfe8e557f08d477c91b55123a5c" PRIMARY KEY (id);


--
-- TOC entry 4869 (class 2606 OID 123676)
-- Name: fecha_limite_reportes PK_e79d3b8b006e9feba5fb994fe8b; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.fecha_limite_reportes
    ADD CONSTRAINT "PK_e79d3b8b006e9feba5fb994fe8b" PRIMARY KEY (id);


--
-- TOC entry 4855 (class 2606 OID 123678)
-- Name: entidad PK_e8e966b92be9a461aed484bb30b; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.entidad
    ADD CONSTRAINT "PK_e8e966b92be9a461aed484bb30b" PRIMARY KEY (id);


--
-- TOC entry 4843 (class 2606 OID 123680)
-- Name: TBL_USER PK_eb7d68fbfcdb50c60f9922aeeae; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob."TBL_USER"
    ADD CONSTRAINT "PK_eb7d68fbfcdb50c60f9922aeeae" PRIMARY KEY (id);


--
-- TOC entry 4859 (class 2606 OID 123682)
-- Name: entidad_asignada PK_fe2cf10a4c1a0d0c5478ae37194; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.entidad_asignada
    ADD CONSTRAINT "PK_fe2cf10a4c1a0d0c5478ae37194" PRIMARY KEY (id);


--
-- TOC entry 4863 (class 2606 OID 123684)
-- Name: equipo_financiero UQ_37b5bdbf28a2df1bcd2f59f75c0; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.equipo_financiero
    ADD CONSTRAINT "UQ_37b5bdbf28a2df1bcd2f59f75c0" UNIQUE (email);


--
-- TOC entry 4909 (class 2606 OID 123686)
-- Name: user UQ_37e80954fd8499125ff14c586dd; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob."user"
    ADD CONSTRAINT "UQ_37e80954fd8499125ff14c586dd" UNIQUE (correo);


--
-- TOC entry 4857 (class 2606 OID 123688)
-- Name: entidad UQ_87a64253a92f1e53e3fc8f26406; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.entidad
    ADD CONSTRAINT "UQ_87a64253a92f1e53e3fc8f26406" UNIQUE (nit);


--
-- TOC entry 4893 (class 2606 OID 123690)
-- Name: representantes UQ_a561ee24dd16d2ea9c1656ad50b; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.representantes
    ADD CONSTRAINT "UQ_a561ee24dd16d2ea9c1656ad50b" UNIQUE (email);


--
-- TOC entry 4897 (class 2606 OID 123692)
-- Name: roles UQ_a5be7aa67e759e347b1c6464e10; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.roles
    ADD CONSTRAINT "UQ_a5be7aa67e759e347b1c6464e10" UNIQUE (nombre);


--
-- TOC entry 4911 (class 2606 OID 123694)
-- Name: user UQ_c6bd13a12630812b819717fa653; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob."user"
    ADD CONSTRAINT "UQ_c6bd13a12630812b819717fa653" UNIQUE (cedula, correo);


--
-- TOC entry 4913 (class 2606 OID 123696)
-- Name: user UQ_d8b21b5b28ac133973b9c611b14; Type: CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob."user"
    ADD CONSTRAINT "UQ_d8b21b5b28ac133973b9c611b14" UNIQUE (cedula);


--
-- TOC entry 4914 (class 2606 OID 123697)
-- Name: archivo_entidad FK_16db5137ae90bf348a8e6fe152d; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.archivo_entidad
    ADD CONSTRAINT "FK_16db5137ae90bf348a8e6fe152d" FOREIGN KEY (entidad_id) REFERENCES consejogob.entidad(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4918 (class 2606 OID 123702)
-- Name: entidad FK_47c5dd5ced6f225e48ea8fec31b; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.entidad
    ADD CONSTRAINT "FK_47c5dd5ced6f225e48ea8fec31b" FOREIGN KEY (tipo_entidad_id) REFERENCES consejogob.tipo_entidad(id) ON DELETE CASCADE;


--
-- TOC entry 4916 (class 2606 OID 123707)
-- Name: archivos_tarea FK_4d97b234172a682be3b350640ab; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.archivos_tarea
    ADD CONSTRAINT "FK_4d97b234172a682be3b350640ab" FOREIGN KEY (task_id) REFERENCES consejogob.tarea(id) ON DELETE CASCADE;


--
-- TOC entry 4922 (class 2606 OID 123712)
-- Name: representantes FK_613b62cfe44f636b7594aa64c39; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.representantes
    ADD CONSTRAINT "FK_613b62cfe44f636b7594aa64c39" FOREIGN KEY (entidad_id) REFERENCES consejogob.entidad(id);


--
-- TOC entry 4917 (class 2606 OID 123717)
-- Name: banco_fotos_entidad FK_7551f0c5cb5f6a889fe19c64a37; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.banco_fotos_entidad
    ADD CONSTRAINT "FK_7551f0c5cb5f6a889fe19c64a37" FOREIGN KEY (entidad_id) REFERENCES consejogob.entidad(id) ON DELETE CASCADE;


--
-- TOC entry 4923 (class 2606 OID 123722)
-- Name: tarea FK_774fdf6eb3432ec51dcb90f0440; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.tarea
    ADD CONSTRAINT "FK_774fdf6eb3432ec51dcb90f0440" FOREIGN KEY (responsable_id) REFERENCES consejogob."user"(id);


--
-- TOC entry 4921 (class 2606 OID 123727)
-- Name: historial_carga_informes FK_89a1e2f61de585b60422cc908f4; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.historial_carga_informes
    ADD CONSTRAINT "FK_89a1e2f61de585b60422cc908f4" FOREIGN KEY (user_id) REFERENCES consejogob."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4924 (class 2606 OID 123732)
-- Name: temas_eventos FK_ce40b1eb446ddadb3239caa5b07; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.temas_eventos
    ADD CONSTRAINT "FK_ce40b1eb446ddadb3239caa5b07" FOREIGN KEY (evento_id) REFERENCES consejogob.eventos(id) ON DELETE CASCADE;


--
-- TOC entry 4919 (class 2606 OID 123737)
-- Name: entidad_asignada FK_ddec87cb26dbe6b87d2d76764fc; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.entidad_asignada
    ADD CONSTRAINT "FK_ddec87cb26dbe6b87d2d76764fc" FOREIGN KEY (entidad_id) REFERENCES consejogob.entidad(id) ON DELETE CASCADE;


--
-- TOC entry 4915 (class 2606 OID 123742)
-- Name: archivo_temas_eventos FK_f1e93c4310ed2ca7181e6c01681; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.archivo_temas_eventos
    ADD CONSTRAINT "FK_f1e93c4310ed2ca7181e6c01681" FOREIGN KEY (tema_evento_id) REFERENCES consejogob.temas_eventos(id) ON DELETE CASCADE;


--
-- TOC entry 4925 (class 2606 OID 123747)
-- Name: user FK_f325fe407d3f1aea37357016692; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob."user"
    ADD CONSTRAINT "FK_f325fe407d3f1aea37357016692" FOREIGN KEY (rol) REFERENCES consejogob.roles(id);


--
-- TOC entry 4920 (class 2606 OID 123752)
-- Name: entidad_asignada FK_f78ca3647869faec21451c6606e; Type: FK CONSTRAINT; Schema: consejogob; Owner: -
--

ALTER TABLE ONLY consejogob.entidad_asignada
    ADD CONSTRAINT "FK_f78ca3647869faec21451c6606e" FOREIGN KEY (user_id) REFERENCES consejogob."user"(id) ON DELETE CASCADE;


-- Completed on 2025-04-16 18:55:40

--
-- PostgreSQL database dump complete
--

