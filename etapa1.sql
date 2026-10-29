CREATE DATABASE bd_cursos_livres
CHARACTER SET utf8mb4;

USE bd_cursos_livres;

CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL
);

CREATE TABLE instrutor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    especializacao VARCHAR(150) NOT NULL
);

CREATE TABLE curso (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    carga_horaria INT NOT NULL,
    valor FLOAT(10,2) NOT NULL,
    
    CONSTRAINT ck_carga_horaria CHECK (carga_horaria > 0),
    CONSTRAINT ck_valor CHECK (valor >= 0)
);

CREATE TABLE turma (
	id INT PRIMARY KEY AUTO_INCREMENT,
    vagas_maximas INT NOT NULL,
    data_inicio DATE NOT NULL,
    id_instrutor INT NOT NULL,
    id_curso INT NOT NULL,
    
    CONSTRAINT fk_turma_instrutor FOREIGN KEY (id_instrutor) REFERENCES instrutor(id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_turma_curso FOREIGN KEY (id_curso) REFERENCES curso(id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE,
    
	CONSTRAINT ck_vagas_maximas CHECK (vagas_maximas > 0)
);

CREATE TABLE matricula (
	id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE NOT NULL DEFAULT (CURRENT_DATE),
    situacao VARCHAR(50) NOT NULL DEFAULT "Ativa",
    
    CONSTRAINT pk_aluno_turma PRIMARY KEY (id_aluno, id_turma),
    
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_matricula_turma FOREIGN KEY (id_turma) REFERENCES turma(id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE,
        
	CONSTRAINT ck_situacao CHECK (situacao IN ("Ativa", "Cancelada", "Concluida")) 
);