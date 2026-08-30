DROP DATABASE IF EXISTS eventos;

CREATE DATABASE eventos;

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

INSERT INTO participante (id_participante, nome, email, telefone)
VALUES
(1, 'João Silva', 'joao@email.com', '11999999999'),
(2, 'Maria Santos', 'maria@email.com', '11988888888'),
(3, 'Carlos Oliveira', 'carlos@email.com', '11977777777'),
(4, 'Yudi Tamashiro', 'yudi@email.com', '11940028922'),
(5, 'Neymar Jr', 'Neymar@email.com', '85910101010'),
(6, 'Lucas Almeida', 'lucas@email.com', '11944444444'),
(7, 'Juliana Ferreira', 'juliana@email.com', '11933333333'),
(8, 'Rafael Martins', 'rafael@email.com', '11922222222'),
(9, 'Peter Parker', 'peter@email.com', '11912345678'),
(10, 'Gabriel Rocha', 'gabriel@email.com', '11911111111');

INSERT INTO evento (id_evento, nome, descricao, data_inicio, data_fim, local)
VALUES
(1, 'Semana de Tecnologia', 'Evento sobre tecnologia e inovação',
'2026-10-10 08:00:00','2026-10-10 18:00:00', 'Centro de Convenções'),
(2, 'Workshop de Banco de Dados', 'Workshop sobre bancos de dados relacionais', 
'2026-10-15 09:00:00', '2026-10-15 17:00:00', 'Laboratório de Informática'),
(3, 'Encontro de Desenvolvimento Web', 'Evento sobre desenvolvimento de aplicações web', 
'2026-10-20 08:00:00', '2026-10-20 17:00:00', 'Auditório Principal'),
(4, 'Feira de Inovação', 'Apresentação de projetos inovadores', '2026-10-25 09:00:00', 
'2026-10-25 18:00:00', 'Pavilhão de Eventos'),
(5, 'Congresso de Programação', 'Congresso sobre linguagens e técnicas de programação', 
'2026-11-05 08:00:00', '2026-11-05 18:00:00', 'Centro Universitário'),
(6, 'Seminário de Segurança da Informação', 'Seminário sobre proteção e segurança de dados', 
'2026-11-10 09:00:00', '2026-11-10 16:00:00', 'Sala de Conferências'),
(7, 'Encontro de Inteligência Artificial', 'Discussões sobre inteligência artificial e suas aplicações', 
'2026-11-15 08:30:00', '2026-11-15 17:30:00', 'Auditório de Tecnologia'),
(8, 'Workshop de Redes', 'Workshop sobre redes de computadores', 
'2026-11-20 09:00:00', '2026-11-20 17:00:00', 'Laboratório de Redes'),
(9, 'Fórum de Tecnologia', 'Debates sobre tendências tecnológicas', 
'2026-11-25 08:00:00', '2026-11-25 18:00:00', 'Centro de Eventos'),
(10, 'Mostra de Projetos', 'Exposição de projetos acadêmicos e tecnológicos', 
'2026-12-05 09:00:00', '2026-12-05 17:00:00', 'Pavilhão Universitário');

INSERT INTO palestra
(id_palestra, titulo, descricao, palestrante, data, horario, id_evento)
VALUES
(1, 'Introdução a Banco de Dados', 'Conceitos básicos de bancos de dados', 
'Kaio J A Gurgel', '2026-10-10', '09:00:00', 1),
(2, 'Tecnologia e Inovação', 'Novas tecnologias no mercado', 
'ALISSON SAMPAIO DE CARVALHO ALENCAR', '2026-10-10', '14:00:00', 1),
(3, 'Modelagem de Dados', 'Conceitos de DER e modelagem', 
'Kaio J A Gurgel', '2026-10-15', '10:00:00', 2),
(4, 'Desenvolvimento Front-End', 'HTML, CSS e JavaScript para aplicações web', 
'Kaio J A Gurgel', '2026-10-20', '09:00:00', 3),
(5, 'Projetos Inovadores', 'Apresentação e desenvolvimento de projetos inovadores', 
'Kaio J A Gurgel', '2026-10-25', '11:00:00', 4),
(6, 'Boas Práticas de Programação', 'Técnicas e boas práticas para desenvolvimento de software', 
'HELTON BEZERRA MOREIRA', '2026-11-05', '10:00:00', 5),
(7, 'Proteção de Dados', 'Conceitos de segurança e proteção de informações', 
'CLEDINARDO BERNARDO LAURENTINO', '2026-11-10', '13:00:00', 6),
(8, 'Introdução à Inteligência Artificial', 'Conceitos e aplicações de inteligência artificial', 
'Kaio J A Gurgel', '2026-11-15', '10:30:00', 7),
(9, 'Redes de Computadores', 'Fundamentos de redes e comunicação de dados', 
'DENILSON CURSINO DE OLIVEIRA', '2026-11-20', '14:00:00', 8),
(10, 'Tendências Tecnológicas', 'Principais tendências da tecnologia para os próximos anos', 
'ALISSON SAMPAIO DE CARVALHO ALENCAR', '2026-11-25', '15:00:00', 9);

INSERT INTO inscricao
(id_inscricao, id_participante, id_palestra, data_inscricao)
VALUES
(1, 1, 1, '2026-08-29 17:00:00'),
(2, 2, 1, '2026-08-29 17:05:00'),
(3, 3, 2, '2026-08-29 17:10:00'),
(4, 1, 3, '2026-08-29 17:15:00'),
(5, 4, 4, '2026-08-29 17:20:00'),
(6, 5, 5, '2026-08-29 17:25:00'),
(7, 6, 6, '2026-08-29 17:30:00'),
(8, 7, 7, '2026-08-29 17:35:00'),
(9, 8, 8, '2026-08-29 17:40:00'),
(10, 9, 9, '2026-08-29 17:45:00');