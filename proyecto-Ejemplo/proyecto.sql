



CREATE TABLE users (
                    user_id bigint(20) unsigned NOT NULL auto_increment,
                    first_name varchar(100) NOT NULL,
                    last_name varchar(100) NOT NULL,
                    age int(11) NOT NULL,
                    username varchar(50) NOT NULL,
                    password varchar(50) NOT NULL,
                    PRIMARY KEY (user_id)
                  );


CREATE TABLE categories (
                    category_id bigint(20) unsigned NOT NULL auto_increment,
                    name varchar(150) NOT NULL,
                    description text NOT NULL,
                    PRIMARY KEY (category_id)
                );


CREATE TABLE brands (
                    brand_id bigint(20) unsigned NOT NULL auto_increment,
                    name varchar(150) NOT NULL,
                    description text NOT NULL,
                    img varchar(256) NOT NULL,
                    PRIMARY KEY (brand_id)
                );


CREATE TABLE products (
                    product_id bigint(20) unsigned NOT NULL auto_increment,
                    category_id bigint(20) unsigned NOT NULL,
                    brand_id bigint(20) unsigned NOT NULL,
                    name varchar(150) NOT NULL,
                    img varchar(256) NOT NULL,
                    price float NOT NULL,
                    PRIMARY KEY (product_id),
                    FOREIGN KEY (category_id) REFERENCES categories (category_id),
                    FOREIGN KEY (brand_id) REFERENCES brands (brand_id)
                   );

CREATE TABLE shoppingcarts (
                    item_id bigint(20) unsigned NOT NULL auto_increment,
                    user_id bigint(20) unsigned NOT NULL,
                    product_id bigint(20) unsigned NOT NULL,
                    item_number int unsigned NOT NULL,
                    posted timestamp,
                    PRIMARY KEY (item_id),
                    FOREIGN KEY (user_id) REFERENCES users (user_id),
                    FOREIGN KEY (product_id) REFERENCES products (product_id)
                   );



CREATE TABLE stores (
                        store_id bigint(20) unsigned NOT NULL auto_increment,
                        name varchar(150) NOT NULL,
                        address text NOT NULL,
                        lat float NOT NULL,
                        lng float NOT NULL,
                        PRIMARY KEY (store_id)
                      );



INSERT INTO users VALUES (1,'Juan','Sánchez',20,'jsanchez',md5('secret'));
INSERT INTO users VALUES (2,'Antonia','González', 15,'agonzalez',md5('password'));
INSERT INTO users VALUES (3,'Luisa','García', 18 ,'lgarcia',md5('topsecret'));
INSERT INTO users VALUES (4,'Perfecto','Nazaruc', 27 ,'pnazaruc',md5('manzana'));
INSERT INTO users VALUES (5,'Sebas','Moya', 31 ,'semoya',md5('platano'));
INSERT INTO users VALUES (6,'Maria','Blas', 43 ,'mblas',md5('pasapalabra'));
INSERT INTO users VALUES (7,'Lucia','Tomás', 20 ,'ltomas',md5('tango3'));
INSERT INTO users VALUES (8,'Carlos','Fallos', 35 ,'cfallos',md5('4paredes'));



INSERT INTO categories VALUES (1,'Amplificadores', 'amplificadores');
INSERT INTO categories VALUES (2,'Guitarras', 'guitarras');
INSERT INTO categories VALUES (3,'Bajos', 'bajos');
INSERT INTO categories VALUES (4,'Teclados', 'teclados');
INSERT INTO categories VALUES (5,'Baterías', 'baterías');
INSERT INTO categories VALUES (6,'Pedales', 'pedales');
INSERT INTO categories VALUES (7,'Micrófonos', 'microfonos');
INSERT INTO categories VALUES (8,'Discos', 'discos');
INSERT INTO categories VALUES (9,'Salas', 'salas');
INSERT INTO categories VALUES (10,'Promociones', 'promos');



