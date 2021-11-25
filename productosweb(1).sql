-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-11-2021 a las 10:34:54
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `productosweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `id_padre`, `estado`) VALUES
(4, 'computadoras', 0, 1),
(5, 'celulares', 0, 1),
(6, 'tablets', 0, 1),
(7, 'portatil', 4, 1),
(8, 'escritorio', 4, 1),
(9, 'tactil', 5, 1),
(10, 'phablet', 6, 1),
(12, 'Notebook', 0, 1),
(13, 'Televisores', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `motivo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `comentario`, `motivo`) VALUES
(7, 'rodrigo gabriel', 'fernandez checa', 'rodri.9891@gmail.com', '1531218047', 'buenas quisiera comprar el producto con id :1283741 y saber los descuentos. Gracias', 2),
(8, 'test', 'test', 'admin@gmail.com', '1523123123', 'quiero ser nuevo vendedor paso mis datos.', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `modelos_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `estado`, `modelos_fk`) VALUES
(1, 'samsung', 0, 2),
(2, 'sony', 0, 3),
(8, 'sony', 1, 2),
(9, 'apple', 0, 3),
(11, 'motorola', 1, 6),
(12, 'motorola', 1, 4),
(13, 'huawei', 1, 7),
(14, 'acer', 1, 4),
(15, 'lenovo', 1, 3),
(16, 'bangho', 1, 7),
(17, 'Alcatel', 1, 3),
(18, 'hitachi', 1, 5),
(19, 'HP', 1, 3),
(20, 'Opal', 1, 1),
(21, 'Amazon', 1, 6),
(22, 'kodak', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`id`, `nombre`) VALUES
(1, '2020'),
(2, '2019'),
(3, '2018'),
(4, '2017'),
(5, '2016'),
(6, '2015'),
(7, '2014');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_publi` date DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `rank` float DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `destacado` tinyint(1) NOT NULL DEFAULT 0,
  `usuarios_fk` int(11) NOT NULL,
  `categorias_fk` int(11) NOT NULL,
  `marcas_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `descripcion`, `fecha_publi`, `estado`, `imagen`, `precio`, `rank`, `titulo`, `destacado`, `usuarios_fk`, `categorias_fk`, `marcas_fk`) VALUES
(28, 'El Alcatel 5X te permite optimizar tu vida. La cámara cuádruple con IA de 48 MP te permite vivir la vida al máximo, estés donde estés. Crea recuerdos en alta resolución y sin esfuerzo. Captura la amplitud, la profundidad y el máximo detalle de tus experiencias con una lente gran angular de 5 MP y lentes macro y de profundidad de 2 MP. Disfruta de tus contenidos favoritos en una pantalla de vista panoramica con cristal 2.5D suave como la seda. El rendimiento rápido y la batería de 5000 mAh te permiten disfrutar de streamings, juegos y mucho más en calidad HD, durante más tiempo y sin problemas. El diseño mineral brillante con cristal de doble cara proporciona un acabado que complementa cualquier look.', '2021-08-03', 1, '/assets/img/upload/1628431506734-alcatel-5x-5061a-faofar11-telefono-celular-open-jewelry-black-00907235.jpg', 34199, NULL, 'ALCATEL 5X 5061A-FAOFAR11 TELEFONO CELULAR OPEN JEWELRY BLACK', 1, 7, 5, 16),
(29, '\r\nDisfrutá Full HD\r\n\r\nEl Smart TV Hitachi 40 pulgadas cuenta con una pantalla formato widescreen (16:9) con resolución Full HD (1920 x 1080 píxeles). A diferencia del estándar HD, su alto nivel de detalle brinda colores más puros y nítidos.\r\nConectá tus dispositivos\r\n\r\nMediante sus 2 entradas HDMI podés vincular reproductores de audio y video; consolas de juegos y notebooks. Su gran capacidad de transmisión de datos permite disfrutar de imágenes en alta definición y un sonido de gran fidelidad. También, a través de su puerto USB, podrás reproducir contenido multimedia (música, fotos y videos) almacenado en tus dispositivos externos como tablets, smartphones y pendrives.', '2021-08-05', 1, '/assets/img/upload/1628432431943-hitachi-led-tv-40-cdh-le40-smart-17-full-hd-android-sintonizador-tda-15307464.jpg', 42179, NULL, 'HITACHI LED TV 40\" CDH-LE40 SMART 17 FULL HD ANDROID SINTONIZADOR TDA', 0, 8, 13, 18),
(30, 'Microprocesador\r\n	\r\nIntel® Celeron® N4000 (frecuencia base de 1,1 GHz, frecuencia de ráfaga de hasta 2,6 GHz, 4 MB de caché, 2 núcleos)\r\nMemoria, estándar\r\n	\r\nSDRAM DDR4-2400 de 4 GB (1 x 4 GB)\r\nGráficos de video\r\n	\r\n\r\n    Gráficos Intel® UHD 600\r\n    Integrado\r\n\r\nDisco duro\r\n	\r\nEMMC de 64 GB\r\nUnidad óptica\r\n	\r\nUnidad óptica no incluida\r\nMonitor\r\n	\r\nPantalla con retroiluminación WLED HD SVA BrightView de 14 \"en diagonal (1366 x 768)\r\nConectividad inalámbrica\r\n	\r\nCombinación de Realtek 802.11b / g / n / a / ac (2x2) y Bluetooth® 4.2\r\nInterfaz de red\r\n	\r\nLAN 10/100/1000 GbE integrada\r\nRanuras de expansión\r\n	\r\n1 lector de tarjetas multimedia SD multiformato\r\nPuertos externos\r\n	\r\n2 USB 3.1 Gen 1 (solo transferencia de datos); 1 USB 2.0; 1 HDMI 1.4; 1 combo de auriculares / micrófono\r\nDimensiones mínimas (An x Pr x Al)\r\n	\r\n33,7 x 22,6 x 1,79 centímetros\r\nTipo de fuente de alimentación\r\n	\r\nAdaptador de CA inteligente de 45 W\r\nTipo de Batería\r\n	\r\nIones de litio de 3 celdas y 41 Wh\r\nCámara web\r\n	\r\nCámara web HP con micrófono digital integrado\r\nFunciones de audio\r\n	\r\nAltavoces duales\r\nSoftware\r\nSistema operativo\r\n	\r\nWindows 10 Home en modo S', '2021-08-13', 1, '/assets/img/upload/1628432699615-hewlett-packard-notebook-cb174-celeron-dual-core-n-4000-64gb-4gb-wind10-152025724.jpg', 42599, NULL, 'HEWLETT PACKARD NOTEBOOK CB174 CELERON DUAL CORE N-4000 64GB 4GB WIND.10', 1, 9, 12, 19),
(31, '\r\n\r\n    Doble Cámara Trasera: 8AF + 0.3 MPX\r\n    Cámara Frontal: 8 MPX\r\n    Procesador: Spreadtrum SC9832E Quad-Core 4x1.4 GHz\r\n    Memoria RAM: 2 GB\r\n    Memoria ROM: 16 GB\r\n    Memoria expandible: Micro SD hasta 64 GB\r\n    Batería: 2100 mAh Li-Ion\r\n    Sistema operativo: Android 10.0 Q GO\r\n    Wi-Fi - Bluetooth - USB C\r\n    Medidas: 139.9 x 66.2 x 10.2 mm\r\n    Peso: 142 g', '2021-08-26', 1, '/assets/img/upload/1628432922570-kodak-celular-smartway-l2n-negro-18807218.jpg', 19379, NULL, 'KODAK CELULAR SMARTWAY L2N NEGRO', 0, 8, 5, 1),
(32, 'Pantalla\r\n	7 pulgadas\r\nResolución 	1024 x 600 (171 ppi)\r\nAlmacenamiento 	16 (expandible hasta 32 GB)\r\nCPU 	Núcleo cuádruple de 1.3 GHz\r\nRAM 	1 GB\r\nDuración de la batería 	Hasta 7 horas\r\nPuertos 	micro-USB (2.0)\r\nTiempo de carga (con el adaptador incluido) 	4 horas\r\nCarga inalámbrica 	 \r\nAudio 	Altavoz mono\r\nCámara 	Orientación hacia adelante y hacia atrás de 2 MP\r\nPeso 	10.1 oz (286 g)\r\nTamaño 	7.6 x 4.5 x 0.4 pulgadas (192 x 115 x 9.6 mm)', '2021-08-10', 1, '/assets/img/upload/1628433083657-amazon-tablet-fire-7-quad-core-con-alexa-1gb-16gb-lps-27702515.jpg', 11399, NULL, 'AMAZON TABLET FIRE 7 QUAD CORE CON ALEXA | 1GB | 16GB | LPS', 0, 7, 6, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `perfil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `clave`, `perfil`) VALUES
(6, 'admin', 'admin', 'admin@gmail.com', 463496209, 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'admin'),
(7, 'Rodrigo', 'Fernandez', 'rodri.9891@gmail.com', 1531218047, '/X133iJbMlSfH1N9N4UmrTB/V1xbbWY3ClDIDPVOCBo=', 'vendedor'),
(8, 'yocabid', 'Carbajal', 'yocarbajal@gmail.com', 452342345, 'uuo14WAN7o2l+uALzcH4U5uKDJJAfVGGxyVPBHwrfhk=', 'vendedor'),
(9, 'Gladys', 'Ari', 'glari@gmail.com', 459295203, '7jsrC9RJrbddNP9jQqoZapkYqmsNP7ryR+xPNMVk6oQ=', 'vendedor');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modelos_fk` (`modelos_fk`) USING BTREE;

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_fk` (`usuarios_fk`),
  ADD KEY `categorias_fk` (`categorias_fk`),
  ADD KEY `marcas_fk` (`marcas_fk`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`modelos_fk`) REFERENCES `modelos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`usuarios_fk`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`categorias_fk`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`marcas_fk`) REFERENCES `marcas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
