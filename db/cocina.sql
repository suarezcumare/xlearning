-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2015 a las 12:55:10
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cocina`
--
CREATE DATABASE IF NOT EXISTS `cocina` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cocina`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo_objeto_aprendizajes`
--

CREATE TABLE IF NOT EXISTS `archivo_objeto_aprendizajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` blob,
  `usuario_id` int(11) DEFAULT NULL,
  `fechasubido` datetime DEFAULT NULL,
  `licencia_id` int(11) DEFAULT NULL,
  `tipo_formato_id` int(11) DEFAULT NULL,
  `dispositivo_id` int(11) DEFAULT NULL,
  `objeto_aprendizaje_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_archivo_objeto_aprendizajes_on_dispositivo_id` (`dispositivo_id`) USING BTREE,
  KEY `index_archivo_objeto_aprendizajes_on_licencia_id` (`licencia_id`) USING BTREE,
  KEY `index_archivo_objeto_aprendizajes_on_objeto_aprendizaje_id` (`objeto_aprendizaje_id`) USING BTREE,
  KEY `index_archivo_objeto_aprendizajes_on_tipo_formato_id` (`tipo_formato_id`) USING BTREE,
  KEY `index_archivo_objeto_aprendizajes_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacions`
--

CREATE TABLE IF NOT EXISTS `asignacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `instrucciones` text,
  `puntuacion` float DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_asignacions_on_curso_id` (`curso_id`) USING BTREE,
  KEY `index_asignacions_on_modulo_id` (`modulo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_grupos`
--

CREATE TABLE IF NOT EXISTS `asignacion_grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_habilitacion` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `asignacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_asignacion_grupos_on_asignacion_id` (`asignacion_id`) USING BTREE,
  KEY `index_asignacion_grupos_on_grupo_id` (`grupo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autenticacions`
--

CREATE TABLE IF NOT EXISTS `autenticacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_secret` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_autenticacions_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_datos`
--

CREATE TABLE IF NOT EXISTS `base_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora_usuarios`
--

CREATE TABLE IF NOT EXISTS `bitacora_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `trackeable_id` int(11) DEFAULT NULL,
  `trackeable_type` varchar(255) DEFAULT NULL,
  `tipo_evento_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bitacora_usuarios_on_tipo_evento_id` (`tipo_evento_id`) USING BTREE,
  KEY `index_bitacora_usuarios_on_trackeable_id_and_trackeable_type` (`trackeable_id`,`trackeable_type`) USING BTREE,
  KEY `index_bitacora_usuarios_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidos`
--

CREATE TABLE IF NOT EXISTS `contenidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` int(11) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  `objeto_aprendizaje_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contenidos_on_modulo_id` (`modulo_id`) USING BTREE,
  KEY `index_contenidos_on_objeto_aprendizaje_id` (`objeto_aprendizaje_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `contenidos`
--