INSERT INTO brands VALUES (1, 'Randall', 'Increible cabezal amplificador');
INSERT INTO brands VALUES (2, 'Marshall', 'Cajas negras');
INSERT INTO brands VALUES (3, 'Jackson', 'Preciosa guitarra blanca');
INSERT INTO brands VALUES (4, 'Ibanez', 'Guitarra azul');
INSERT INTO brands VALUES (5, 'ESP', 'Bonito bajo rojo');
INSERT INTO brands VALUES (6, 'Fender', 'Color verde menta');
INSERT INTO brands VALUES (7, 'Cassio', 'teclado platead');
INSERT INTO brands VALUES (8, 'Yamaha', 'teclado multifunción');
INSERT INTO brands VALUES (9, 'Pearl', 'kit de batería Pearl');
INSERT INTO brands VALUES (10, 'Tama', 'kit completo de bateria Tama');
INSERT INTO brands VALUES (11, 'Boss', 'Stomp box de pedales');
INSERT INTO brands VALUES (12, 'Electro Harmonix', 'Muff metal');
INSERT INTO brands VALUES (13, 'Sennheisser', 'Micro plata');
INSERT INTO brands VALUES (14, 'Shure', 'Micro compacto color plateado');
INSERT INTO brands VALUES (15, 'Nuclear Blast', 'Ultimo disco de machine head');
INSERT INTO brands VALUES (16, 'Napalm Records', 'El mejor album de todos los tiempos');
INSERT INTO brands VALUES (17, 'Promociones', 'promos');
INSERT INTO brands VALUES (18, 'Salas', 'salas');

INSERT INTO 'products' (`product_id`, `category_id`,`brand_id`, `name`, `description`, `img`,`price`) VALUES
  ( 1 , 1 , 1 ,'randall thrasher', '/img/RandallThrasher50W.jpg', 305),
  ( 2 , 1 , 2 ,'kit ampli marshall ', '/img/MarshallDSL40CST.jpg', 748),
  ( 3 , 2 , 3 ,'Jackson RRXT', '/img/JacksonRRXT.jpg', 859),
  ( 4 , 2 , 4 ,'Ibanez JEM77P', '/img/IbanezJEM77P.jpg', 945);
  ( 5 , 3 , 5 ,'ESP stream Bass', '/img/ESPstreamBass.jpg', 678);
  ( 6 , 3 , 6 ,'Fender Bass', '/img/FenderPrecisionBass.jpg', 806);
  ( 7 , 4 , 7 ,'Teclado Cassio', '/img/CassioKeyboard.jpg', 486);
  ( 8 , 4 , 8 ,'Yamaha PSR 550', '/img/yamahaPsr550.jpg', 593);
  ( 9 , 5 , 9 ,'Kit bateria Pearl', '/img/KitMasterCustomPearl.jpg', 1564);
  ( 10 , 5 , 10 ,'Kit bateria Tama', '/img/KitStarDrumsTama.jpg', 1256);
  ( 11 , 6 , 11 ,'Pedales Boss caja stompBox', '/img/BossStompbox.jpg', 593);
  ( 12 , 6 , 12 ,'Electro Harmonix metal muff', '/img/ElectroHarmonixMetalMuff.jpg', 109);
  ( 13 , 7 , 13 ,'Micrófono sennheiser SKM-5200', '/img/sennheiserSKM-5200.jpg', 362);
  ( 14 , 7 , 14 ,'Micrófono shure CD8', '/img/ShureCD8Mic.jpg', 204);
  ( 15 , 8 , 15 ,'Album Catharsis (Machine head)', '/img/CatharsisNuclearBlast.jpg', 15);
  ( 16 , 8 , 16 ,'Album Powerwolf', '/img/PowerWolfNapalmRecords.jpg', 15);
  ( 17 , 9 , 18 ,'Sala Rockcity Valencia', '/img/RockcityValencia.jpg', 368);
  ( 18 , 9 , 18 ,'Sala Paberse Matao Valencia', '/img/PaberValencia.jpg', 115);
  ( 19 , 9 , 18 ,'Sala 16 Toneladas Valencia', '/img/16ToneladasValencia.jpg', 249);
  ( 20 , 10 , 17 ,'Promo Ampli', '/img/PromoAmpli.jpg', 20);
  ( 21 , 10 , 17 ,'Promo Micro', '/img/PromoMicro.jpg', 20);
  ( 22 , 10 , 17 ,'Promo guitarra', '/img/PromoGuitarra.jpg', 20);


INSERT INTO `shoppingcarts`(`user_id`, `product_id`,`item_number`) VALUES
  (1,1,1),
  (1,4,1),
  (2,3,10),
  (3,2,1),
  (3,2,1);



INSERT INTO `stores`(`store_id`,`name`,`address`,`lat`,`lng`) VALUES
  (1,'Rock city',' C/ Els Coheters, 6, 46132 Almàssera, Valencia, València',39.5117123,-0.3607491)
  (2,'Paberse Matao','Carrer de Castelló, 7, 46910 Sedaví, València',39.426437,-0.3918197);
  (3,'16 Toneladas','Carrer de Ricardo Micó, 3, 46009 València',39.4812533,-0.3898079);
