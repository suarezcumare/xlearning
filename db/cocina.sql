-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2015 a las 04:26:56
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cocina`
--

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `encrypted_password`, `nombre`, `pregunta_secreta`, `respuesta_secreta`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `apellido`) VALUES
(1, 'c.valentina@gmail.com', '$2a$10$UDrziP7KaBZ8STpF8PvHaelYLHSD5FjK0c.vqAftwbHhIPou118fe', 'Valentina', NULL, NULL, NULL, NULL, NULL, 'Maldonado'),
(2, 'facilitador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Andres', NULL, NULL, NULL, NULL, NULL, ''),
(3, 'coordinador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jose', NULL, NULL, NULL, NULL, NULL, ''),
(4, 'administrador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Antonio', NULL, NULL, NULL, NULL, NULL, ''),
(5, 'ejecutivo@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jesus', NULL, NULL, NULL, NULL, NULL, ''),
(6, 'ejecutivoportal@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jesus', NULL, NULL, NULL, NULL, NULL, ''),
(7, 'superadministrador@correo.com', '$2a$10$px6PtSl3bp4cgGWy4URHJODY2H2m.kQ5L.AkiflR2DM7KY9GFnDj.', 'Jesus', NULL, NULL, NULL, NULL, NULL, '');

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
