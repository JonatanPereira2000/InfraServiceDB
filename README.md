📦 InfraServiceDB - Estrutura do Banco de Dados

📘 Visão Geral

Durante meus estudos, tive contato com um modelo de banco de dados desenvolvido por um colega da faculdade. Achei tão interessante e bem estruturado que resolvi estudar mais a fundo, adaptar para um cenário realista de serviços de infraestrutura de TI e aplicar com um novo nome: InfraServiceDB.

📂 Tabelas e Suas Funções

🏢 EMPRESAS_CLIENTE
Armazena dados das empresas clientes:

ID_Empresa: Identificador único.
Nome, CNPJ, Razao_Social: Dados da empresa.

👷 TECNICOS
Armazena os técnicos que prestam suporte:

ID_Tecnico, Nome, Telefone, Email.

🏬 SETORES
Setores dentro das empresas clientes:

ID_Setor, Nome, Email, Centro_custo, Ramal.

🆘 CHAMADOS
Gerencia os chamados abertos pelas empresas:

Contém descrição, status, data de resolução e referências à empresa, setor e técnico.

🔗 TECNICO_SETOR
Relacionamento muitos para muitos entre técnicos e setores.

📋 CHECKLIST
Registros de checklists feitos durante visitas ou manutenções:

Data, observações e empresa associada

TECNICOS_CHECKLIST
Relaciona técnicos com os checklists realizados.

🔧 SERVICOS
Lista de serviços disponíveis para contratação.

📑 SERVICO_EMPRESA
Histórico de serviços prestados para as empresas:

Com status, valor, data, técnico e checklist vinculado.

📜 CONTRATOS
Gerencia os contratos firmados com empresas:

Datas de início e fim, e empresa associada.

📄 SERVICOS_CONTRATADOS
Relaciona contratos com os serviços contratados.

🏠 ENDERECO
Endereço das empresas clientes:

Rua, bairro, UF e complemento.

🚚 FORNECEDORES
Cadastro de fornecedores de produtos e equipamentos:

Nome, CNPJ e ramo de atuação.

COMPRAS_FORNECEDOR
Registra as compras feitas com fornecedores:

Data, valor total e fornecedor relacionado.

📦 ITENS_FORNECEDOR
Itens comprados dos fornecedores:

Nome, quantidade e valor total.

ESTOQUE
Controle do estoque dos itens comprados:

Quantidade disponível, data da última compra e item vinculado.

🔒 Integridade Referencial

O banco utiliza chaves estrangeiras para manter a integridade dos relacionamentos, como: 

Técnicos e setores.
Chamados com empresas, setores e técnicos.
Serviços com empresas e técnicos.
Contratos e serviços contratados.
Compras, itens e estoque relacionados a fornecedores.

✅ Regras de Negócio

Os e-mails de técnicos e setores são únicos.
O status de serviços segue um conjunto limitado de valores (Aberto, Resolvido, Em Analise, cancelado).
Os relacionamentos muitos-para-muitos são tratados com tabelas intermediárias.

