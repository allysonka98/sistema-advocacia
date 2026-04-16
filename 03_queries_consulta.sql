-- ============================================================
-- SISTEMA DE ADVOCACIA - Queries de Consulta
-- ============================================================

USE sistema_advocacia;

-- ------------------------------------------------------------
-- 1. Listar todos os processos com nome do advogado e cliente
-- ------------------------------------------------------------
SELECT
  p.numero_processo,
  p.titulo,
  p.area_direito,
  p.status,
  p.data_abertura,
  a.nome        AS advogado,
  a.oab,
  c.nome        AS cliente
FROM processos p
JOIN advogados a ON a.id_advogado = p.id_advogado
JOIN clientes  c ON c.id_cliente  = p.id_cliente
ORDER BY p.data_abertura DESC;

-- ------------------------------------------------------------
-- 2. Processos em andamento por advogado
-- ------------------------------------------------------------
SELECT
  a.nome       AS advogado,
  a.especialidade,
  COUNT(p.id_processo) AS total_processos_ativos
FROM advogados a
JOIN processos p ON p.id_advogado = a.id_advogado
WHERE p.status = 'Em andamento'
GROUP BY a.id_advogado, a.nome, a.especialidade
ORDER BY total_processos_ativos DESC;

-- ------------------------------------------------------------
-- 3. Honorários pendentes (em aberto)
-- ------------------------------------------------------------
SELECT
  c.nome            AS cliente,
  p.numero_processo,
  p.titulo,
  h.descricao       AS honorario,
  h.valor,
  h.data_vencimento,
  DATEDIFF(CURDATE(), h.data_vencimento) AS dias_em_atraso
FROM honorarios h
JOIN processos p ON p.id_processo = h.id_processo
JOIN clientes  c ON c.id_cliente  = p.id_cliente
WHERE h.status = 'Pendente'
ORDER BY h.data_vencimento;

-- ------------------------------------------------------------
-- 4. Total arrecadado por advogado (honorários pagos)
-- ------------------------------------------------------------
SELECT
  a.nome            AS advogado,
  COUNT(h.id_honorario) AS qtd_pagamentos,
  SUM(h.valor)      AS total_recebido
FROM honorarios h
JOIN processos  p ON p.id_processo  = h.id_processo
JOIN advogados  a ON a.id_advogado  = p.id_advogado
WHERE h.status = 'Pago'
GROUP BY a.id_advogado, a.nome
ORDER BY total_recebido DESC;

-- ------------------------------------------------------------
-- 5. Próximas audiências agendadas
-- ------------------------------------------------------------
SELECT
  au.data_hora,
  au.local,
  au.tipo                AS tipo_audiencia,
  p.numero_processo,
  p.titulo,
  c.nome                 AS cliente,
  a.nome                 AS advogado
FROM audiencias au
JOIN processos  p  ON p.id_processo  = au.id_processo
JOIN clientes   c  ON c.id_cliente   = p.id_cliente
JOIN advogados  a  ON a.id_advogado  = p.id_advogado
WHERE au.data_hora >= CURDATE()
  AND au.resultado IS NULL
ORDER BY au.data_hora;

-- ------------------------------------------------------------
-- 6. Documentos vinculados a um processo (exemplo: processo 1)
-- ------------------------------------------------------------
SELECT
  d.nome_arquivo,
  d.tipo,
  d.caminho,
  d.enviado_em
FROM documentos d
WHERE d.id_processo = 1
ORDER BY d.enviado_em;

-- ------------------------------------------------------------
-- 7. Processos por área do direito (resumo geral)
-- ------------------------------------------------------------
SELECT
  area_direito,
  COUNT(*)                                             AS total,
  SUM(status = 'Em andamento')                        AS em_andamento,
  SUM(status = 'Encerrado')                           AS encerrados,
  SUM(status IN ('Suspenso', 'Aguardando'))           AS paralisados
FROM processos
GROUP BY area_direito
ORDER BY total DESC;

-- ------------------------------------------------------------
-- 8. Histórico completo de um cliente pelo CPF
-- ------------------------------------------------------------
SELECT
  c.nome            AS cliente,
  c.cpf,
  p.numero_processo,
  p.titulo,
  p.area_direito,
  p.status,
  p.data_abertura,
  a.nome            AS advogado_responsavel
FROM clientes  c
JOIN processos p ON p.id_cliente  = c.id_cliente
JOIN advogados a ON a.id_advogado = p.id_advogado
WHERE c.cpf = '12345678901'   -- substitua pelo CPF desejado
ORDER BY p.data_abertura DESC;
