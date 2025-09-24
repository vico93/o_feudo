-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE TABLE tb_nivel (
pk_codnivel INTEGER PRIMARY KEY,
nome TEXT UNIQUE NOT NULL
);

CREATE TABLE tb_skin (
pk_skinid INTEGER PRIMARY KEY,
descricao TEXT NOT NULL,
fk_codnivel INTEGER NOT NULL,

FOREIGN KEY(fk_codnivel) REFERENCES tb_nivel (pk_codnivel)
);

CREATE TABLE tb_jogador (
pk_codjogador INTEGER PRIMARY KEY,
nome TEXT UNIQUE NOT NULL,
senha TEXT NOT NULL,
fk_codnivel INTEGER NOT NULL,
dinheiro INTEGER DEFAULT 0,
fk_skinid INTEGER NOT NULL,
score INTEGER DEFAULT 0,
spawn_x REAL,
spawn_y REAL,
spawn_z REAL,
spawn_interior INTEGER,

FOREIGN KEY(fk_codnivel) REFERENCES tb_nivel (pk_codnivel),
FOREIGN KEY(fk_skinid) REFERENCES tb_skin (pk_skinid)
);

CREATE TABLE tb_propriedade (
pk_codpropriedade INTEGER PRIMARY KEY,
posx REAL NOT NULL,
posy REAL NOT NULL,
posz REAL NOT NULL,
preco INTEGER NOT NULL,
ganhos INTEGER NOT NULL,
cooldown INTEGER DEFAULT 15,
fk_codjogador INTEGER,

FOREIGN KEY(fk_codjogador) REFERENCES tb_jogador (pk_codjogador)
);

