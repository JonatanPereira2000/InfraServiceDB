CREATE DATABASE InfraServiceDB;
USE InfraServiceDB;

CREATE TABLE EMPRESAS_CLIENTE(
    ID_Empresa INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (100) NOT NULL,
    CNPJ VARCHAR(14) NOT NULL,
    Razao_Social VARCHAR(50) NOT NULL
);

CREATE TABLE TECNICOS(
    ID_Tecnico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE SETORES(
    ID_Setor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Centro_custo INT NOT NULL,
    Ramal INT NOT NULL
);

CREATE TABLE CHAMADOS(
    ID_Chamado INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(200) NOT NULL,
    Status VARCHAR(15) NOT NULL,
    Data_resolucao DATE NULL,
    ID_Empresa INT,
    ID_Setor INT,
    ID_Tecnico INT,
    FOREIGN KEY (ID_Empresa) REFERENCES EMPRESAS_CLIENTE(ID_Empresa),
    FOREIGN KEY (ID_Setor) REFERENCES SETORES(ID_Setor),
    FOREIGN KEY (ID_Tecnico) REFERENCES TECNICOS(ID_Tecnico)
);

CREATE TABLE TECNICO_SETOR(
	ID_Tecnico INT,
	ID_Setor INT,
	PRIMARY KEY (ID_Tecnico,ID_Setor),
	FOREIGN KEY (ID_Setor) REFERENCES SETORES(ID_Setor),
	FOREIGN KEY (ID_Tecnico) REFERENCES TECNICOS(ID_Tecnico)
);


CREATE TABLE CHECKLIST(
    ID_Checklist INT PRIMARY KEY AUTO_INCREMENT,
    Data_Checklist DATE NULL,
    Observacoes VARCHAR(100) NOT NULL,
    ID_Empresa INT,
    FOREIGN KEY (ID_Empresa) REFERENCES EMPRESAS_CLIENTE(ID_Empresa)
);

CREATE TABLE TECNICOS_CHECKLIST(
    ID_Checklist INT,
    ID_Tecnico INT,
    PRIMARY KEY (ID_Checklist,ID_Tecnico),
    FOREIGN KEY (ID_Tecnico) REFERENCES TECNICOS(ID_Tecnico),
    FOREIGN KEY (ID_Checklist) REFERENCES CHECKLIST(ID_Checklist)
);

CREATE TABLE SERVICOS(
    ID_Servico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE SERVICO_EMPRESA(
    ID_Servico_empresa INT PRIMARY KEY AUTO_INCREMENT,
    Valor DECIMAL(10,2),
    Status VARCHAR(20) CHECK (status IN ('Aberto', 'Resolvido', 'Em Analise', 'cancelado')),
    Data_servico DATE,
    ID_Empresa INT,
    ID_Servico INT,
    ID_Tecnico INT,
    ID_Checklist INT,
    FOREIGN KEY (ID_Empresa) REFERENCES EMPRESAS_CLIENTE(ID_Empresa),
    FOREIGN KEY (ID_Servico) REFERENCES SERVICOS(ID_Servico),
    FOREIGN KEY (ID_Tecnico) REFERENCES TECNICOS(ID_Tecnico),
    FOREIGN KEY (ID_Checklist) REFERENCES CHECKLIST(ID_Checklist)
);

CREATE TABLE CONTRATOS(
    ID_Contrato INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Inicio_Contrato DATE NOT NULL,
    Fim_Contrato DATE NOT NULL,
    ID_Empresa INT,
    FOREIGN KEY (ID_Empresa) REFERENCES  EMPRESAS_CLIENTE(ID_Empresa)
);

CREATE TABLE SERVICOS_CONTRATADOS(
    ID_Contrato INT,
    ID_Servico INT,
    PRIMARY KEY (ID_Contrato,ID_Servico),
    FOREIGN KEY (ID_Contrato) REFERENCES CONTRATOS(ID_Contrato),
    FOREIGN KEY (ID_Servico) REFERENCES SERVICOS(ID_Servico)
);

CREATE TABLE ENDERECO(
    ID_Endereco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Bairro VARCHAR(50) NOT NULL,
    Rua VARCHAR (100) NOT NULL,
    UF CHAR(2) NOT NULL,
    Complemento VARCHAR(30) NOT NULL,
    ID_Empresa INT,
    FOREIGN KEY (ID_Empresa) REFERENCES EMPRESAS_CLIENTE(ID_Empresa)
);

CREATE TABLE FORNECEDORES(
    ID_Fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(20) NOT NULL,
    Ramo VARCHAR(50) NOT NULL
);

CREATE TABLE COMPRAS_FORNECEDOR(
    ID_Compra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Data DATE NOT NULL,
    Valor_total DECIMAL(10,2) NOT NULL,
    ID_Fornecedor INT,
    FOREIGN KEY (ID_Fornecedor) REFERENCES FORNECEDORES(ID_Fornecedor)
);

CREATE TABLE ITENS_FORNECEDOR(
    ID_Item INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Quantidade INT,
    Valor_total DECIMAL(10,2) NOT NULL,
    ID_Fornecedor INT,
    FOREIGN KEY (ID_Fornecedor) REFERENCES FORNECEDORES(ID_Fornecedor)
);


CREATE TABLE ESTOQUE(
    ID_Estoque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Quantidade INT NOT NULL,
    Ultima_Compra DATE,
    ID_Item INT,
    FOREIGN KEY (ID_Item) REFERENCES ITENS_FORNECEDOR(ID_Item)
);