INSERT INTO `contenidos` (`id`, `orden`, `modulo_id`, `objeto_aprendizaje_id`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE IF NOT EXISTS `contratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `observacion` text,
  `plan_id` int(11) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `frecuencia_pago_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contratos_on_frecuencia_pago_id` (`frecuencia_pago_id`) USING BTREE,
  KEY `index_contratos_on_organizacion_id` (`organizacion_id`) USING BTREE,
  KEY `index_contratos_on_plan_id` (`plan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `critica_cursos`
--

CREATE TABLE IF NOT EXISTS `critica_cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `puntuacion` float DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_critica_cursos_on_autor_id` (`autor_id`) USING BTREE,
  KEY `index_critica_cursos_on_curso_id` (`curso_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `objetivos` text,
  `prerequisitos` text,
  `perfil_estudiante` text,
  `pago` tinyint(1) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `matricula_maxima` int(11) DEFAULT NULL,
  `puntaje_aprobacion` float DEFAULT NULL,
  `horas_semanales` int(11) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `facilitador_id` int(11) DEFAULT NULL,
  `comentario_id` int(11) DEFAULT NULL,
  `foto` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cursos_on_comentario_id` (`comentario_id`) USING BTREE,
  KEY `index_cursos_on_facilitador_id` (`facilitador_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `descripcion`, `objetivos`, `prerequisitos`, `perfil_estudiante`, `pago`, `costo`, `matricula_maxima`, `puntaje_aprobacion`, `horas_semanales`, `estatus`, `facilitador_id`, `comentario_id`, `foto`) VALUES
(1, 'Comida Italiana', 'Comida italiana, Comida italiana, Comida italiana', 'Aprender las disintas maneras de utilzar la herramienta brindada por google de mapa.', NULL, 'Desarrollador, programador.', NULL, NULL, 20, 100, 12, NULL, 2, NULL, '1.jpg'),
(2, 'Comida Inglesa', 'Comida inglesa, Comida inglesa, Comida inglesa', 'Lenguaje R como herramientas para resultados estadisticos.', NULL, 'Desarrollador', NULL, NULL, 30, 48, 6, NULL, 2, NULL, '2.jpg'),
(3, 'Comida Venezolana', 'Comida Venezolana, Comida Venezolana', 'Desarrollo movil plus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_categoria`
--

CREATE TABLE IF NOT EXISTS `curso_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_curso_categoria_on_categoria_id` (`categoria_id`) USING BTREE,
  KEY `index_curso_categoria_on_curso_id` (`curso_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

CREATE TABLE IF NOT EXISTS `dispositivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega_asignacions`
--

CREATE TABLE IF NOT EXISTS `entrega_asignacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` text,
  `puntuacion` float DEFAULT NULL,
  `fecha_subido` datetime DEFAULT NULL,
  `archivo` blob,
  `estatus` int(11) DEFAULT NULL,
  `feedback` text,
  `asignaciongrupo_id` int(11) DEFAULT NULL,
  `tipoformato_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_entrega_asignacions_on_asignaciongrupo_id` (`asignaciongrupo_id`) USING BTREE,
  KEY `index_entrega_asignacions_on_tipoformato_id` (`tipoformato_id`) USING BTREE,
  KEY `index_entrega_asignacions_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estructura_oferta_academicas`
--

CREATE TABLE IF NOT EXISTS `estructura_oferta_academicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `padre_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `raiz` tinyint(1) DEFAULT NULL,
  `descripcion` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_estructura_oferta_academicas_on_padre_id` (`padre_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacions`
--

CREATE TABLE IF NOT EXISTS `evaluacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `duracion` int(11) DEFAULT '-1',
  `estatus` tinyint(1) DEFAULT '1',
  `maxintentos` int(11) DEFAULT '1',
  `cant_preguntas_cerradas` int(11) DEFAULT NULL,
  `cant_preguntas_abiertas` int(11) DEFAULT NULL,
  `valor_preguntas_abiertas` float DEFAULT NULL,
  `valor_preguntas_cerradas` float DEFAULT NULL,
  `puntuacion` float DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_evaluacions_on_curso_id` (`curso_id`) USING BTREE,
  KEY `index_evaluacions_on_modulo_id` (`modulo_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `evaluacions`
--

INSERT INTO `evaluacions` (`id`, `curso_id`, `titulo`, `descripcion`, `duracion`, `estatus`, `maxintentos`, `cant_preguntas_cerradas`, `cant_preguntas_abiertas`, `valor_preguntas_abiertas`, `valor_preguntas_cerradas`, `puntuacion`, `tipo`, `modulo_id`) VALUES
(1, 1, 'Json', 'Sintaxis Json', 10, 1, 5, NULL, NULL, NULL, NULL, 10, NULL, 1),
(2, 1, 'Taller Json', 'Json', 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_grupos`
--

CREATE TABLE IF NOT EXISTS `evaluacion_grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_habilitacion` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `evaluacion_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_evaluacion_grupos_on_evaluacion_id` (`evaluacion_id`) USING BTREE,
  KEY `index_evaluacion_grupos_on_grupo_id` (`grupo_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `evaluacion_grupos`
--

INSERT INTO `evaluacion_grupos` (`id`, `fecha_habilitacion`, `fecha_cierre`, `evaluacion_id`, `grupo_id`) VALUES
(1, '2015-02-02 00:00:00', '2015-02-06 00:00:00', 1, 1),
(2, '2015-02-03 00:00:00', '2015-02-07 00:00:00', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_presentadas`
--

CREATE TABLE IF NOT EXISTS `evaluacion_presentadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puntuacion` float DEFAULT NULL,
  `fecha_presentacion` datetime DEFAULT NULL,
  `feedback` text,
  `usuario_id` int(11) DEFAULT NULL,
  `evaluacion_grupo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_evaluacion_presentadas_on_evaluacion_grupo_id` (`evaluacion_grupo_id`) USING BTREE,
  KEY `index_evaluacion_presentadas_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `evaluacion_presentadas`
--

INSERT INTO `evaluacion_presentadas` (`id`, `puntuacion`, `fecha_presentacion`, `feedback`, `usuario_id`, `evaluacion_grupo_id`) VALUES
(1, 10, '2015-02-01 00:00:00', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencia_pagos`
--

CREATE TABLE IF NOT EXISTS `frecuencia_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `meses` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `cierre_inscripcion` date DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_grupos_on_curso_id` (`curso_id`) USING BTREE,
  KEY `index_grupos_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id`, `fecha_inicio`, `fecha_fin`, `cierre_inscripcion`, `estatus`, `curso_id`, `usuario_id`) VALUES
(1, '2015-01-22', '2015-03-31', '2015-01-31', NULL, 1, 1),
(2, '2015-02-05', '2015-06-12', '2015-02-28', NULL, 2, 2),
(3, '2015-02-28', '2015-05-09', '2015-03-04', NULL, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historials`
--

CREATE TABLE IF NOT EXISTS `historials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` float DEFAULT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_historials_on_curso_id` (`curso_id`) USING BTREE,
  KEY `index_historials_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_estructura_oferta_academicas`
--

CREATE TABLE IF NOT EXISTS `item_estructura_oferta_academicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `est_oferta_acad_id` int(11) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_item_estructura_oferta_academicas_on_est_oferta_acad_id` (`est_oferta_acad_id`) USING BTREE,
  KEY `index_item_estructura_oferta_academicas_on_padre_id` (`padre_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_resumen`
--

CREATE TABLE IF NOT EXISTS `item_resumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` text,
  `descripcion` text,
  `resumen_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_item_resumen_on_resumen_id` (`resumen_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencia`
--

CREATE TABLE IF NOT EXISTS `licencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `licencia`
--

INSERT INTO `licencia` (`id`, `nombre`, `descripcion`) VALUES
(1, 'General', 'todos puedes usar y hacer lo que quieran');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE IF NOT EXISTS `matriculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estatus` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_matriculas_on_grupo_id` (`grupo_id`) USING BTREE,
  KEY `index_matriculas_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE IF NOT EXISTS `mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `contenido` text,
  `grupo_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `publicado` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mensajes_on_grupo_id` (`grupo_id`) USING BTREE,
  KEY `index_mensajes_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `titulo`, `contenido`, `grupo_id`, `usuario_id`, `publicado`, `created_at`, `updated_at`) VALUES
(1, 'Ingredientes', 'los ingredientes son: aceitunas, anchoas...', 1, 2, '2015-02-02 00:00:00', NULL, NULL),
(2, 'Preparacion', 'media hora en reposo, comer lo mas rapido posible.', 1, 2, '2015-02-06 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_menus_on_rol_id` (`rol_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modo_pagos`
--

CREATE TABLE IF NOT EXISTS `modo_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE IF NOT EXISTS `modulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `orden` int(11) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_modulos_on_curso_id` (`curso_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `nombre`, `descripcion`, `orden`, `estatus`, `curso_id`) VALUES
(1, 'Picar Alimentos', 'Tipos de cortes, alimentos de buena calidad .', 1, 1, 1),
(2, 'Cocinar Alimentos', 'Antes de lo mejor, comer', 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacions`
--

CREATE TABLE IF NOT EXISTS `notificacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificble_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `tipo_notificacion_id` int(11) DEFAULT NULL,
  `leido` tinyint(1) DEFAULT NULL,
  `contexto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notificacions_on_notificble_id` (`notificble_id`) USING BTREE,
  KEY `index_notificacions_on_tipo_notificacion_id` (`tipo_notificacion_id`) USING BTREE,
  KEY `index_notificacions_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objeto_aprendizajes`
--

CREATE TABLE IF NOT EXISTS `objeto_aprendizajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `objeto_aprendizajes`
--

INSERT INTO `objeto_aprendizajes` (`id`, `nombre`, `descripcion`, `orden`) VALUES
(1, 'Imagen Json', 'Imagen json donde se mostraran los contenidos del json', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion_menus`
--

CREATE TABLE IF NOT EXISTS `opcion_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `raiz` tinyint(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `icono` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_opcion_menus_on_menu_id` (`menu_id`) USING BTREE,
  KEY `index_opcion_menus_on_padre_id` (`padre_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizacions`
--

CREATE TABLE IF NOT EXISTS `organizacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `subdominio` varchar(255) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `telefono1` varchar(255) DEFAULT NULL,
  `telefono2` varchar(255) DEFAULT NULL,
  `telefono3` varchar(255) DEFAULT NULL,
  `telefono4` varchar(255) DEFAULT NULL,
  `email1` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `email3` varchar(255) DEFAULT NULL,
  `email4` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_organizacions_on_pais_id` (`pais_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizacion_red_socials`
--

CREATE TABLE IF NOT EXISTS `organizacion_red_socials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizacion_id` int(11) DEFAULT NULL,
  `red_social_id` int(11) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_organizacion_red_socials_on_organizacion_id` (`organizacion_id`) USING BTREE,
  KEY `index_organizacion_red_socials_on_red_social_id` (`red_social_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `organizacion_red_socials`
--

INSERT INTO `organizacion_red_socials` (`id`, `organizacion_id`, `red_social_id`, `valor`) VALUES
(1, 1, 1, 'cocinaCocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_contratos`
--

CREATE TABLE IF NOT EXISTS `pago_contratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monto` float DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `contrato_id` int(11) DEFAULT NULL,
  `modo_pago_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pago_contratos_on_contrato_id` (`contrato_id`) USING BTREE,
  KEY `index_pago_contratos_on_modo_pago_id` (`modo_pago_id`) USING BTREE,
  KEY `index_pago_contratos_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_matriculas`
--

CREATE TABLE IF NOT EXISTS `pago_matriculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modo_pago_id` int(11) DEFAULT NULL,
  `matricula_id` int(11) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `numero_operacion` varchar(255) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pago_matriculas_on_matricula_id` (`matricula_id`) USING BTREE,
  KEY `index_pago_matriculas_on_modo_pago_id` (`modo_pago_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_membresia`
--

CREATE TABLE IF NOT EXISTS `pago_membresia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monto` float DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `numero_operacion` varchar(255) DEFAULT NULL,
  `modo_pago_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pago_membresia_on_modo_pago_id` (`modo_pago_id`) USING BTREE,
  KEY `index_pago_membresia_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre`) VALUES
(1, 'Venezuela'),
(2, 'Colombia'),
(3, 'Panama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfils`
--

CREATE TABLE IF NOT EXISTS `perfils` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(256) DEFAULT NULL,
  `formato_foto` varchar(255) DEFAULT NULL,
  `sexo` tinyint(1) DEFAULT NULL,
  `intereses` text,
  `ocupacion` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `biografia` text,
  `pais_id` int(11) DEFAULT NULL,
  `preferencia` text,
  PRIMARY KEY (`id`),
  KEY `index_perfils_on_pais_id` (`pais_id`) USING BTREE,
  KEY `index_perfils_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `perfils`
--

INSERT INTO `perfils` (`id`, `foto`, `formato_foto`, `sexo`, `intereses`, `ocupacion`, `usuario_id`, `biografia`, `pais_id`, `preferencia`) VALUES
(1, '1.jpg', '9', 0, 'intereses intereses intereses intereses intereses intereses  intereses intereses intereses intereses intereses intereses intereses intereses intereses intereses intereses', 'Estudiante', 1, 'biografia biografia biografia biografia biografia biografia biografia biografia biografia biografia biografia biografia biografia biografia biografia biografia biografia biografia  2', 1, 'cualquier persona'),
(2, NULL, '9', 1, 'sin intereses', 'Desarrollador', 2, 'not found xD', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plans`
--

CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `nombre` varchar(255) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE IF NOT EXISTS `pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` text,
  `tipo` tinyint(1) DEFAULT NULL,
  `evaluacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta_evaluacion_presentadas`
--

CREATE TABLE IF NOT EXISTS `pregunta_evaluacion_presentadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_id` int(11) DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `respuesta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pregunta_evaluacion_presentadas_on_evaluacion_id` (`evaluacion_id`) USING BTREE,
  KEY `index_pregunta_evaluacion_presentadas_on_pregunta_id` (`pregunta_id`) USING BTREE,
  KEY `index_pregunta_evaluacion_presentadas_on_respuesta_id` (`respuesta_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prelacions`
--

CREATE TABLE IF NOT EXISTS `prelacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_id` int(11) DEFAULT NULL,
  `materia_prelada_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_prelacions_on_base_id` (`base_id`) USING BTREE,
  KEY `index_prelacions_on_materia_prelada_id` (`materia_prelada_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suma_puntajes` float DEFAULT NULL,
  `cantidad_votos` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ratings_on_curso_id` (`curso_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_socials`
--

CREATE TABLE IF NOT EXISTS `red_socials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `icono` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `red_socials`
--

INSERT INTO `red_socials` (`id`, `nombre`, `icono`, `url`) VALUES
(1, 'facebook', 'fa fa-facebook fb', 'https://www.facebook.com/'),
(2, 'twitter', 'fa fa-twitter tw', 'https://www.twitter.com/'),
(3, 'google plus', 'fa fa-google-plus gp', 'https://plus.google.com/'),
(4, 'github', 'fa fa-github gh', 'https://github.com/'),
(5, 'linkedin', 'fa fa-linkedin lk', 'https://ve.linkedin.com/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE IF NOT EXISTS `respuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` text,
  `correcta` tinyint(1) DEFAULT NULL,
  `evaluacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_respuesta_on_evaluacion_id` (`evaluacion_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_evaluacion_presentadas`
--

CREATE TABLE IF NOT EXISTS `respuesta_evaluacion_presentadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta` text,
  `respuesta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_respuesta_evaluacion_presentadas_on_respuesta_id` (`respuesta_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumen`
--

CREATE TABLE IF NOT EXISTS `resumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `modulo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resumen_on_modulo_id` (`modulo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE IF NOT EXISTS `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `rols`
--

INSERT INTO `rols` (`id`, `nombre`) VALUES
(1, 'estudiante'),
(2, 'facilitador'),
(3, 'coordinador'),
(4, 'administrador'),
(5, 'ejecutivo'),
(6, 'ejecutivo portal'),
(7, 'super administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20141214012543'),
('20141214022641'),
('20141216005902'),
('20141216010517'),
('20141216011935'),
('20141216012140'),
('20141216013812'),
('20141216015404'),
('20141216020116'),
('20141216150942'),
('20141216152137'),
('20141216152232'),
('20141216152258'),
('20141216153040'),
('20141216153324'),
('20141216153517'),
('20141216154316'),
('20141217003223'),
('20141217003407'),
('20141217003525'),
('20141217003652'),
('20141217004238'),
('20141217004806'),
('20141217005119'),
('20141217005314'),
('20141217010745'),
('20141218024838'),
('20141218025513'),
('20141218025840'),
('20141218030133'),
('20141218033913'),
('20141218034526'),
('20141218035714'),
('20141218040314'),
('20141218040437'),
('20141218041054'),
('20141218041646'),
('20141218042113'),
('20141218043330'),
('20141218044303'),
('20141222162418'),
('20150118233847'),
('20150118234042'),
('20150118234824'),
('20150119000114'),
('20150119000401'),
('20150119000630'),
('20150119141048'),
('20150119144837'),
('20150120141843'),
('20150121012806'),
('20150121014218'),
('20150121014939'),
('20150121024849'),
('20150122004428');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencia`
--

CREATE TABLE IF NOT EXISTS `sugerencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `estatus` tinyint(1) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sugerencia_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_eventos`
--

CREATE TABLE IF NOT EXISTS `tipo_eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `cuerpo` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_formatos`
--

CREATE TABLE IF NOT EXISTS `tipo_formatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `tipo_formatos`
--

INSERT INTO `tipo_formatos` (`id`, `nombre`) VALUES
(1, 'tar'),
(2, 'zip'),
(3, 'txt'),
(4, 'pdf'),
(5, 'doc'),
(6, 'docx'),
(7, 'xmlx'),
(8, 'pptx'),
(9, 'jpg'),
(10, 'png'),
(11, 'jpeg'),
(12, 'gif'),
(13, 'mp3'),
(14, 'wma'),
(15, 'mp4'),
(16, 'css'),
(17, 'html'),
(18, 'js');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(190) NOT NULL,
  `encrypted_password` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `apellido` varchar(255) NOT NULL DEFAULT '',
  `pregunta_secreta` text,
  `respuesta_secreta` text,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_usuarios_on_email` (`email`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `encrypted_password`, `nombre`, `apellido`, `pregunta_secreta`, `respuesta_secreta`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`, `unconfirmed_email`) VALUES
(1, 'c.valentina@gmail.com', '$2a$10$UDrziP7KaBZ8STpF8PvHaelYLHSD5FjK0c.vqAftwbHhIPou118fe', 'Valentina', 'Maldonado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'facilitador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Andres', 'Hewstone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'coordinador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jose', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'administrador@correo.com', '$2a$10$8AvrtHZdYlpNZp5z6yQ8H.Xna9rlT.9cbqJbbr1yAEMsHBlhgSgsO', 'Jose', 'Sanchez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'ejecutivo@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jesus', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'ejecutivoportal@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jesus', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'superadministrador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jesus', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_red_socials`
--

CREATE TABLE IF NOT EXISTS `usuario_red_socials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `red_social_id` int(11) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_usuario_red_socials_on_red_social_id` (`red_social_id`) USING BTREE,
  KEY `index_usuario_red_socials_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario_red_socials`
--

INSERT INTO `usuario_red_socials` (`id`, `usuario_id`, `red_social_id`, `valor`) VALUES
(1, 2, 1, 'AHewstone'),
(2, 1, 2, 'valentina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rols`
--

CREATE TABLE IF NOT EXISTS `usuario_rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_usuario_rols_on_rol_id` (`rol_id`) USING BTREE,
  KEY `index_usuario_rols_on_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `usuario_rols`
--

INSERT INTO `usuario_rols` (`id`, `usuario_id`, `rol_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
