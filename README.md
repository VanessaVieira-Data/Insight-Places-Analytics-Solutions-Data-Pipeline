# Insight Places: Analytics Solutions & Data Pipeline 🏠📊
---

### 🌐 Select Language / Selecione o Idioma
[**English Version**](#english-version) | [**Versão em Português**](#versão-em-português)

---

<a name="english-version"></a>
## 🇺🇸 English Version

This project simulates a real data analytics ecosystem for the fictitious company **Insight Places**. The goal is to demonstrate the integration of the most robust tools in the market (SQL, Python, and Power BI) for the processing and visualization of real estate data.

For project management and task organization, I utilize the **Kanban** methodology.

### 🚧 Project Status: In Development
*I have finalized the SQL stage and I am currently starting the ETL process in Python.*

### 🛠️ What has been implemented so far (SQL Layer):
* **Data Architecture:** Structuring and altering tables using `ALTER TABLE`.
* **DML (Data Manipulation Language):** Complex record updates and advanced filtering.
* **Data Analysis:** Development of scripts for customer behavior and owner performance analysis, focusing on generating business value.
* **Security & Integrity:** Backup routines (Dumps) and dependency investigation (Foreign Keys) to ensure data health.
* **Evolutionary Maintenance:** Strategic record deletion (`DELETE`) respecting the Parent-Child hierarchy.
* **⚙️ Data Integration & ETL (Python Layer - Part 1):**

- Robust Infrastructure: Established a secure connection between Python and MySQL using SQLAlchemy and PyMySQL.

- Data Wrangling: Comprehensive processing of 6 datasets, ensuring data type consistency and correct mapping from Portuguese to English.

- Relational Migration: Successful upload of 9,983 records across 6 relational tables, ensuring that special characters and line breaks (\n) were correctly interpreted by the database engine.

- Security & Connectivity: Implementation of database engine management and final backup routines.
### 🔍 Next Steps:

#### 🐍 Python Stage (Processing & Automation)
- [ ] Development of an automated pipeline to refresh data without manual intervention.

#### 📊 Power BI Stage (Strategic Insights)
- [ ] Data modeling (Star Schema).
- [ ] Creation of an interactive Dashboard with revenue and occupancy KPIs.

---

<a name="versão-em-português"></a>
## 🇧🇷 Versão em Português

Este projeto simula um ecossistema real de análise de dados para a empresa fictícia **Insight Places**. O objetivo é demonstrar a integração das ferramentas mais robustas do mercado (SQL, Python e Power BI) no tratamento e visualização de dados imobiliários. 

Para a gestão e organização das tarefas, utilizo a metodologia **Kanban**.

## 🚧 Status do Projeto: Em Desenvolvimento
*Finalizei a etapa SQL e atualmente estou iniciando o processo de ETL no Python.*

## 🛠️ O que foi implementado até agora (Camada SQL):
* **Arquitetura de Dados:** Estruturação e alteração de tabelas com `ALTER TABLE`.
* **DML (Data Manipulation Language):** Atualização de registros complexos e filtros avançados.
* **Análise de Dados:** Desenvolvimento de scripts para análise de comportamento de clientes e performance de proprietários, focando em geração de valor para o negócio.
* **Segurança e Integridade:** Rotinas de Backup (Dumps) e investigação de dependências (Foreign Keys) para garantir a saúde dos dados.
* **Manutenção Evolutiva:** Exclusão estratégica de registros (`DELETE`) respeitando a hierarquia Pai-Filho.
* **⚙️ Integração de Dados e ETL (Camada Python - Parte 1):**

- Infraestrutura Robusta: Estabeleci uma conexão segura entre Python e MySQL utilizando SQLAlchemy e PyMySQL.

- Data Wrangling: Processamento completo de 6 datasets brutos, garantindo a consistência dos tipos de dados e o mapeamento correto de português para inglês.

- Migração Relacional: Carga de 9.983 registros distribuídos em 6 tabelas relacionais, garantindo que caracteres especiais e quebras de linha (\n) fossem corretamente interpretados pelo motor do banco de dados.

- Segurança e Conectividade: Implementação de gestão de engine e rotinas de backup final.
## 🔍 Próximos Passos:

### 🐍 Etapa Python (Tratamento e Automação)
- [ ] Desenvolvimento de um pipeline automatizado para atualização de dados sem intervenção manual.

### 📊 Etapa Power BI (Insights Estratégicos)
- [ ] Modelagem de dados (Star Schema).
- [ ] Criação de Dashboard interativo com KPIs de faturamento e ocupação.

