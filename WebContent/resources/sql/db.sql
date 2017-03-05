CREATE database socialappsearcher;

CREATE TABLE UserRole (
  user_id int not null PRIMARY KEY unique AUTO_INCREMENT,
  name VARCHAR(50) not null,
  role VARCHAR(50) not null,
  user_id_fk int not null,
  FOREIGN KEY (user_id_fk) references User(user_id)
);

CREATE TABLE User (
  user_id int not null PRIMARY KEY unique AUTO_INCREMENT,
  login VARCHAR(50) not null,
  password VARCHAR(50) not null,
  enabled TINYINT NOT NULL DEFAULT 1
);

CREATE TABLE SocialPerson (
  id int not null PRIMARY KEY unique AUTO_INCREMENT,
  last_name VARCHAR(50) not null,
  first_name VARCHAR(50) not null,
  middle_name VARCHAR(50) null,
  gender VARCHAR(20) null,
  birthday VARCHAR(50) null,
  political VARCHAR(50) null,
  about VARCHAR(50) null,
  religion VARCHAR(50) null,
  work VARCHAR(50) null,
  user_id int not null,
  FOREIGN KEY (user_id) references User(user_id)
);

CREATE TABLE SocialPersonGroup (
  id int not null PRIMARY KEY unique AUTO_INCREMENT,
  user_id int not null,
  social_person_id int not null,
  FOREIGN KEY (user_id) references User(user_id),
  FOREIGN KEY (social_person_id) references SocialPerson(id)
);


insert into User (login, password, enabled) values ('petr','qwerty', 1);
insert into UserRole (name, role, user_id_fk) values ('Petr','user', 1);
insert into User (login, password, enabled) values ('alex','qwerty', 1);
insert into UserRole (name, role, user_id_fk) values ('alex','user', 2);
