USE eventos;

CREATE TABLE participante (
    id_participante INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR(20)
);

CREATE TABLE evento (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    descricao VARCHAR(500),
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME NOT NULL,
    local VARCHAR(200) NOT NULL
);

CREATE TABLE palestra (
    id_palestra INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    descricao VARCHAR(500),
    palestrante VARCHAR(150) NOT NULL,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    id_evento INT NOT NULL,
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

CREATE TABLE inscricao (
    id_inscricao INT PRIMARY KEY AUTO_INCREMENT,
    id_participante INT NOT NULL,
    id_palestra INT NOT NULL,
    data_inscricao DATETIME NOT NULL,
    UNIQUE (id_participante, id_palestra),
    FOREIGN KEY (id_participante) REFERENCES participante(id_participante),
    FOREIGN KEY (id_palestra) REFERENCES palestra(id_palestra)
);