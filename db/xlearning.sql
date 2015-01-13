-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2015 a las 00:43:34
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `xlearning`
--
CREATE DATABASE IF NOT EXISTS `xlearning` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `xlearning`;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `base_datos`
--

INSERT INTO `base_datos` (`id`, `nombre`) VALUES
(1, 'cocina'),
(2, 'educacion'),
(3, 'movil');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `rol_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

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
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_opcion_menus_on_padre_id` (`padre_id`),
  KEY `index_opcion_menus_on_menu_id` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=127 ;

--
-- Volcado de datos para la tabla `opcion_menus`
--

INSERT INTO `opcion_menus` (`id`, `nombre`, `raiz`, `url`, `padre_id`, `menu_id`, `icono`, `orden`) VALUES
(1, 'inicio', 1, '/', NULL, 1, 'mdi-action-home', 1),
(2, 'Carga académica', 1, '/clases', NULL, 1, 'fa fa-mortar-board', 2),
(3, 'historial', 1, '/historial', NULL, 1, 'mdi-action-history', 3),
(4, 'Pagos realizados', 0, '/historial/pagos', 3, 1, 'mdi-action-account-balance', 1),
(5, 'Certificados obtenidos', 0, '/historial/certificados', 3, 1, 'fa fa-certificate', 2),
(6, 'Mi cuenta', 1, NULL, NULL, 1, 'mdi-action-perm-identity', 5),
(7, 'Ver perfil', 0, '/usuarios/1', 6, 1, NULL, 1),
(8, 'Modificar perfil', 0, '/usuarios/editar', 6, 1, 'mdi-content-create', 2),
(9, 'Preferencias', 0, '/preferencias', 6, 1, 'mdi-action-settings', 3),
(10, 'oferta de cursos', 1, '/cursos', NULL, 1, NULL, 4),
(18, 'inicio', 1, '/', NULL, 5, 'mdi-action-home', 1),
(19, 'Estadisticos', 1, '/estadisticos', NULL, 5, 'fa fa-line-chart', 2),
(20, 'Sistema', 1, NULL, NULL, 5, 'fa fa-bar-chart', 1),
(21, 'Clientes', 1, NULL, NULL, 5, 'fa-area-chart', 3),
(22, 'Cursos', 1, NULL, NULL, 5, 'fa fa-pie-chart', 4),
(23, 'Financiero', 1, NULL, NULL, 5, 'fa fa-line-chart', 2),
(24, 'Nivel Ingresos', 0, NULL, 23, 5, 'fa fa-line-chart', 1),
(25, 'Ganancias - Perdidas', 0, NULL, 23, 5, 'fa fa-line-chart', 2),
(26, 'Nivel de Clientes', 0, NULL, 21, 5, 'fa-area-chart', 1),
(27, 'Dispositivos Utilizados', 0, NULL, 21, 5, 'fa-area-chart', 2),
(28, 'Nivel de Recursos', 0, NULL, 20, 5, 'fa fa-bar-chart', 1),
(29, 'Rentabilidad', 0, NULL, 20, 5, 'fa fa-bar-chart', 2),
(30, 'Nuevos Cursos', 0, NULL, 22, 5, 'fa fa-pie-chart', 1),
(31, 'Cursos Solicitados', 0, NULL, 22, 5, 'fa fa-pie-chart', 2),
(32, 'Mi cuenta', 1, NULL, NULL, 5, 'mdi-action-perm-identity', 5),
(33, 'Ver perfil', 0, '/usuarios/1', 32, 5, NULL, 1),
(34, 'Modificar perfil', 0, '/usuarios/editar', 32, 5, 'mdi-content-create', 2),
(35, 'Preferencias', 0, '/preferencias', 32, 5, 'mdi-action-settings', 3),
(36, 'inicio', 1, '/', NULL, 4, 'mdi-action-home', 1),
(37, 'Apariencia', 1, '/apariencia/editar', NULL, 4, NULL, 2),
(38, 'Organización', 1, NULL, NULL, 4, 'fa fa-edit', 3),
(39, 'Modificar', 0, '/perfil/editar', 38, 4, 'fa fa-edit', 1),
(40, 'Usuarios y Roles', 0, '/usuarios', 38, 4, 'fa fa-users', 3),
(41, 'Clientes', 1, NULL, NULL, 4, 'fa fa-user-md', 4),
(42, 'Politicas de Adminisión', 0, '/politicas', 41, 4, NULL, 1),
(43, 'Todos', 0, '/estudiantes', 41, 4, 'fa fa-users', 2),
(44, 'Cursos', 1, NULL, NULL, 4, NULL, 5),
(45, 'Estructura Jerárquica', 0, '/cursos/jerarquia', 44, 4, NULL, 1),
(46, 'Taxonomia', 0, '/cursos/taxonomia', 44, 4, NULL, 2),
(47, 'Mi cuenta', 1, NULL, NULL, 4, 'mdi-action-perm-identity', 8),
(48, 'Ver perfil', 0, '/usuarios/1', 47, 4, NULL, 1),
(49, 'Modificar perfil', 0, '/usuarios/editar', 47, 4, 'mdi-content-create', 2),
(50, 'Preferencias', 0, '/preferencias', 47, 4, 'mdi-action-settings', 3),
(51, 'inicio', 1, '/', NULL, 3, 'mdi-action-home', 1),
(52, 'Biblioteca Virtual', 1, NULL, NULL, 3, 'fa fa-book', 2),
(53, 'Ver', 0, '/biblioteca', 52, 3, NULL, 1),
(54, 'Nuevo archivo', 0, '/biblioteca/nuevo', 52, 3, NULL, 2),
(55, 'Modificar', 0, '/biblioteca/editar', 52, 3, NULL, 3),
(56, 'Cursos', 1, NULL, NULL, 3, NULL, 3),
(57, 'Nuevo', 0, '/cursos/nuevo', 56, 3, NULL, 1),
(58, 'Modificar', 0, '/cursos/editar', 56, 3, NULL, 2),
(59, 'Todos', 0, '/cursos', 56, 3, NULL, 3),
(60, 'Secciones', 1, NULL, NULL, 3, NULL, 4),
(61, 'Nuevo', 0, '/curso/secciones/nuevo', 60, 3, NULL, 1),
(62, 'todos', 0, '/secciones/coordinador', 60, 3, NULL, 2),
(63, 'Mi cuenta', 1, NULL, NULL, 3, 'mdi-action-perm-identity', 5),
(64, 'Ver perfil', 0, '/usuarios/1', 63, 3, NULL, 1),
(65, 'Modificar perfil', 0, '/usuarios/editar', 63, 3, 'mdi-content-create', 2),
(66, 'Preferencias', 0, '/preferencias', 63, 3, 'mdi-action-settings', 3),
(67, 'inicio', 1, '/', NULL, 2, 'mdi-action-home', 1),
(68, 'Biblioteca Virtual', 1, NULL, NULL, 2, 'fa fa-book', 2),
(69, 'Ver', 0, '/biblioteca', 68, 2, NULL, 1),
(70, 'Nuevo archivo', 0, '/biblioteca/nuevo', 68, 2, NULL, 2),
(71, 'Importar Objeto Aprendizaje', 0, '/biblioteca/importar', 68, 2, NULL, 2),
(72, 'Mis Secciones', 1, '/secciones/facilitador', NULL, 2, NULL, 3),
(73, 'Calendario', 1, '/calendario/facilitador', NULL, 2, NULL, 4),
(74, 'Mi cuenta', 1, NULL, NULL, 2, 'mdi-action-perm-identity', 5),
(75, 'Ver perfil', 0, '/usuarios/1', 74, 2, NULL, 1),
(76, 'Modificar perfil', 0, '/usuarios/editar', 74, 2, 'mdi-content-create', 2),
(77, 'Preferencias', 0, '/preferencias', 74, 2, 'mdi-action-settings', 3),
(78, 'inicio', 1, '/', NULL, 6, 'mdi-action-home', 1),
(79, 'Organizaciones', 1, 'organizacion/todas', NULL, 6, NULL, 2),
(80, 'Estadisticos', 1, '/estadisticos', NULL, 6, 'fa fa-bar-chart', 3),
(81, 'Sistema', 1, NULL, NULL, 6, 'fa fa-bar-chart', 1),
(82, 'Organización', 1, NULL, NULL, 6, 'fa fa-bar-chart', 3),
(83, 'Financiero', 1, NULL, NULL, 6, 'fa fa-line-chart', 2),
(84, 'Social', 1, NULL, NULL, 6, 'fa fa-line-chart', 4),
(85, 'Nivel Ingresos', 0, '/estadisticos/1', 83, 6, 'fa fa-line-chart', 4),
(86, 'Ganancias y Perdidas', 0, '/estadisticos/2', 83, 6, 'fa fa-line-chart', 4),
(87, 'Rentabilidad', 0, '/estadisticos/1', 81, 6, 'fa fa-line-chart', 4),
(88, 'Nivel de Recursos', 0, '/estadisticos/2', 81, 6, 'fa fa-bar-chart', 1),
(89, 'Pagos', 0, '/estadisticos/1', 82, 6, 'fa fa-bar-chart', 1),
(93, 'Población', 0, '/estadisticos/2', 84, 6, 'fa fa-bar-chart', 1),
(94, 'Edades', 0, '/estadisticos/1', 84, 6, 'fa fa-bar-chart', 1),
(95, 'Mi cuenta', 1, NULL, NULL, 6, 'mdi-action-perm-identity', 5),
(96, 'Ver perfil', 0, '/usuarios/1', 95, 6, NULL, 1),
(98, 'Modificar perfil', 0, '/usuarios/editar', 95, 6, 'mdi-content-create', 2),
(99, 'Preferencias', 0, '/preferencias', 95, 6, 'mdi-action-settings', 3),
(100, 'inicio', 1, '/', NULL, 7, 'mdi-action-home', 1),
(101, 'Usuarios', 1, NULL, NULL, 7, 'fa fa-users', 2),
(102, 'Usuario y Roles', 0, '/usuarios/todos', 101, 7, 'fa fa-edit', 1),
(103, 'Organizaciones', 1, NULL, NULL, 7, NULL, 3),
(104, 'Nuevo', 0, '/organizacion/nuevo', 103, 7, NULL, 1),
(105, 'Modificar', 0, '/organizacion/modificar', 103, 7, 'fa fa-edit', 2),
(106, 'Todas', 0, '/organizacion/todas', 103, 7, NULL, 3),
(107, 'Encuestas', 1, NULL, NULL, 7, 'fa fa-book', 4),
(108, 'Nuevo', 0, '/encuestas/nuevo', 107, 7, NULL, 2),
(109, 'Modificar', 0, '/encuestas/modificar', 107, 7, 'fa fa-edit', 3),
(110, 'Todas', 0, '/encuestas/todas', 107, 7, NULL, 4),
(111, 'Costos', 1, NULL, NULL, 7, NULL, 5),
(112, 'Nuevo', 0, '/costos/nuevo', 111, 7, NULL, 3),
(113, 'Modificar', 0, '/costos/modificar', 111, 7, NULL, 3),
(114, 'Todos', 0, '/costos/todos', 111, 7, NULL, 3),
(115, 'Mi cuenta', 1, NULL, NULL, 7, 'mdi-action-perm-identity', 6),
(116, 'Ver perfil', 0, '/usuarios/1', 115, 7, NULL, 1),
(117, 'Modificar perfil', 0, '/usuarios/editar', 115, 7, '', 2),
(118, 'Preferencias', 0, '/preferencias', 115, 7, 'mdi-action-settings', 3),
(119, 'Estadisticos', 1, NULL, NULL, 4, 'mdi-action-settings', 6),
(120, 'Configurar', 0, '/estadisticos/editar', 119, 4, 'fa fa-edit', 1),
(121, 'Encuestas', 1, NULL, NULL, 4, 'fa fa-book', 7),
(122, 'Ver', 0, '/encuestas', 121, 4, NULL, 1),
(123, 'Nevo', 0, '/encuestas/nuevo', 121, 4, 'fa fa-edit', 2),
(124, 'Modificar', 0, '/encuestas/modificar', 121, 4, NULL, 3),
(125, 'Todas', 0, '/encuestas/todas', 121, 4, NULL, 4),
(126, 'Ver', 0, '/encuestas', 107, 7, NULL, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `encrypted_password`, `nombre`, `pregunta_secreta`, `respuesta_secreta`, `pais_id`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `apellido`) VALUES
(1, 'test@gmail.com', '$2a$10$5gstYjsOWGsd5.ItAZDagOTgzbSUHrkbBlTGf0szJt0.197I.wAtK', 'test', NULL, NULL, NULL, NULL, NULL, NULL, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
