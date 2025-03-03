-- Este script cria as tabelas do diagrama ER incluído na pasta modelagem
CREATE TABLE `atribuicaoonu` (
`CodAtribuicao` int DEFAULT NULL,
`Atribuicao` text DEFAULT NULL,
PRIMARY KEY (`CodAtribuicao`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `agenciaonu` (
`CodAgencia` int NOT NULL,
`Descricao` text DEFAULT NULL,
`CodAtribuicao` int DEFAULT NULL,
PRIMARY KEY (`CodAgencia`),
FOREIGN KEY (`CodAtribuicao`) REFERENCES atribuicaoonu(`CodAtribuicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `status` (
`NomeStatus` ENUM('suspenso', 'cancelado', 'fechado', 'finalização', 'Implementação',
'pipeline') DEFAULT 'pipeline' NOT NULL UNIQUE,
`DescStatus` text DEFAULT NULL,
PRIMARY KEY (`NomeStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `prioridadeonu` (
`CodPrioridade` int NOT NULL,
`DescPrioridade` text DEFAULT NULL,
`ResultEsperado` text DEFAULT NULL,
PRIMARY KEY (`CodPrioridade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `LocalNivel1` (
`CodLocalN1` int NOT NULL,
`NomeLocalN1` varchar(20) DEFAULT NULL,
PRIMARY KEY (`CodLocalN1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `LocalNivel2` (
`CodLocalN2` int NOT NULL,
`NomeLocalN2` varchar(20) DEFAULT NULL,
PRIMARY KEY (`CodLocalN2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `ods` (
`CodODS` int NOT NULL,
`DescODS` text DEFAULT NULL,
PRIMARY KEY (`CodODS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `atividade_chave` (
`CodAtivChave` int NOT NULL,
`Descricao` text DEFAULT NULL,
`DataInicio` datetime DEFAULT NULL,
`DataFim` datetime DEFAULT NULL,
`NomeStatus` ENUM('suspenso', 'cancelado', 'fechado', 'finalização', 'Implementação',
'pipeline') DEFAULT 'pipeline' NOT NULL,
`CodAgencia` int NOT NULL,
`DataFinan` datetime DEFAULT NULL,
`ValorFinan` decimal(10,2) DEFAULT NULL,
PRIMARY KEY (`CodAtivChave`),
FOREIGN KEY (CodAgencia) REFERENCES agenciaonu(CodAgencia),
FOREIGN KEY (NomeStatus) REFERENCES `status`(NomeStatus)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Parceiro_financ` (
`CodParceiroFinan` int NOT NULL,
`NomeParceiroFinan` varchar(60),
PRIMARY KEY (`CodParceiroFinan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Parceiro_Implem` (
`CodParceiroImplem` int NOT NULL PRIMARY KEY,
`NomeParceiroImplem` varchar(60)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `ContatosN1` (
`CodLocalN1` int NOT NULL,
`Cod` int NOT NULL PRIMARY KEY,
`Nome` varchar(40),
`Telefone` varchar(20) NOT NULL,
`Celular` varchar(20),
`Email` varchar(40) NOT NULL,
CONSTRAINT `fk_CodLocalN1_ContatosN1`
FOREIGN KEY (`CodLocalN1`) REFERENCES localnivel1(`CodLocalN1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `ContatosN2` (
`CodLocalN2` int NOT NULL,
`Cod` int NOT NULL PRIMARY KEY,
`Nome` varchar(40),
`Telefone` varchar(20) NOT NULL,
`Celular` varchar(20),
`Email` varchar(40) NOT NULL,
CONSTRAINT `fk_CodLocalN2_ContatosN2`
FOREIGN KEY (`CodLocalN2`) REFERENCES localnivel2(`CodLocalN2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `AtendePrioridade` (
`CodAtivChave` int NOT NULL,
`CodPrioridade` int NOT NULL,
CONSTRAINT `fk_CodAtivChave_AtendePrioridade`
FOREIGN KEY (`CodAtivChave`) REFERENCES atividade_chave (`CodAtivChave`),
CONSTRAINT `fk_CodPrioridade_AtendePrioridade`
FOREIGN KEY (`CodPrioridade`) REFERENCES prioridadeonu (`CodPrioridade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `LocalizacaoN1` (
`CodAtivChave` int NOT NULL,
`CodLocalN1` int NOT NULL,
CONSTRAINT `fk_CodAtivChave_LocalizacaoN1`
FOREIGN KEY (`CodAtivChave`) REFERENCES atividade_chave (`CodAtivChave`),
CONSTRAINT `fk_CodLocalN1_LocalizacaoN1`
FOREIGN KEY (`CodLocalN1`) REFERENCES localnivel1 (`CodLocalN1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `LocalizacaoN2` (
`CodAtivChave` int NOT NULL,
`CodLocalN2` int NOT NULL,
CONSTRAINT `fk_CodAtivChave_LocalizacaoN2`
FOREIGN KEY (`CodAtivChave`) REFERENCES atividade_chave (`CodAtivChave`),
CONSTRAINT `fk_CodLocalN2_LocalizacaoN2`
FOREIGN KEY (`CodLocalN2`) REFERENCES localnivel2 (`CodLocalN2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Atende_ods` (
`CodAtivChave` int NOT NULL,
`CodODS` int NOT NULL,
CONSTRAINT `fk_CodAtivChave_Atende_ods`
FOREIGN KEY (`CodAtivChave`) REFERENCES atividade_chave (`CodAtivChave`),
CONSTRAINT `fk_CodODS_Atende_ods`
FOREIGN KEY (`CodODS`) REFERENCES ods (`CodODS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Suporta` (
`CodAtivChave` int NOT NULL,
`CodParceiroImplem` int NOT NULL,
CONSTRAINT `fk_CodAtivChave_Suporta`
FOREIGN KEY (`CodAtivChave`) REFERENCES atividade_chave (`CodAtivChave`),
CONSTRAINT `fk_CodParceiroImplem_Suporta`
FOREIGN KEY (`CodParceiroImplem`) REFERENCES Parceiro_Implem
(`CodParceiroImplem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Doa` (
`CodAgencia` int NOT NULL,
`CodParceiroFinan` int NOT NULL,
`Data` date NOT NULL,
`ValorDoado` int NOT NULL,
CONSTRAINT `fk_CodAgencia_Doa`
FOREIGN KEY (`CodAgencia`) REFERENCES agenciaonu (`CodAgencia`),
CONSTRAINT `fk_CodParceiroFinan_Doa`
FOREIGN KEY (`CodParceiroFinan`) REFERENCES parceiro_financ
(`CodParceiroFinan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
