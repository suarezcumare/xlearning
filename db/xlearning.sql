-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-01-2015 a las 02:45:26
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

INSERT INTO `menus` (`id`, `rol_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

--
-- Volcado de datos para la tabla `opcion_menus`
--

INSERT INTO `opcion_menus` (`id`, `nombre`, `raiz`, `url`, `padre_id`, `menu_id`, `icono`, `created_at`, `updated_at`) VALUES
(1, 'inicio', 1, '/', NULL, 1, 'mdi-action-home', NULL, NULL),
(2, 'Carga académica', 1, '/clases', NULL, 1, 'fa fa-mortar-board', NULL, NULL),
(3, 'historial', 1, '/historial', NULL, 1, 'mdi-action-history', NULL, NULL),
(4, 'Pagos realizados', 0, '/historial/pagos', 3, 1, 'mdi-action-account-balance', NULL, NULL),
(5, 'Certificados obtenidos', 0, '/historial/certificados', 3, 1, 'fa fa-certificate', NULL, NULL),
(6, 'Mi cuenta', 1, NULL, NULL, 1, 'mdi-action-perm-identity', NULL, NULL),
(7, 'Ver perfil', 0, '/usuarios/1', 6, 1, NULL, NULL, NULL),
(8, 'Modificar perfil', 0, '/usuarios/editar', 6, 1, 'mdi-content-create', NULL, NULL),
(9, 'Preferencias', 0, '/preferencias', 6, 1, 'mdi-action-settings', NULL, NULL),
(10, 'oferta de cursos', 1, '/cursos', NULL, 1, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `rols`
--

INSERT INTO `rols` (`id`, `nombre`, `estatus`) VALUES
(1, 'estudiante', NULL);

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
('20141220060521'),
('20141222162418');

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `encrypted_password`, `nombre`, `pregunta_secreta`, `respuesta_secreta`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `created_at`, `updated_at`, `provider`, `uid`) VALUES
(1, 'test@gmail.com', '$2a$10$5gstYjsOWGsd5.ItAZDagOTgzbSUHrkbBlTGf0szJt0.197I.wAtK', 'test', NULL, NULL, NULL, NULL, NULL, '2014-12-15 18:28:32', '2014-12-15 18:28:32', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
