-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2021 a las 21:47:56
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `twisted-fate`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `id_producto`, `id_usuario`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 3, 1, 1, '2021-07-20 10:49:39', '2021-07-25 13:51:28'),
(2, 4, 1, 1, '2021-07-20 10:49:42', '2021-07-25 13:51:28'),
(3, 6, 1, 1, '2021-07-20 10:49:45', '2021-07-25 13:51:28'),
(4, 3, 1, 1, '2021-07-20 11:52:38', '2021-07-25 13:51:28'),
(5, 3, 1, 1, '2021-07-20 11:55:18', '2021-07-25 13:51:28'),
(6, 3, 1, 1, '2021-07-20 11:55:21', '2021-07-25 13:51:28'),
(7, 7, 1, 1, '2021-07-20 11:55:58', '2021-07-25 13:51:28'),
(8, 3, 1, 1, '2021-07-20 11:56:55', '2021-07-25 13:51:28'),
(9, 3, 1, 1, '2021-07-25 13:50:39', '2021-07-25 13:51:28'),
(10, 3, 1, 1, '2021-07-25 13:51:44', '2021-07-25 13:51:46'),
(11, 3, 1, 1, '2021-07-25 16:56:15', '2021-07-25 16:58:39'),
(12, 3, 1, 1, '2021-07-25 16:58:38', '2021-07-25 16:58:39'),
(13, 4, 1, 1, '2021-07-25 16:58:41', '2021-07-25 16:58:46'),
(14, 3, 1, 1, '2021-07-25 16:58:56', '2021-07-25 16:59:10'),
(15, 4, 1, 1, '2021-07-25 16:59:01', '2021-07-25 16:59:10'),
(16, 6, 1, 1, '2021-07-25 16:59:07', '2021-07-25 16:59:10'),
(17, 3, 1, 1, '2021-07-25 17:00:17', '2021-07-25 17:04:38'),
(18, 6, 1, 1, '2021-07-25 17:00:22', '2021-07-25 17:04:33'),
(19, 8, 1, 1, '2021-07-25 17:00:25', '2021-07-25 17:04:49'),
(20, 3, 1, 1, '2021-07-25 17:04:29', '2021-07-25 17:04:38'),
(21, 10, 1, 1, '2021-07-25 19:07:54', '2021-07-25 19:08:40'),
(22, 13, 1, 1, '2021-07-25 19:08:01', '2021-07-25 19:08:39'),
(23, 14, 1, 1, '2021-07-25 19:08:05', '2021-07-25 19:08:12'),
(24, 10, 1, 1, '2021-07-25 19:08:45', '2021-07-25 19:08:47'),
(25, 10, 1, 1, '2021-07-25 21:06:34', '2021-07-25 21:06:36'),
(26, 15, 1, 1, '2021-07-25 21:07:16', '2021-07-25 21:07:19'),
(27, 15, 1, 1, '2021-07-25 21:57:39', '2021-07-25 22:03:19'),
(28, 15, 1, 1, '2021-07-25 22:00:41', '2021-07-25 22:03:19'),
(29, 11, 1, 1, '2021-07-25 22:03:16', '2021-07-25 22:03:20'),
(30, 10, 1, 1, '2021-07-25 23:19:09', '2021-07-26 11:49:47'),
(31, 10, 1, 1, '2021-07-26 11:49:46', '2021-07-26 11:49:47'),
(32, 10, 1, 1, '2021-07-26 11:49:52', '2021-07-26 11:50:01'),
(33, 11, 1, 1, '2021-07-26 11:49:56', '2021-07-26 11:49:59'),
(34, 12, 1, 1, '2021-07-26 11:49:58', '2021-07-26 11:49:59'),
(35, 10, 1, 1, '2021-07-27 16:39:12', '2021-07-27 17:34:36'),
(36, 22, 1, 1, '2021-07-27 16:39:47', '2021-07-27 16:39:56'),
(37, 12, 1, 1, '2021-07-27 16:39:51', '2021-07-27 16:39:58'),
(38, 18, 1, 1, '2021-07-27 16:39:54', '2021-07-27 17:34:35'),
(39, 10, 1, 1, '2021-08-03 12:19:18', '2021-08-03 20:25:59'),
(40, 20, 1, 1, '2021-08-03 12:19:22', '2021-08-03 20:25:57'),
(41, 22, 1, 1, '2021-08-03 12:19:25', '2021-08-03 20:25:55'),
(42, 17, 1, 1, '2021-08-03 12:19:27', '2021-08-03 20:25:58'),
(43, 10, 1, 1, '2021-08-03 20:25:52', '2021-08-03 20:25:59'),
(44, 13, 1, 0, '2021-08-03 20:26:07', '2021-08-03 20:26:07'),
(45, 16, 1, 0, '2021-08-03 20:26:14', '2021-08-03 20:26:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'Cartas', 'Cartas Magic, Mazos armados, Booster packs.', 0, '2021-07-14 13:12:37', '2021-07-14 13:12:37'),
(2, 'Dados', 'Dados y contadores para tus partidas!', 0, '2021-07-14 13:14:22', '2021-07-14 13:14:22'),
(3, 'Fundas', 'Fundas para el cuidado de tus cartas.', 0, '2021-07-14 13:14:37', '2021-07-14 13:14:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `id_categoria`, `eliminado`, `ts_create`, `ts_update`) VALUES
(3, 'Planeswalker Deck - Black', 'Mazo básico de color negro, incluye un Planewsalker.', 2550, 4, 1, 1, '2021-07-14 19:09:38', '2021-07-25 17:18:09'),
(4, 'Planeswalker Deck - Red', 'Mazo básico de color rojo, incluye un Planewsalker.', 2400, 5, 1, 1, '2021-07-14 19:23:34', '2021-07-25 17:19:13'),
(5, 'Planeswalker Deck - Green', 'Mazo básico de color verde, incluye un Planewsalker.', 2400, 5, 1, 1, '2021-07-14 19:24:26', '2021-07-20 11:21:05'),
(6, 'Planeswalker Deck - Green', 'Mazo básico de color verde, incluye un Planewsalker.', 2600, 5, 1, 1, '2021-07-16 15:33:46', '2021-07-25 17:19:40'),
(7, 'Planeswalker Deck - White', 'Mazo básico de color blanco, incluye un Planewsalker.', 2400, 5, 1, 1, '2021-07-16 15:35:54', '2021-07-25 17:19:41'),
(8, 'Planeswalker Deck - Blue', 'Mazo básico de color azul, incluye un Planewsalker.', 2500, 5, 1, 1, '2021-07-16 15:36:47', '2021-07-25 17:19:42'),
(9, 'Combo - 5 mazos Planeswalker', 'Combo de 5 mazos básicos para jugar con amigos!', 10000, 7, 1, 1, '2021-07-16 15:37:56', '2021-07-25 17:19:42'),
(10, 'Planeswalker Deck - Black', 'Mazo inicial Planeswalker listo para jugar!', 4000, 25, 1, 0, '2021-07-25 17:20:29', '2021-07-25 21:56:55'),
(11, 'Planeswalker Deck - Green', 'Mazo inicial Planeswalker listo para jugar!', 4100, 8, 1, 0, '2021-07-25 17:20:54', '2021-07-25 17:20:54'),
(12, 'Planeswalker Deck - Blue', 'Mazo inicial Planeswalker listo para jugar!', 3900, 6, 1, 0, '2021-07-25 17:21:27', '2021-07-25 17:21:27'),
(13, 'Planeswalker Deck - Red', 'Mazo inicial Planeswalker listo para jugar!', 4000, 8, 1, 0, '2021-07-25 17:21:46', '2021-07-25 17:21:46'),
(14, 'Planeswalker Deck - White', 'Mazo inicial Planeswalker listo para jugar!', 3800, 11, 1, 0, '2021-07-25 17:22:12', '2021-07-25 17:22:12'),
(15, 'Combo - 5 mazos Planeswalker', 'Promo de 5 mazos listos para jugar con tus amigos!', 15999, 8, 1, 0, '2021-07-25 20:00:25', '2021-07-25 20:00:25'),
(16, 'Dados d20', 'Dados d20 - Colores: Rojo, Azul, Verde, Blanco y Negro!', 1200, 25, 2, 0, '2021-07-27 13:37:14', '2021-07-27 13:37:14'),
(17, 'Contador de vidas', 'Contador de 20 vidas', 1500, 20, 2, 0, '2021-07-27 13:38:10', '2021-07-27 13:38:10'),
(18, 'Dados Contadores', 'Dados para usar de contadores, colores: Blanco y Negro!', 1000, 25, 2, 0, '2021-07-27 13:38:46', '2021-07-27 13:40:26'),
(19, 'Fundas Magic - Fuego', '80 fundas motivo Fuego para cartas Magic', 2000, 15, 3, 0, '2021-07-27 14:14:58', '2021-07-27 14:15:19'),
(20, 'Fundas Magic - Arbol', '80 fundas motivo Arbol para cartas Magic', 2500, 25, 3, 0, '2021-07-27 14:20:14', '2021-07-27 14:20:14'),
(21, 'Fundas Magic - Kraken', '80 fundas motivo Kraken para cartas Magic', 3500, 10, 3, 0, '2021-07-27 14:20:48', '2021-07-27 14:20:48'),
(22, 'Fundas Transparentes x2', '2 packs de 80 fundas transparentes', 1800, 30, 3, 0, '2021-07-27 15:03:34', '2021-07-27 15:03:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_imagenes`
--

CREATE TABLE `productos_imagenes` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `id_producto` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos_imagenes`
--

INSERT INTO `productos_imagenes` (`id`, `uid`, `id_producto`, `eliminado`, `ts_create`, `ts_update`) VALUES
(2, '156c05b8-7a5e-4dc5-a8f5-3363bf4a7d56.jpeg', 3, 0, '2021-07-14 19:09:38', '2021-07-14 19:09:38'),
(3, '9acc5a88-7b30-46f2-a4f5-cbdd935d72d2.jpeg', 4, 0, '2021-07-14 19:23:34', '2021-07-14 19:23:34'),
(4, '2ba8b3c3-cc68-4ecf-a975-b17eab0b790b.jpeg', 5, 1, '2021-07-14 19:24:26', '2021-07-25 17:19:13'),
(5, '79a3b4a8-91da-434f-bf6b-29f74ed562dd.jpeg', 6, 0, '2021-07-16 15:33:46', '2021-07-16 15:33:46'),
(6, '0a42cfda-1c00-47fb-aa33-018402a15d58.jpeg', 7, 1, '2021-07-16 15:35:54', '2021-07-25 17:19:40'),
(7, 'c5f44f7c-9fa8-46cb-8abd-3207d0e8445e.jpeg', 8, 1, '2021-07-16 15:36:47', '2021-07-25 17:19:41'),
(8, '538c70d0-4e89-42a1-914e-4a9a9d14b24a.jpeg', 9, 1, '2021-07-16 15:37:56', '2021-07-25 17:19:42'),
(9, '260b230c-6863-496f-b153-d9a8be23b300.png', 10, 0, '2021-07-25 17:20:29', '2021-07-25 17:20:29'),
(10, '8541c0c5-e978-4d92-8371-13fda6a810ee.png', 11, 0, '2021-07-25 17:20:54', '2021-07-25 17:20:54'),
(11, 'fd0fd57a-8801-4cb4-bb36-34c7e0a5ebbd.png', 12, 0, '2021-07-25 17:21:27', '2021-07-25 17:21:27'),
(12, '5ce76ff3-9808-47ff-9d23-01e498442f2d.png', 13, 0, '2021-07-25 17:21:46', '2021-07-25 17:21:46'),
(13, 'bcba6cb2-0b23-4b80-83e3-9b0c48f881ba.png', 14, 0, '2021-07-25 17:22:12', '2021-07-25 17:22:12'),
(14, '2cd5cb99-3178-49bb-a0bf-5b234bd0e0b7.png', 15, 0, '2021-07-25 20:00:25', '2021-07-25 20:00:25'),
(15, 'd5ee164f-2b0d-4f35-a5b4-295056c91eb7.png', 16, 0, '2021-07-27 13:37:14', '2021-07-27 13:37:14'),
(16, '7a4e336a-3a26-4ee5-8de6-70cf3da05bc2.png', 17, 0, '2021-07-27 13:38:10', '2021-07-27 13:38:10'),
(17, '8dad5867-6a6a-4ff1-a656-5d0da68f9742.png', 18, 0, '2021-07-27 13:38:46', '2021-07-27 13:38:46'),
(18, '7054d35e-4546-44c3-8114-9b4086466c47.png', 19, 0, '2021-07-27 14:14:58', '2021-07-27 14:14:58'),
(19, '98edc0cd-950c-4432-a18a-c6c0e23aade2.png', 20, 0, '2021-07-27 14:20:14', '2021-07-27 14:20:14'),
(20, '8723a4f3-7866-43f2-8ad9-36a152c9f49c.png', 21, 0, '2021-07-27 14:20:48', '2021-07-27 15:01:41'),
(21, 'ff8e1e77-d10b-43f0-b3b2-cac263a42d57.png', 22, 0, '2021-07-27 15:03:34', '2021-07-27 15:03:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `confirmacionCorreo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `habilitado` tinyint(1) NOT NULL DEFAULT 0,
  `eliminado` tinyint(1) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `pass`, `mail`, `direccion`, `confirmacionCorreo`, `admin`, `habilitado`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'TikoKitsune', 'f085d6d670bee2372105e30813ee4eac7fe4766a', 'santiagopaci@gmail.com', '', '236997b6-748c-40c1-bc3f-6b81f84ce345', 1, 1, 0, '2021-07-12 18:01:00', '2021-07-14 13:04:45'),
(8, 'Negrillapn', 'bcb23011b447c27efe099279b3592bcafbca008f', 'tikipaci@gmail.com', '', '0ad24e79-1ed3-4ffe-ac6b-e0041f328b3a', 0, 0, 0, '2021-07-19 19:47:51', '2021-07-19 19:47:51'),
(15, 'Chelman', '5a69ae0cf2b680195cfe78dbcc899033f55b2d1b', 'megumintico@gmail.com', '', 'ea89928e-e0f2-47ed-84b5-e2586160899b', 0, 1, 0, '2021-07-28 14:40:44', '2021-07-28 18:12:39'),
(16, 'El Bambino', '5a69ae0cf2b680195cfe78dbcc899033f55b2d1b', 'ticopaci@gmail.com', '', '6b90a294-9ff1-4133-84b5-28cea35489a1', 0, 1, 0, '2021-07-28 14:43:03', '2021-07-28 18:11:27'),
(18, 'ilpapa', '287291d8953901df109186d893e423262657e2fc', 'ticomegumin@gmail.com', '', '26fafbb5-5ec2-4ad8-aebd-7e69c49e23cc', 1, 1, 0, '2021-08-03 20:24:10', '2021-08-03 20:26:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_imagenes`
--

CREATE TABLE `usuarios_imagenes` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `productos_imagenes`
--
ALTER TABLE `productos_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios_imagenes`
--
ALTER TABLE `usuarios_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos_imagenes`
--
ALTER TABLE `productos_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios_imagenes`
--
ALTER TABLE `usuarios_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `productos_imagenes`
--
ALTER TABLE `productos_imagenes`
  ADD CONSTRAINT `productos_imagenes_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `usuarios_imagenes`
--
ALTER TABLE `usuarios_imagenes`
  ADD CONSTRAINT `usuarios_imagenes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
