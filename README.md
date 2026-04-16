# 🏛️ Sistema de Advocacia — Banco de Dados MySQL

Projeto de banco de dados relacional para gerenciamento de um escritório de advocacia.  
Desenvolvido como projeto de estudo de SQL com MySQL.

---

## 📋 Sobre o Projeto

Este projeto modela as principais entidades de um escritório de advocacia:
- Cadastro de **advogados** e seus dados profissionais (OAB, especialidade)
- Cadastro de **clientes** com CPF e contato
- Controle de **processos jurídicos** com status, área do direito e vínculos
- Agendamento de **audiências** por processo
- Armazenamento de **documentos** vinculados
- Controle de **honorários** (pagos e pendentes)

---

## 🗂️ Estrutura dos Arquivos

```
sistema-advocacia/
├── 01_criar_banco.sql     # Criação do banco e tabelas (DDL)
├── 02_dados_exemplo.sql   # Inserção de dados de teste (DML)
├── 03_queries_consulta.sql# Consultas SQL prontas
└── README.md              # Este arquivo
```

---

## 🗃️ Diagrama das Tabelas

```
advogados ──────────┐
                    │ 1:N
clientes ───────────┼──── processos ──── audiencias
                         │
                         ├──────────── documentos
                         │
                         └──────────── honorarios
```

### Tabelas e principais campos

| Tabela       | Campos principais                                              |
|--------------|----------------------------------------------------------------|
| `advogados`  | id, nome, oab, email, especialidade, ativo                    |
| `clientes`   | id, nome, cpf, email, telefone, endereco                      |
| `processos`  | id, numero_processo, titulo, area_direito, status, datas      |
| `audiencias` | id, id_processo, data_hora, local, tipo, resultado            |
| `documentos` | id, id_processo, nome_arquivo, tipo, caminho                  |
| `honorarios` | id, id_processo, descricao, valor, data_vencimento, status    |

---

## 🚀 Como Executar

### Pré-requisitos
- [MySQL](https://dev.mysql.com/downloads/) 8.0 ou superior instalado

### Passo a passo

```bash
# 1. Acesse o MySQL no terminal
mysql -u root -p

# 2. Execute os scripts em ordem
source /caminho/para/01_criar_banco.sql
source /caminho/para/02_dados_exemplo.sql
source /caminho/para/03_queries_consulta.sql
```

Ou importe diretamente pelo **MySQL Workbench**:
`File → Open SQL Script → Execute (⚡)`

---

## 🔍 Consultas Disponíveis

| # | Query | Descrição |
|---|-------|-----------|
| 1 | Processos com advogado e cliente | Visão geral de todos os processos |
| 2 | Processos ativos por advogado | Carga de trabalho da equipe |
| 3 | Honorários pendentes | Contas a receber com dias de atraso |
| 4 | Total arrecadado por advogado | Faturamento por profissional |
| 5 | Próximas audiências | Agenda de audiências sem resultado |
| 6 | Documentos por processo | Arquivos de um processo específico |
| 7 | Resumo por área do direito | Distribuição dos processos |
| 8 | Histórico de um cliente | Busca por CPF do cliente |

---

## 💡 Conceitos Aplicados

- `CREATE DATABASE` / `CREATE TABLE`
- Chaves primárias (`PRIMARY KEY`) e estrangeiras (`FOREIGN KEY`)
- Tipos de dados: `VARCHAR`, `CHAR`, `TEXT`, `DECIMAL`, `DATE`, `DATETIME`, `ENUM`, `TINYINT`
- Constraints: `NOT NULL`, `UNIQUE`, `DEFAULT`
- `INSERT INTO` com múltiplos registros
- `SELECT` com `JOIN` (INNER JOIN)
- Funções de agregação: `COUNT`, `SUM`
- Agrupamento: `GROUP BY`, `ORDER BY`
- Filtros: `WHERE`, `HAVING`
- Funções de data: `CURDATE()`, `DATEDIFF()`

---

## 👨‍💻 Autor

Feito como projeto de estudo de SQL.  
Sinta-se livre para clonar, adaptar e usar como referência!

---

## 📄 Licença

Distribuído sob a licença MIT. Veja `LICENSE` para mais informações.
