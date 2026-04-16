-- ============================================================
-- SISTEMA DE ADVOCACIA - Script de Criação do Banco de Dados
-- Banco: MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS sistema_advocacia
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE sistema_advocacia;

-- ------------------------------------------------------------
-- TABELA: advogados
-- ------------------------------------------------------------
CREATE TABLE advogados (
  id_advogado   INT           NOT NULL AUTO_INCREMENT,
  nome          VARCHAR(100)  NOT NULL,
  oab           VARCHAR(20)   NOT NULL UNIQUE,
  email         VARCHAR(100)  NOT NULL UNIQUE,
  telefone      VARCHAR(20),
  especialidade VARCHAR(60),
  ativo         TINYINT(1)    NOT NULL DEFAULT 1,
  criado_em     DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_advogado)
);

-- ------------------------------------------------------------
-- TABELA: clientes
-- ------------------------------------------------------------
CREATE TABLE clientes (
  id_cliente  INT           NOT NULL AUTO_INCREMENT,
  nome        VARCHAR(100)  NOT NULL,
  cpf         CHAR(11)      NOT NULL UNIQUE,
  email       VARCHAR(100),
  telefone    VARCHAR(20),
  endereco    VARCHAR(200),
  criado_em   DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_cliente)
);

-- ------------------------------------------------------------
-- TABELA: processos
-- ------------------------------------------------------------
CREATE TABLE processos (
  id_processo     INT           NOT NULL AUTO_INCREMENT,
  numero_processo VARCHAR(25)   NOT NULL UNIQUE,       -- ex: 1234567-89.2024.8.26.0001
  titulo          VARCHAR(150)  NOT NULL,
  descricao       TEXT,
  area_direito    VARCHAR(60),                         -- Cível, Trabalhista, Criminal...
  status          ENUM('Em andamento','Encerrado','Suspenso','Aguardando') NOT NULL DEFAULT 'Aguardando',
  data_abertura   DATE          NOT NULL,
  data_encerramento DATE,
  id_advogado     INT           NOT NULL,
  id_cliente      INT           NOT NULL,
  criado_em       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_processo),
  CONSTRAINT fk_processo_advogado FOREIGN KEY (id_advogado) REFERENCES advogados (id_advogado),
  CONSTRAINT fk_processo_cliente  FOREIGN KEY (id_cliente)  REFERENCES clientes   (id_cliente)
);

-- ------------------------------------------------------------
-- TABELA: audiencias
-- ------------------------------------------------------------
CREATE TABLE audiencias (
  id_audiencia  INT           NOT NULL AUTO_INCREMENT,
  id_processo   INT           NOT NULL,
  data_hora     DATETIME      NOT NULL,
  local         VARCHAR(150),
  tipo          VARCHAR(60),                           -- Instrução, Conciliação, Julgamento...
  resultado     TEXT,
  PRIMARY KEY (id_audiencia),
  CONSTRAINT fk_audiencia_processo FOREIGN KEY (id_processo) REFERENCES processos (id_processo)
);

-- ------------------------------------------------------------
-- TABELA: documentos
-- ------------------------------------------------------------
CREATE TABLE documentos (
  id_documento  INT           NOT NULL AUTO_INCREMENT,
  id_processo   INT           NOT NULL,
  nome_arquivo  VARCHAR(150)  NOT NULL,
  tipo          VARCHAR(60),                           -- Petição, Contrato, Procuração...
  caminho       VARCHAR(255),
  enviado_em    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_documento),
  CONSTRAINT fk_documento_processo FOREIGN KEY (id_processo) REFERENCES processos (id_processo)
);

-- ------------------------------------------------------------
-- TABELA: honorarios
-- ------------------------------------------------------------
CREATE TABLE honorarios (
  id_honorario  INT             NOT NULL AUTO_INCREMENT,
  id_processo   INT             NOT NULL,
  descricao     VARCHAR(200)    NOT NULL,
  valor         DECIMAL(10, 2)  NOT NULL,
  data_vencimento DATE          NOT NULL,
  data_pagamento  DATE,
  status        ENUM('Pendente','Pago','Cancelado') NOT NULL DEFAULT 'Pendente',
  PRIMARY KEY (id_honorario),
  CONSTRAINT fk_honorario_processo FOREIGN KEY (id_processo) REFERENCES processos (id_processo)
);
