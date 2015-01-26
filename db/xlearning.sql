-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2015 a las 04:28:01
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `xlearning`
--

--
-- Volcado de datos para la tabla `base_datos`
--

INSERT INTO `base_datos` (`nombre`) VALUES
('cocina');

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

--
-- Volcado de datos para la tabla `opcion_menus`
--

INSERT INTO `opcion_menus` (`id`, `nombre`, `raiz`, `url`, `padre_id`, `menu_id`, `icono`, `orden`) VALUES
(1, 'inicio', 1, '/inicio', NULL, 1, 'mdi-action-home', 1),
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
(36, 'inicio', 1, '/inicio', NULL, 4, 'mdi-action-home', 1),
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
(47, 'Mi cuenta', 1, NULL, NULL, 4, 'mdi-action-perm-identity', 6),
(48, 'Ver perfil', 0, '/usuarios/1', 47, 4, NULL, 1),
(49, 'Modificar perfil', 0, '/usuarios/editar', 47, 4, 'mdi-content-create', 2),
(50, 'Preferencias', 0, '/preferencias', 47, 4, 'mdi-action-settings', 3),
(51, 'inicio', 1, '/inicio', NULL, 3, 'mdi-action-home', 1),
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
(62, 'todos', 0, '/secciones', 60, 3, NULL, 2),
(63, 'Mi cuenta', 1, NULL, NULL, 3, 'mdi-action-perm-identity', 5),
(64, 'Ver perfil', 0, '/usuarios/1', 63, 3, NULL, 1),
(65, 'Modificar perfil', 0, '/usuarios/editar', 63, 3, 'mdi-content-create', 2),
(66, 'Preferencias', 0, '/preferencias', 63, 3, 'mdi-action-settings', 3),
(67, 'inicio', 1, '/', NULL, 2, 'mdi-action-home', 1),
(68, 'Biblioteca Virtual', 1, NULL, NULL, 2, 'fa fa-book', 2),
(69, 'Ver', 0, '/biblioteca', 68, 2, NULL, 1),
(70, 'Nuevo archivo', 0, '/biblioteca/nuevo', 68, 2, NULL, 2),
(71, 'Importar Objeto Aprendizaje', 0, '/biblioteca/importar', 68, 2, NULL, 2),
(72, 'Mis Secciones', 1, '/secciones/facilitador', NULL, 2, 'fa fa-briefcase', 3),
(73, 'Calendario', 1, '/calendario/facilitador', NULL, 2, 'fa fa-calendar-o', 4),
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
(108, 'Nuevo', 0, '/encuestas/nuevo', 107, 7, NULL, 1),
(109, 'Modificar', 0, '/encuestas/modificar', 107, 7, 'fa fa-edit', 2),
(110, 'Todas', 0, '/encuestas/todas', 107, 7, NULL, 3),
(111, 'Costos', 1, NULL, NULL, 7, NULL, 5),
(112, 'Nuevo', 0, '/costos/nuevo', 111, 7, NULL, 3),
(113, 'Modificar', 0, '/costos/modificar', 111, 7, NULL, 3),
(114, 'Todos', 0, '/costos/todos', 111, 7, NULL, 3),
(115, 'Mi cuenta', 1, NULL, NULL, 7, 'mdi-action-perm-identity', 6),
(116, 'Ver perfil', 0, '/usuarios/1', 115, 7, NULL, 1),
(117, 'Modificar perfil', 0, '/usuarios/editar', 115, 7, 'mdi-content-create', 2),
(118, 'Preferencias', 0, '/preferencias', 115, 7, 'mdi-action-settings', 3);

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

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `encrypted_password`, `nombre`, `pregunta_secreta`, `respuesta_secreta`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`) VALUES
(1, 'test@gmail.com', '$2a$10$5gstYjsOWGsd5.ItAZDagOTgzbSUHrkbBlTGf0szJt0.197I.wAtK', 'test', NULL, NULL, NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
