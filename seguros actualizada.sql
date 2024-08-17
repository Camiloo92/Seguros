-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2024 a las 04:17:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `seguros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentes`
--

CREATE TABLE `agentes` (
  `id_agente` int(10) NOT NULL,
  `documento_a` int(10) NOT NULL,
  `primer_nombre_a` varchar(35) NOT NULL,
  `segundo_nombre_a` varchar(35) DEFAULT NULL,
  `primer_apellido_a` varchar(35) NOT NULL,
  `segundo_apellido_a` varchar(35) DEFAULT NULL,
  `celular_a` int(10) NOT NULL,
  `direccion_agente` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agentes`
--

INSERT INTO `agentes` (`id_agente`, `documento_a`, `primer_nombre_a`, `segundo_nombre_a`, `primer_apellido_a`, `segundo_apellido_a`, `celular_a`, `direccion_agente`) VALUES
(1, 1234567890, 'Pedro', 'Alonso', 'García', 'Pérez', 2147483647, 'Calle 1 # 2-3, Bogotá'),
(2, 2147483647, 'María', 'Fernanda', 'Rodríguez', 'López', 2147483647, 'Avenida 5 # 6-7, Medellín'),
(3, 2147483647, 'Juan', 'David', 'Martínez', 'Sánchez', 2147483647, 'Carrera 8 # 9-10, Cali'),
(4, 2147483647, 'Laura', 'Isabella', 'Gómez', 'Ramírez', 2147483647, 'Calle 12 # 13-14, Barranquilla'),
(5, 2147483647, 'Andrés', 'Felipe', 'Moreno', 'Córdoba', 2147483647, 'Avenida 15 # 16-17, Cartagena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficiarios`
--

CREATE TABLE `beneficiarios` (
  `id_beneficiario` int(10) NOT NULL,
  `primer_nombre_ben` varchar(35) NOT NULL,
  `segundo_nombre_ben` varchar(35) DEFAULT NULL,
  `primer_apellido_ben` varchar(35) NOT NULL,
  `segundo_apellido_ben` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `beneficiarios`
--

INSERT INTO `beneficiarios` (`id_beneficiario`, `primer_nombre_ben`, `segundo_nombre_ben`, `primer_apellido_ben`, `segundo_apellido_ben`) VALUES
(1, 'Sofía', 'Alejandra', 'Vega', 'Mendoza'),
(2, 'Gabriel', 'Andrés', 'Castro', 'Córdoba'),
(3, 'Valentina', 'Martínez', 'Pineda', 'Rodríguez'),
(4, 'Nicolás', 'Alejandro', 'García', 'Hernández'),
(5, 'Camila', 'Lucía', 'Morales', 'Ruiz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficiarios_cliente_seguro_vida`
--

CREATE TABLE `beneficiarios_cliente_seguro_vida` (
  `beneficiariosid_beneficiario` int(10) NOT NULL,
  `cliente_seguro_vidaclienteid_cliente` int(5) NOT NULL,
  `cliente_seguro_vidaseguro_vidaid_vida` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `beneficiarios_cliente_seguro_vida`
--

INSERT INTO `beneficiarios_cliente_seguro_vida` (`beneficiariosid_beneficiario`, `cliente_seguro_vidaclienteid_cliente`, `cliente_seguro_vidaseguro_vidaid_vida`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartera`
--

CREATE TABLE `cartera` (
  `id_cartera` int(10) NOT NULL,
  `comision` int(10) DEFAULT NULL,
  `agentesid_agente` int(10) NOT NULL,
  `seguro_vidaid_vida` int(10) NOT NULL,
  `seguro_hogarid_hogar` int(10) NOT NULL,
  `seguro_vehiculoid_vehiculo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cartera`
--

INSERT INTO `cartera` (`id_cartera`, `comision`, `agentesid_agente`, `seguro_vidaid_vida`, `seguro_hogarid_hogar`, `seguro_vehiculoid_vehiculo`) VALUES
(1, 12000, 5, 4, 4, 2),
(2, 12345, 3, 1, 4, 5),
(3, 12000, 2, 1, 2, 4),
(4, 12345, 4, 2, 4, 5),
(5, 12000, 1, 1, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(5) NOT NULL,
  `documento` int(10) NOT NULL,
  `primer_nombre` varchar(35) NOT NULL,
  `segundo_nombre` varchar(35) NOT NULL,
  `primer_apellido` varchar(35) NOT NULL,
  `segundo_apellido` varchar(35) NOT NULL,
  `dirección` varchar(35) NOT NULL,
  `celular` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `documento`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `dirección`, `celular`) VALUES
(1, 123456789, 'Luis', 'Fernando', 'Mendoza', 'Hernández', 'Avenida 1', 2147483647),
(2, 234567890, 'Catalina', 'Sofía', 'Salazar', 'Cabrera', 'Avenida 2', 2147483647),
(3, 345678901, 'Alejandro', 'Javier', 'Pérez', 'Gómez', 'Avenida 3', 2147483647),
(4, 456789012, 'Isabella', 'Fernanda', 'Moreno', 'Hernández', 'Avenida 4', 2147483647),
(5, 567890123, 'Felipe', 'Andrés', 'García', 'Ramírez', 'Avenida 5', 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_seguro_hogar`
--

CREATE TABLE `cliente_seguro_hogar` (
  `clienteid_cliente` int(5) NOT NULL,
  `seguro_hogarid_hogar` int(10) NOT NULL,
  `agentesid_agente` int(10) NOT NULL,
  `fecha_hogar` date NOT NULL,
  `fecha_hogar_cierre` date NOT NULL,
  `direccion_hogar` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente_seguro_hogar`
--

INSERT INTO `cliente_seguro_hogar` (`clienteid_cliente`, `seguro_hogarid_hogar`, `agentesid_agente`, `fecha_hogar`, `fecha_hogar_cierre`, `direccion_hogar`) VALUES
(1, 1, 1, '2024-01-01', '2025-01-01', 'Calle Falsa 123'),
(1, 5, 2, '2025-06-11', '2026-08-12', 'calle 144 #12588'),
(2, 2, 2, '2024-02-01', '2025-02-01', 'Avenida Siempre Viva 742'),
(3, 2, 3, '2024-08-07', '2025-08-20', 'calle 144#127c-62'),
(5, 2, 2, '2024-08-07', '2025-08-20', ''),
(5, 4, 4, '2025-06-11', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_seguro_vehiculo`
--

CREATE TABLE `cliente_seguro_vehiculo` (
  `clienteid_cliente` int(5) NOT NULL,
  `seguro_vehiculoid_vehiculo` int(10) NOT NULL,
  `agentesid_agente` int(10) NOT NULL,
  `fecha_vehiculo` date NOT NULL,
  `fecha_vehiculo_cierre` date NOT NULL,
  `recargos` int(10) NOT NULL,
  `descuentos` int(10) NOT NULL,
  `matricula` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente_seguro_vehiculo`
--

INSERT INTO `cliente_seguro_vehiculo` (`clienteid_cliente`, `seguro_vehiculoid_vehiculo`, `agentesid_agente`, `fecha_vehiculo`, `fecha_vehiculo_cierre`, `recargos`, `descuentos`, `matricula`) VALUES
(2, 4, 3, '2024-08-01', '2025-08-01', 0, 0, 'xmt455'),
(3, 3, 5, '2025-07-31', '2025-10-28', 0, 0, 'ntn499'),
(5, 2, 1, '2024-08-01', '2025-08-14', 0, 0, 'xmt457'),
(5, 3, 2, '2025-07-31', '2025-10-28', 0, 0, 'xbb654');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_seguro_vida`
--

CREATE TABLE `cliente_seguro_vida` (
  `clienteid_cliente` int(5) NOT NULL,
  `seguro_vidaid_vida` int(10) NOT NULL,
  `agentesid_agente` int(10) NOT NULL,
  `fecha_vida` date NOT NULL,
  `fecha_vida_cierre` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente_seguro_vida`
--

INSERT INTO `cliente_seguro_vida` (`clienteid_cliente`, `seguro_vidaid_vida`, `agentesid_agente`, `fecha_vida`, `fecha_vida_cierre`) VALUES
(1, 1, 1, '2024-01-01', '2025-01-01'),
(2, 2, 2, '2024-02-01', '2025-02-01'),
(3, 3, 3, '2024-03-01', '2025-03-01'),
(4, 4, 4, '2024-04-01', '2025-04-01'),
(5, 5, 5, '2024-05-01', '2025-05-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro_hogar`
--

CREATE TABLE `seguro_hogar` (
  `id_hogar` int(10) NOT NULL,
  `propiedad` varchar(35) NOT NULL,
  `contenido` varchar(35) NOT NULL,
  `riesgo_auxiliar` varchar(35) NOT NULL,
  `prima_hogar` int(10) NOT NULL,
  `vigencia_hogar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguro_hogar`
--

INSERT INTO `seguro_hogar` (`id_hogar`, `propiedad`, `contenido`, `riesgo_auxiliar`, `prima_hogar`, `vigencia_hogar`) VALUES
(1, 'Casa', 'Muebles', 'Bajo', 5000, b'1'),
(2, 'Apartamento', 'Electrodomésticos', 'Medio', 4000, b'1'),
(3, 'Finca', 'Maquinaria', 'Alto', 6000, b'1'),
(4, 'Casa de campo', 'Ropa', 'Bajo', 4500, b'1'),
(5, 'Chalet', 'Jardín', 'Medio', 5500, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro_vehiculo`
--

CREATE TABLE `seguro_vehiculo` (
  `id_vehiculo` int(10) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `año_coche` int(10) NOT NULL,
  `cobertura_vehiculos` varchar(255) NOT NULL,
  `prima_vehiculo` int(10) NOT NULL,
  `vigencia_vehiculo` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguro_vehiculo`
--

INSERT INTO `seguro_vehiculo` (`id_vehiculo`, `categoria`, `año_coche`, `cobertura_vehiculos`, `prima_vehiculo`, `vigencia_vehiculo`) VALUES
(1, 'Sedán', 2020, 'Completa', 8000, b'1'),
(2, 'SUV', 2021, 'Limitada', 9000, b'1'),
(3, 'Camioneta', 2019, 'Completa', 8500, b'1'),
(4, 'Deportivo', 2022, 'Limitada', 9500, b'1'),
(5, 'Hatchback', 2020, 'Completa', 7800, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro_vida`
--

CREATE TABLE `seguro_vida` (
  `id_vida` int(10) NOT NULL,
  `edad_vida` int(10) NOT NULL,
  `profesion` varchar(35) NOT NULL,
  `prima_vida` varchar(255) NOT NULL,
  `vigencia_vida` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguro_vida`
--

INSERT INTO `seguro_vida` (`id_vida`, `edad_vida`, `profesion`, `prima_vida`, `vigencia_vida`) VALUES
(1, 25, 'Abogado', '100000', b'1'),
(2, 30, 'Ingeniero', '150000', b'1'),
(3, 40, 'Doctor', '200000', b'1'),
(4, 35, 'Arquitecto', '180000', b'1'),
(5, 28, 'Profesor', '120000', b'1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agentes`
--
ALTER TABLE `agentes`
  ADD PRIMARY KEY (`id_agente`);

--
-- Indices de la tabla `beneficiarios`
--
ALTER TABLE `beneficiarios`
  ADD PRIMARY KEY (`id_beneficiario`);

--
-- Indices de la tabla `beneficiarios_cliente_seguro_vida`
--
ALTER TABLE `beneficiarios_cliente_seguro_vida`
  ADD PRIMARY KEY (`beneficiariosid_beneficiario`,`cliente_seguro_vidaclienteid_cliente`,`cliente_seguro_vidaseguro_vidaid_vida`),
  ADD KEY `FKbeneficiar805277` (`cliente_seguro_vidaclienteid_cliente`,`cliente_seguro_vidaseguro_vidaid_vida`);

--
-- Indices de la tabla `cartera`
--
ALTER TABLE `cartera`
  ADD PRIMARY KEY (`id_cartera`),
  ADD KEY `FKcartera826862` (`agentesid_agente`),
  ADD KEY `FKcartera670511` (`seguro_vidaid_vida`),
  ADD KEY `FKcartera994703` (`seguro_hogarid_hogar`),
  ADD KEY `FKcartera684124` (`seguro_vehiculoid_vehiculo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cliente_seguro_hogar`
--
ALTER TABLE `cliente_seguro_hogar`
  ADD PRIMARY KEY (`clienteid_cliente`,`seguro_hogarid_hogar`),
  ADD KEY `FKcliente_se907100` (`seguro_hogarid_hogar`),
  ADD KEY `FKcliente_se739259` (`agentesid_agente`);

--
-- Indices de la tabla `cliente_seguro_vehiculo`
--
ALTER TABLE `cliente_seguro_vehiculo`
  ADD PRIMARY KEY (`clienteid_cliente`,`seguro_vehiculoid_vehiculo`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `FKcliente_se108019` (`seguro_vehiculoid_vehiculo`),
  ADD KEY `FKcliente_se352584` (`agentesid_agente`);

--
-- Indices de la tabla `cliente_seguro_vida`
--
ALTER TABLE `cliente_seguro_vida`
  ADD PRIMARY KEY (`clienteid_cliente`,`seguro_vidaid_vida`),
  ADD KEY `FKcliente_se541462` (`seguro_vidaid_vida`),
  ADD KEY `FKcliente_se955911` (`agentesid_agente`);

--
-- Indices de la tabla `seguro_hogar`
--
ALTER TABLE `seguro_hogar`
  ADD PRIMARY KEY (`id_hogar`);

--
-- Indices de la tabla `seguro_vehiculo`
--
ALTER TABLE `seguro_vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- Indices de la tabla `seguro_vida`
--
ALTER TABLE `seguro_vida`
  ADD PRIMARY KEY (`id_vida`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cartera`
--
ALTER TABLE `cartera`
  MODIFY `id_cartera` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `beneficiarios_cliente_seguro_vida`
--
ALTER TABLE `beneficiarios_cliente_seguro_vida`
  ADD CONSTRAINT `FKbeneficiar771560` FOREIGN KEY (`beneficiariosid_beneficiario`) REFERENCES `beneficiarios` (`id_beneficiario`),
  ADD CONSTRAINT `FKbeneficiar805277` FOREIGN KEY (`cliente_seguro_vidaclienteid_cliente`,`cliente_seguro_vidaseguro_vidaid_vida`) REFERENCES `cliente_seguro_vida` (`clienteid_cliente`, `seguro_vidaid_vida`);

--
-- Filtros para la tabla `cartera`
--
ALTER TABLE `cartera`
  ADD CONSTRAINT `FKcartera670511` FOREIGN KEY (`seguro_vidaid_vida`) REFERENCES `seguro_vida` (`id_vida`),
  ADD CONSTRAINT `FKcartera684124` FOREIGN KEY (`seguro_vehiculoid_vehiculo`) REFERENCES `seguro_vehiculo` (`id_vehiculo`),
  ADD CONSTRAINT `FKcartera826862` FOREIGN KEY (`agentesid_agente`) REFERENCES `agentes` (`id_agente`),
  ADD CONSTRAINT `FKcartera994703` FOREIGN KEY (`seguro_hogarid_hogar`) REFERENCES `seguro_hogar` (`id_hogar`);

--
-- Filtros para la tabla `cliente_seguro_hogar`
--
ALTER TABLE `cliente_seguro_hogar`
  ADD CONSTRAINT `FKcliente_se370731` FOREIGN KEY (`clienteid_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `FKcliente_se739259` FOREIGN KEY (`agentesid_agente`) REFERENCES `agentes` (`id_agente`),
  ADD CONSTRAINT `FKcliente_se907100` FOREIGN KEY (`seguro_hogarid_hogar`) REFERENCES `seguro_hogar` (`id_hogar`);

--
-- Filtros para la tabla `cliente_seguro_vehiculo`
--
ALTER TABLE `cliente_seguro_vehiculo`
  ADD CONSTRAINT `FKcliente_se108019` FOREIGN KEY (`seguro_vehiculoid_vehiculo`) REFERENCES `seguro_vehiculo` (`id_vehiculo`),
  ADD CONSTRAINT `FKcliente_se352584` FOREIGN KEY (`agentesid_agente`) REFERENCES `agentes` (`id_agente`),
  ADD CONSTRAINT `FKcliente_se721112` FOREIGN KEY (`clienteid_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `cliente_seguro_vida`
--
ALTER TABLE `cliente_seguro_vida`
  ADD CONSTRAINT `FKcliente_se541462` FOREIGN KEY (`seguro_vidaid_vida`) REFERENCES `seguro_vida` (`id_vida`),
  ADD CONSTRAINT `FKcliente_se587383` FOREIGN KEY (`clienteid_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `FKcliente_se955911` FOREIGN KEY (`agentesid_agente`) REFERENCES `agentes` (`id_agente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
