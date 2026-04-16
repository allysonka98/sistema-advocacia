-- ============================================================
-- SISTEMA DE ADVOCACIA - Dados de Exemplo
-- ============================================================

USE sistema_advocacia;

-- ------------------------------------------------------------
-- Advogados
-- ------------------------------------------------------------
INSERT INTO advogados (nome, oab, email, telefone, especialidade) VALUES
  ('Fernanda Costa',    'SP123456', 'fernanda@escritorio.adv.br', '(11) 91111-1111', 'Direito de Família'),
  ('Ricardo Almeida',   'SP789012', 'ricardo@escritorio.adv.br',  '(11) 92222-2222', 'Direito Trabalhista'),
  ('Camila Rodrigues',  'SP345678', 'camila@escritorio.adv.br',   '(11) 93333-3333', 'Direito Criminal'),
  ('Bruno Mendes',      'SP901234', 'bruno@escritorio.adv.br',    '(11) 94444-4444', 'Direito Civil'),
  ('Ana Paula Lima',    'SP567890', 'anapaula@escritorio.adv.br', '(11) 95555-5555', 'Direito do Consumidor');

-- ------------------------------------------------------------
-- Clientes
-- ------------------------------------------------------------
INSERT INTO clientes (nome, cpf, email, telefone, endereco) VALUES
  ('João da Silva',      '12345678901', 'joao.silva@email.com',   '(11) 96666-6666', 'Rua das Flores, 100 - São Paulo/SP'),
  ('Maria Oliveira',     '23456789012', 'maria.oli@email.com',    '(11) 97777-7777', 'Av. Paulista, 500 - São Paulo/SP'),
  ('Carlos Ferreira',    '34567890123', 'carlos.f@email.com',     '(11) 98888-8888', 'Rua Augusta, 200 - São Paulo/SP'),
  ('Luciana Barbosa',    '45678901234', 'lu.barbosa@email.com',   '(11) 99999-9999', 'Al. Santos, 300 - São Paulo/SP'),
  ('Pedro Gonçalves',    '56789012345', 'pedro.g@email.com',      '(11) 90000-0000', 'Rua da Consolação, 400 - São Paulo/SP'),
  ('Tatiana Nascimento', '67890123456', 'tati.nas@email.com',     '(11) 91234-5678', 'Rua Vergueiro, 600 - São Paulo/SP');

-- ------------------------------------------------------------
-- Processos
-- ------------------------------------------------------------
INSERT INTO processos (numero_processo, titulo, descricao, area_direito, status, data_abertura, id_advogado, id_cliente) VALUES
  ('1000001-10.2024.8.26.0001', 'Divórcio Litigioso - Silva x Silva',
   'Ação de divórcio com disputa de guarda dos filhos e partilha de bens.',
   'Direito de Família', 'Em andamento', '2024-01-15', 1, 1),

  ('1000002-20.2024.5.02.0001', 'Reclamação Trabalhista - Oliveira vs. Empresa ABC',
   'Horas extras não pagas, FGTS e verbas rescisórias.',
   'Direito Trabalhista', 'Em andamento', '2024-02-10', 2, 2),

  ('1000003-30.2023.8.26.0001', 'Ação de Indenização por Acidente de Trânsito',
   'Colisão causada por terceiro, com danos materiais e morais.',
   'Direito Civil', 'Encerrado', '2023-08-20', 4, 3),

  ('1000004-40.2024.8.26.0001', 'Ação do Consumidor - Produto com Defeito',
   'Produto adquirido apresentou defeito de fabricação; empresa negou troca.',
   'Direito do Consumidor', 'Aguardando', '2024-05-01', 5, 4),

  ('1000005-50.2024.0.00.0001', 'Defesa Criminal - Processo por Estelionato',
   'Cliente acusado de estelionato; análise de provas em andamento.',
   'Direito Criminal', 'Em andamento', '2024-03-22', 3, 5),

  ('1000006-60.2024.8.26.0001', 'Pensão Alimentícia - Revisão de Valor',
   'Pedido de revisão do valor da pensão por mudança na situação financeira.',
   'Direito de Família', 'Suspenso', '2024-04-10', 1, 6);

-- ------------------------------------------------------------
-- Audiências
-- ------------------------------------------------------------
INSERT INTO audiencias (id_processo, data_hora, local, tipo, resultado) VALUES
  (1, '2024-03-10 09:00:00', '2ª Vara de Família - Foro Central', 'Conciliação',  'Sem acordo. Prosseguimento do processo.'),
  (1, '2024-06-20 14:00:00', '2ª Vara de Família - Foro Central', 'Instrução',    NULL),
  (2, '2024-04-05 10:30:00', '5ª Vara do Trabalho - TRT2',         'Instrução',    'Testemunhas ouvidas. Aguarda sentença.'),
  (3, '2023-11-15 15:00:00', '3ª Vara Cível - Foro Regional',      'Julgamento',   'Sentença favorável. Indenização de R$ 8.500,00 concedida.'),
  (5, '2024-05-18 11:00:00', '1ª Vara Criminal - Foro Central',    'Interrogatório','Cliente interrogado. Defesa apresentada.');

-- ------------------------------------------------------------
-- Documentos
-- ------------------------------------------------------------
INSERT INTO documentos (id_processo, nome_arquivo, tipo, caminho) VALUES
  (1, 'peticao_inicial_divorcio.pdf',  'Petição',      '/docs/processo_1/peticao_inicial_divorcio.pdf'),
  (1, 'procuracao_joao.pdf',           'Procuração',   '/docs/processo_1/procuracao_joao.pdf'),
  (2, 'contrato_trabalho.pdf',         'Contrato',     '/docs/processo_2/contrato_trabalho.pdf'),
  (2, 'calculo_verbas.xlsx',           'Planilha',     '/docs/processo_2/calculo_verbas.xlsx'),
  (3, 'laudo_pericial.pdf',            'Laudo',        '/docs/processo_3/laudo_pericial.pdf'),
  (4, 'nota_fiscal_produto.pdf',       'Nota Fiscal',  '/docs/processo_4/nota_fiscal_produto.pdf'),
  (5, 'boletim_ocorrencia.pdf',        'B.O.',         '/docs/processo_5/boletim_ocorrencia.pdf');

-- ------------------------------------------------------------
-- Honorários
-- ------------------------------------------------------------
INSERT INTO honorarios (id_processo, descricao, valor, data_vencimento, data_pagamento, status) VALUES
  (1, 'Honorários iniciais - Divórcio',         2500.00, '2024-01-20', '2024-01-18', 'Pago'),
  (1, 'Honorários mensais - Fevereiro',          800.00, '2024-02-20', '2024-02-19', 'Pago'),
  (1, 'Honorários mensais - Março',              800.00, '2024-03-20', NULL,         'Pendente'),
  (2, 'Honorários iniciais - Reclamação',       1500.00, '2024-02-15', '2024-02-14', 'Pago'),
  (2, 'Honorários êxito (20% do valor)',        3200.00, '2024-07-01', NULL,         'Pendente'),
  (3, 'Honorários iniciais - Indenização',      1200.00, '2023-08-25', '2023-08-24', 'Pago'),
  (3, 'Honorários êxito (15% da indenização)', 1275.00,  '2023-12-01', '2023-11-30', 'Pago'),
  (4, 'Honorários iniciais - Consumidor',        600.00, '2024-05-10', NULL,         'Pendente'),
  (5, 'Honorários iniciais - Criminal',         3000.00, '2024-03-25', '2024-03-22', 'Pago'),
  (6, 'Honorários iniciais - Pensão',            700.00, '2024-04-15', NULL,         'Pendente');
