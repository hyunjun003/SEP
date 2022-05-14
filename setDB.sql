drop database if exists sedb; -- if not need, delete it
create database sedb;

use sedb;

create table users(
                      user_id INT NOT NULL AUTO_INCREMENT,
                      user_name VARCHAR(100) NOT NULL,
                      id VARCHAR(50) NOT NULL UNIQUE,
					  pw VARCHAR(64) NOT NULL, -- sha256
                      PRIMARY KEY (user_id)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = DEFAULT CHARACTER SET utf8;

create table managers(
                         manager_id INT NOT NULL AUTO_INCREMENT,
                         manager_name VARCHAR(100) NOT NULL,
                         id VARCHAR(50) NOT NULL UNIQUE,
                         pw VARCHAR(64) NOT NULL, -- sha256
                         PRIMARY KEY (manager_id)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = DEFAULT CHARACTER SET utf8;

create table restaurant_table(
                                 table_id INT NOT NULL,
                                 PRIMARY KEY(table_id)
)ENGINE = InnoDB;

create table reservations(
                             reserv_id INT NOT NULL AUTO_INCREMENT,
							 reserv_user varchar(50) NOT NULL,
							 reserv_userId INT NOT NULL,
                             reserv_date varchar(50) NOT NULL,
                             reserv_time INT NOT NULL,
                             reserv_NOP INT NOT NULL,
                             reserv_table_num INT NOT NULL,
                             r_code INT NOT NULL,
                             -- arriusersved_at TIMESTAMP DEFAULT '0000-00-00 00:00:00',
                             
                             PRIMARY KEY (reserv_id)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = DEFAULT CHARACTER SET utf8;

#users
insert into users value(0, 'ham', '0000',
                        '1111'); -- name : user1, id : 1234, pw : qwer
insert into users value(0, 'ureservationsser2', '5678',
                        'qwer2'); -- name : user2, id : 5678, pw : asdf




#mamangers
insert into managers value(0, 'manager1', 'admin1',
                           '25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7'); -- name : mamanger1, id : admin1, pw : admin1
insert into managers value(0, 'manager2', 'admin2',
                           '1c142b2d01aa34e9a36bde480645a57fd69e14155dacfab5a3f9257b77fdc8d8'); -- name : mamanger2, id : admin2, pw : admin2


 
 
#reservations
insert into  restaurant_table value (1);
insert into  restaurant_table value (2);
insert into  restaurant_table value (3);
insert into  restaurant_table value (4);
insert into  restaurant_table value (5);