create database BD_Faculdade;
use BD_Faculdade;

create table Aluno(
	matricula int not null primary key auto_increment,
    nome varchar(45) not null,
    email varchar(45) not null, 
    data_nasc date not null,
    endereco varchar(45),
    FK_Turmas int,
    FK_Curso int,
    FK_Notas int,
    
	constraint foreign key (fK_Turmas) references Turmas (id_turmas),
	constraint foreign key (fK_Curso) references Curso (id_curso),
    constraint foreign key (FK_Notas) references Notas (id_notas)

);


create table Turmas(
	id_turmas int not null primary key auto_increment,
    ano int,
    semestre int

);

create table Curso(
	id_curso int not null primary key auto_increment,
    nome varchar(45) not null,
    carga_horaria int not null,
    descricao varchar(60),
    FK_Professor int,
    FK_Disciplinas int,
    
    constraint foreign key (FK_Professor) references Professor (CFEP),
    constraint foreign key (FK_Disciplinas) references Disciplinas (id_disciplina)

);

create table Professor(
	CFEP int not null primary key auto_increment,
    nome varchar(45) not null,
    data_nasc date not null,
    email varchar(45),
    endereco varchar(45)

);

create table Disciplinas(
	id_disciplina int not null primary key auto_increment,
    nome varchar(45) not null,
    carga_horaria int not null,
    descricao varchar(60),
	FK_Professor int,
    
    constraint foreign key (FK_Professor) references Professor (CFEP)

);

create table Notas(
	id_notas int not null primary key auto_increment,
    notas int not null,
    data_lancamento date

);

alter table Curso add modalidade varchar(15);
alter table Curso add unidade varchar(45);
alter table Curso change carga_horaria carga_horaria float not null;
alter table Turmas add nome varchar(45);

insert into Curso 
(nome, carga_horaria, descricao, FK_Professor, FK_Disciplinas, modalidade, unidade)
values
('Arquitetura e Urbanismo', '3.600', 'Aprenda a criar projetos residenciais e comerciais incríveis',
 '1', '5', 'Presencial', 'São Paulo'),
 ('Gestão da Qualidade', '1.600', 'Aprenda a gerenciar os processos de qualidade industriais', 
 '2', '6',  'Presencial', 'Sorocaba'),
  ('Gestão da Qualidade', '1.600', 'Aprenda a gerenciar os processos de qualidade industriais', 
 '3', '7', 'EAD', 'Jundiai'),
 ('Administração', '1.000', 'Aprenda a gerenciar empresas e negocios de forma eficiente', 
 '4', '8', 'EAD', 'Jundiai');
 
 insert into Professor 
 (nome, data_nasc, email, endereco)
 values
 ('Marta', '1975-03-21', 'martaprofessora@gmail.com', 'São Paulo'),
 ('Fabricio', '1970-12-10', 'fabriciomoraes@gmail.com', 'Sorocaba'),
 ('Marcos', '1978-10-10', 'marquinhos@gmail.com', 'Jundiai'),
 ('Ana Cristina', '1990-07-10', 'anaprofessora@gmail.com', 'Jundiai');
 
 insert into Disciplinas
 (nome, carga_horaria, descricao, FK_Professor)
 values
 ('História da Arq e Urb', '60', 'Conheca a historia, e crie um design incrivel',
 '1'),
 ('Métodos Ágeis', '40', 'Pratique metodos ágeis e ganhe melhor qualidade', 
 '2'),
 ('Qualidade Industrial II', '60', 'Veja as principais práticas para garantir a qualidade',
 '3'),
 ('Grandes Empresas, Pequenos Negócios III', '80', 'Conheca grandes empresas, gerencie pequenos negocios',
 '4');
 
 insert into Notas
 (notas, data_lancamento)
 values
 ('8', '2024-10-01'),
 ('8', '2024-10-01'),
 ('9', '2024-09-01'),
 ('9', '2024-09-01');

insert into Turmas
(ano, semestre, nome)
values
('2024', 2, 'Turma A'),
('2023', 4, 'Turma B'),
('2022', 6, 'Turma C'),
('2022', 6, 'Turma D');


insert into Aluno
(nome, email, data_nasc, endereco, FK_Turmas, FK_Curso, FK_Notas)
values
('Leonardo', 'leo123@gmail.com', '2005-09-16', 'Sao Paulo', '1', '17', '1'),
('Gustavo', 'guuh321@gmail.com', '2001-09-28', 'Sao Paulo', '2', '18', '2'),
('Almir', 'almir456@gmail.com', '1972-05-23', 'Sao Paulo', '3', '19', '3'),
('Alessandra', 'sandra654@gmail.com', '1980-08-31', 'São Paulo', '4', '20', '4');

alter table Curso change nome curso varchar(45);

select * from Turmas;
select * from Aluno;
select * from Professor;
select * from Cursos;

select Aluno.nome, Curso.curso, Turmas.semestre from Aluno 
inner join Turmas on Aluno.FK_Turmas = Turmas.id_turmas Inner join Curso on Aluno.FK_Curso = id_curso; 

