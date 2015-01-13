-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2015 a las 00:43:42
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
CREATE DATABASE IF NOT EXISTS `cocina` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
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
  KEY `index_archivo_objeto_aprendizajes_on_usuario_id` (`usuario_id`),
  KEY `index_archivo_objeto_aprendizajes_on_licencia_id` (`licencia_id`),
  KEY `index_archivo_objeto_aprendizajes_on_tipo_formato_id` (`tipo_formato_id`),
  KEY `index_archivo_objeto_aprendizajes_on_dispositivo_id` (`dispositivo_id`),
  KEY `index_archivo_objeto_aprendizajes_on_objeto_aprendizaje_id` (`objeto_aprendizaje_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`),
  KEY `index_asignacions_on_curso_id` (`curso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_asignacion_grupos_on_grupo_id` (`grupo_id`),
  KEY `index_asignacion_grupos_on_asignacion_id` (`asignacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_datos`
--

CREATE TABLE IF NOT EXISTS `base_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_contenidos_on_modulo_id` (`modulo_id`),
  KEY `index_contenidos_on_objeto_aprendizaje_id` (`objeto_aprendizaje_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_critica_cursos_on_autor_id` (`autor_id`),
  KEY `index_critica_cursos_on_curso_id` (`curso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`),
  KEY `index_cursos_on_facilitador_id` (`facilitador_id`),
  KEY `index_cursos_on_comentario_id` (`comentario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_categoria`
--

CREATE TABLE IF NOT EXISTS `curso_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_curso_categoria_on_categoria_id` (`categoria_id`),
  KEY `index_curso_categoria_on_curso_id` (`curso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

CREATE TABLE IF NOT EXISTS `dispositivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_entrega_asignacions_on_asignaciongrupo_id` (`asignaciongrupo_id`),
  KEY `index_entrega_asignacions_on_tipoformato_id` (`tipoformato_id`),
  KEY `index_entrega_asignacions_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`),
  KEY `index_evaluacions_on_curso_id` (`curso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_evaluacion_grupos_on_evaluacion_id` (`evaluacion_id`),
  KEY `index_evaluacion_grupos_on_grupo_id` (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_evaluacion_presentadas_on_usuario_id` (`usuario_id`),
  KEY `index_evaluacion_presentadas_on_evaluacion_grupo_id` (`evaluacion_grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_grupos_on_curso_id` (`curso_id`),
  KEY `index_grupos_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_historials_on_curso_id` (`curso_id`),
  KEY `index_historials_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_item_resumen_on_resumen_id` (`resumen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencia`
--

CREATE TABLE IF NOT EXISTS `licencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_matriculas_on_usuario_id` (`usuario_id`),
  KEY `index_matriculas_on_grupo_id` (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_menus_on_rol_id` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modo_pagos`
--

CREATE TABLE IF NOT EXISTS `modo_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_modulos_on_curso_id` (`curso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacions`
--

CREATE TABLE IF NOT EXISTS `notificacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `titulo` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notificacions_on_usuario_id` (`usuario_id`),
  KEY `index_notificacions_on_grupo_id` (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`),
  KEY `index_opcion_menus_on_padre_id` (`padre_id`),
  KEY `index_opcion_menus_on_menu_id` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizacions`
--

CREATE TABLE IF NOT EXISTS `organizacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `subdominio` varchar(255) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_pago_matriculas_on_modo_pago_id` (`modo_pago_id`),
  KEY `index_pago_matriculas_on_matricula_id` (`matricula_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_pago_membresia_on_modo_pago_id` (`modo_pago_id`),
  KEY `index_pago_membresia_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfils`
--

CREATE TABLE IF NOT EXISTS `perfils` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` blob,
  `formato_foto` varchar(255) DEFAULT NULL,
  `sexo` tinyint(1) DEFAULT NULL,
  `intereses` text,
  `ocupacion` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `biografia` text,
  PRIMARY KEY (`id`),
  KEY `index_perfils_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_pregunta_evaluacion_presentadas_on_evaluacion_id` (`evaluacion_id`),
  KEY `index_pregunta_evaluacion_presentadas_on_pregunta_id` (`pregunta_id`),
  KEY `index_pregunta_evaluacion_presentadas_on_respuesta_id` (`respuesta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prelacions`
--

CREATE TABLE IF NOT EXISTS `prelacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_id` int(11) DEFAULT NULL,
  `materia_prelada_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_prelacions_on_base_id` (`base_id`),
  KEY `index_prelacions_on_materia_prelada_id` (`materia_prelada_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_ratings_on_curso_id` (`curso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_respuesta_on_evaluacion_id` (`evaluacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_evaluacion_presentadas`
--

CREATE TABLE IF NOT EXISTS `respuesta_evaluacion_presentadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta` text,
  `respuesta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_respuesta_evaluacion_presentadas_on_respuesta_id` (`respuesta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `index_resumen_on_modulo_id` (`modulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE IF NOT EXISTS `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('20141218044620'),
('20141218044838'),
('20141222162418');

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
  KEY `index_sugerencia_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_formatos`
--

CREATE TABLE IF NOT EXISTS `tipo_formatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(190) NOT NULL,
  `encrypted_password` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `pregunta_secreta` text,
  `respuesta_secreta` text,
  `pais_id` int(11) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `apellido` varchar(190) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_usuarios_on_email` (`email`),
  KEY `index_usuarios_on_pais_id` (`pais_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `encrypted_password`, `nombre`, `pregunta_secreta`, `respuesta_secreta`, `pais_id`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `apellido`) VALUES
(1, 'c.valentina@gmail.com', '$2a$10$UDrziP7KaBZ8STpF8PvHaelYLHSD5FjK0c.vqAftwbHhIPou118fe', 'Valentina', NULL, NULL, NULL, NULL, NULL, NULL, 'Maldonado'),
(2, 'facilitador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Andres', NULL, NULL, NULL, NULL, NULL, NULL, ''),
(3, 'coordinador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jose', NULL, NULL, NULL, NULL, NULL, NULL, ''),
(4, 'administrador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Antonio', NULL, NULL, NULL, NULL, NULL, NULL, ''),
(5, 'ejecutivo@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jesus', NULL, NULL, NULL, NULL, NULL, NULL, ''),
(6, 'ejecutivoportal@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jesus', NULL, NULL, NULL, NULL, NULL, NULL, ''),
(7, 'superadministrador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jesus', NULL, NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_notificacions`
--

CREATE TABLE IF NOT EXISTS `usuario_notificacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revisado` tinyint(1) DEFAULT '0',
  `notificacion_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_usuario_notificacions_on_notificacion_id` (`notificacion_id`),
  KEY `index_usuario_notificacions_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rols`
--

CREATE TABLE IF NOT EXISTS `usuario_rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_usuario_rols_on_usuario_id` (`usuario_id`),
  KEY `index_usuario_rols_on_rol_id` (`rol_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
