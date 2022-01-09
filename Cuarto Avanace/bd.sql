create schema bd;
use bd;

create table PACIENTE (
  USUARIO varchar(15) NOT NULL,
  NOMBRE varchar(15) not null,
  APELLIDO varchar(15) not null,
  NUMCEDULA varchar(15) not null,
  FECHANACIMIENTO DATE not null,
  ESTADOCIVIL varchar(15),
  CORREOELECTRONICO varchar(45),
  CONTRASENA VARCHAR(15) not null,
  PRIMARY KEY(USUARIO)
);


CREATE TABLE ESPECIALISTA(
  USUARIO_ESP INT NOT NULL,
  CONTRASENA VARCHAR (20) NOT NULL,
  ESPECIALIDAD VARCHAR (30) NOT NULL,
  DISPURG BOOLEAN NOT NULL,
  NUMERTOTELEFONO VARCHAR(15) NOT NULL,
  CORREO VARCHAR(30) NOT NULL,
  NOMBRE VARCHAR(15) NOT NULL,
  APELLIDO VARCHAR(15) NOT NULL,
  PRIMARY KEY (USUARIO_ESP)
);

CREATE TABLE CITA(
  ID_CITA INT NOT NULL,
  DIAGNOSTICO VARCHAR(500),
  PRECIO INT NOT NULL,
  FECHA_HORA DATETIME NOT NULL,
  ESTADO BOOLEAN NOT NULL,
  USUA VARCHAR(15) NOT NULL,
  USUA_ESP INT NOT NULL,
  PRIMARY KEY (ID_CITA),
  FOREIGN KEY (USUA) REFERENCES PACIENTE(USUARIO),
  FOREIGN KEY (USUA_ESP) REFERENCES ESPECIALISTA(USUARIO_ESP) 
);

CREATE TABLE RESENA(
  ID_RESENA INT NOT NULL,
  COMENTARIO VARCHAR(500),
  CARACTERISTICA INT NOT NULL CHECK (CALIFICACION<=100),
  USU VARCHAR(15) NOT NULL,
  USU_ESP INT NOT NULL,
  ID_CITA INT NOT NULL,
  PRIMARY KEY (ID_RESENA),
  FOREIGN KEY (USU) REFERENCES PACIENTE(USUARIO),
  FOREIGN KEY (USU_ESP) REFERENCES ESPECIALISTA(USUARIO_ESP),
  FOREIGN KEY (ID_CITA) REFERENCES CITA(ID_CITA)
);

CREATE TABLE DIARIO(
  DIARIO_ID INT NOT NULL,
  ID_PACIENTE VARCHAR(15) NOT NULL,
  USUARIO_ESP INT NOT NULL,
  PRIMARY KEY (DIARIO_ID),
  FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(USUARIO),
  FOREIGN KEY (USUARIO_ESP) REFERENCES ESPECIALISTA(USUARIO_ESP)
);

CREATE TABLE EMOCION(
  EMOCION_ID INT NOT NULL,
  EMOCION VARCHAR(20) NOT NULL,
  PRIMARY KEY (EMOCION_ID)
);

CREATE TABLE ENTRADA_DIARIO(
  ENTRADA_ID INT NOT NULL AUTO_INCREMENT,
  FECHAHORA DATETIME NOT NULL,
  NOTA VARCHAR(200) NOT NULL,
  DIARIO_ID INT NOT NULL,
  EMOCION_ID INT NOT NULL,
  PRIMARY KEY (ENTRADA_ID),
  FOREIGN KEY (DIARIO_ID) REFERENCES DIARIO(DIARIO_ID),
  FOREIGN KEY (EMOCION_ID) REFERENCES EMOCION(EMOCION_ID)
);

CREATE TABLE CARACTERISTICA(
  CARACTERISTICA_ID INT NOT NULL,
  CARACTERISTICA VARCHAR(20) NOT NULL,
  USUA VARCHAR(15) NOT NULL,
  PRIMARY KEY (CARACTERISTICA_ID),
  FOREIGN KEY (USUA) REFERENCES PACIENTE(USUARIO)
);

CREATE TABLE ESP_DISPONIBLE(
  HORARIO DATETIME NOT NULL,
  DISPONIBLE BOOLEAN NOT NULL DEFAULT FALSE,
  USUARIO_ESP INT NOT NULL,
  PRIMARY KEY (HORARIO,USUARIO_ESP),
  FOREIGN KEY (USUARIO_ESP) REFERENCES ESPECIALISTA(USUARIO_ESP)
);


