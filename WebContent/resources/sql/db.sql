CREATE database disks;

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

CREATE TABLE Disk (
  disk_id int not null PRIMARY KEY unique AUTO_INCREMENT,
  title VARCHAR(50) not null,
  user_id int not null,
  FOREIGN KEY (user_id) references User(user_id)
);

CREATE TABLE TakenItem (
  taken_item_id int not null PRIMARY KEY unique AUTO_INCREMENT,
  user_id int not null,
  disk_id int not null,
  FOREIGN KEY (user_id) references User(user_id),
  FOREIGN KEY (disk_id) references Disk(disk_id)
);


insert into User (login, password, enabled) values ('petr','qwerty', 1);
insert into UserRole (name, role, user_id_fk) values ('Petr','user', 1);
insert into User (login, password, enabled) values ('alex','qwerty', 1);
insert into UserRole (name, role, user_id_fk) values ('alex','user', 2);

insert into Disk (title, user_id) values ('Metallica', 1);
insert into Disk (title, user_id) values ('The Beatles', 2);
insert into TakenItem (user_id, disk_id) values (2,1);
