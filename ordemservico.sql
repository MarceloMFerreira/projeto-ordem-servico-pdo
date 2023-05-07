-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 07-Maio-2023 às 18:07
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ordemservico`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `numero` varchar(11) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `perfil` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod`, `nome`, `email`, `senha`, `endereco`, `numero`, `bairro`, `cidade`, `telefone`, `status`, `perfil`, `data`) VALUES
(4, 'Danilo Alves Alvarenga', 'danilo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Avenida Dolores Silva', '335', 'Centro', 'Aguanil', '(35) 99984-9594', 1, 2, '2023-04-14'),
(5, 'Mariany Alves', 'mary@gmail.com', '202cb962ac59075b964b07152d234b70', 'Avenida Dolores Silva', '335', 'Centro', 'Aguanil', '(35) 99984-9594', 1, 2, '2023-05-07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem`
--

DROP TABLE IF EXISTS `ordem`;
CREATE TABLE IF NOT EXISTS `ordem` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cliente` int(11) NOT NULL,
  `cod_terceirizado` int(11) NOT NULL,
  `cod_servico` int(11) NOT NULL,
  `data_servico` date NOT NULL,
  `status` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `foreign_key_cod_cliente` (`cod_cliente`),
  KEY `foreign_key_cod_servico` (`cod_servico`),
  KEY `foreign_key_cod_terceirizado` (`cod_terceirizado`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ordem`
--

INSERT INTO `ordem` (`cod`, `cod_cliente`, `cod_terceirizado`, `cod_servico`, `data_servico`, `status`, `data`) VALUES
(11, 4, 7, 4, '2024-07-17', 3, '2023-05-07'),
(14, 5, 7, 4, '2023-04-14', 3, '2023-04-14'),
(15, 4, 8, 4, '2023-04-28', 1, '2023-05-07'),
(18, 5, 7, 4, '2023-04-14', 3, '2023-04-14'),
(20, 4, 7, 5, '2023-05-07', 2, '2023-05-07'),
(25, 5, 8, 4, '1999-02-01', 1, '2023-05-07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

DROP TABLE IF EXISTS `servico`;
CREATE TABLE IF NOT EXISTS `servico` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`cod`, `nome`, `valor`, `data`) VALUES
(4, 'Lavar Carro', '50', '2022-07-14'),
(5, 'Limpar Piscina', '70', '2022-07-14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `terceirizado`
--

DROP TABLE IF EXISTS `terceirizado`;
CREATE TABLE IF NOT EXISTS `terceirizado` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `perfil` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `terceirizado`
--

INSERT INTO `terceirizado` (`cod`, `nome`, `email`, `telefone`, `senha`, `status`, `perfil`, `data`) VALUES
(7, 'Dalyla Alvarenga ', 'dalylalvarenga@gmail.com', '(35) 99984-9594', 'e10adc3949ba59abbe56e057f20f883e', 1, 3, '2023-05-07'),
(8, 'Maria Aparecida', 'maria@gmail.com', '(35) 99984-9594', 'e10adc3949ba59abbe56e057f20f883e', 1, 3, '2022-07-14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `perfil` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`cod`, `nome`, `senha`, `email`, `perfil`, `status`, `data`) VALUES
(25, 'FÃ¡bio Junior Alves', '202cb962ac59075b964b07152d234b70', 'faguanil@gmail.com', 1, 1, '2023-05-07');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ordem`
--
ALTER TABLE `ordem`
  ADD CONSTRAINT `foreign_key_cod_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod`),
  ADD CONSTRAINT `foreign_key_cod_servico` FOREIGN KEY (`cod_servico`) REFERENCES `servico` (`cod`),
  ADD CONSTRAINT `foreign_key_cod_terceirizado` FOREIGN KEY (`cod_terceirizado`) REFERENCES `terceirizado` (`cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
