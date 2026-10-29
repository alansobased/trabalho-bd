USE bd_cursos_livres;

ALTER TABLE aluno
ADD COLUMN telefone VARCHAR(20);

ALTER TABLE aluno
MODIFY COLUMN telefone VARCHAR(25);

ALTER TABLE aluno
RENAME COLUMN telefone TO telefone_contato;

ALTER TABLE curso
ADD COLUMN descricao TEXT;

ALTER TABLE curso
ADD COLUMN modalidade VARCHAR(50) NOT NULL DEFAULT "Presencial";

ALTER TABLE curso
ADD CONSTRAINT ck_modalidade CHECK (modalidade IN ("Presencial", "Online", "Hibrido"));

ALTER TABLE turma
ADD COLUMN observacao TEXT;

SELECT * FROM turma;

SHOW TABLES;

DESCRIBE aluno;
DESCRIBE professor;
DESCRIBE curso;
DESCRIBE turma;
DESCRIBE matricula;