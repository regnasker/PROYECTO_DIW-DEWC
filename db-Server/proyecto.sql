



CREATE TABLE users (
                    user_id bigint(20) unsigned NOT NULL auto_increment,
                    first_name varchar(100) NOT NULL,
                    last_name varchar(100) NOT NULL,
                    age int(11) NOT NULL,
                    username varchar(50) NOT NULL,
                    password varchar(50) NOT NULL,
                    banda boolean,
                    favorito varchar(50),
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
                        mapa varchar (1000),
                        PRIMARY KEY (store_id)
                      );



INSERT INTO users VALUES (1,'Juan','Sánchez',20,'jsanchez',md5('secret'),false,'Guitarras');
INSERT INTO users VALUES (2,'Antonia','González', 15,'agonzalez',md5('password'),true,'Micrófonos');
INSERT INTO users VALUES (3,'Luisa','García', 18 ,'lgarcia',md5('topsecret'),false,'');
INSERT INTO users VALUES (4,'Perfecto','Nazaruc', 27 ,'pnazaruc',md5('manzana'),true,'');
INSERT INTO users VALUES (5,'Sebas','Moya', 31 ,'semoya',md5('platano'),false,'');
INSERT INTO users VALUES (6,'Maria','Blas', 43 ,'mblas',md5('pasapalabra'),true,'Amplificadores');
INSERT INTO users VALUES (7,'Lucia','Tomás', 20 ,'ltomas',md5('tango3'),false,'Bajos');
INSERT INTO users VALUES (8,'Carlos','Fallos', 35 ,'cfallos',md5('4paredes'),true,'Salas');



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

INSERT INTO 'products' ('product_id', 'category_id','brand_id', 'name', 'description', 'img','price') VALUES
  ( 1 , 1 , 1 ,'randall thrasher', '../../img/RandallThrasher50W.jpg', 305),
  ( 2 , 1 , 2 ,'kit ampli marshall ', '../../img/MarshallDSL40CST.jpg', 748),
  ( 3 , 2 , 3 ,'Jackson RRXT', '../../img/JacksonRRXT.jpg', 859),
  ( 4 , 2 , 4 ,'Ibanez JEM77P', '../../img/IbanezJEM77P.jpg', 945),
  ( 5 , 3 , 5 ,'ESP stream Bass', '../../img/ESPstreamBass.jpg', 678),
  ( 6 , 3 , 6 ,'Fender Bass', '../../img/FenderPrecisionBass.jpg', 806),
  ( 7 , 4 , 7 ,'Teclado Cassio', '../../img/CassioKeyboard.jpg', 486),
  ( 8 , 4 , 8 ,'Yamaha PSR 550', '../../img/yamahaPsr550.jpg', 593),
  ( 9 , 5 , 9 ,'Kit bateria Pearl', '../../img/KitMasterCustomPearl.jpg', 1564),
  ( 10 , 5 , 10 ,'Kit bateria Tama', '../../img/KitStarDrumsTama.jpg', 1256),
  ( 11 , 6 , 11 ,'Pedales Boss caja stompBox', '../../img/BossStompbox.jpg', 593),
  ( 12 , 6 , 12 ,'Electro Harmonix metal muff', '../../img/ElectroHarmonixMetalMuff.jpg', 109),
  ( 13 , 7 , 13 ,'Micrófono sennheiser SKM-5200', '../../img/sennheiserSKM-5200.jpg', 362),
  ( 14 , 7 , 14 ,'Micrófono shure CD8', '../../img/ShureCD8Mic.jpg', 204),
  ( 15 , 8 , 15 ,'Album Catharsis (Machine head)', '../../img/CatharsisNuclearBlast.jpg', 15),
  ( 16 , 8 , 16 ,'Album Powerwolf', '../../img/PowerWolfNapalmRecords.jpg', 15),
  ( 17 , 9 , 18 ,'Sala Rockcity Valencia', '../../img/RockcityValencia.jpg', 368),
  ( 18 , 9 , 18 ,'Sala Paberse Matao Valencia', '../../img/PaberValencia.jpg', 115),
  ( 19 , 9 , 18 ,'Sala 16 Toneladas Valencia', '../../img/16ToneladasValencia.jpg', 249),
  ( 20 , 10 , 17 ,'Promo Ampli', '../../img/PromoAmpli.jpg', 20),
  ( 21 , 10 , 17 ,'Promo Micro', '../../img/PromoMicro.jpg', 20),
  ( 22 , 10 , 17 ,'Promo guitarra', '../../img/PromoGuitarra.jpg', 20);


INSERT INTO 'shoppingcarts'('user_id', 'product_id','item_number') VALUES
  (1,1,1),
  (1,4,1),
  (2,3,10),
  (3,2,1),
  (3,2,1);



INSERT INTO 'stores'('store_id','name','address','lat','lng','mapa') VALUES
  (1,'Sala Rockcity Valencia',' C/ Els Coheters, 6, 46132 Almàssera, Valencia, València',39.5117123,-0.3607491,'<iframe class"embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3078.122872485385!2d-0.36293778438591623!3d39.511716418103!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd60466c002fa9fb%3A0x405243f394cb2727!2sRock+City!5e0!3m2!1ses!2ses!4v1519319519435" style="border:0" allowfullscreen></iframe>'),
  (2,'Sala Paberse Matao Valencia','Carrer de Castelló, 7, 46910 Sedaví, València',39.426437,-0.3918197,'<iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3081.8975577000174!2d-0.3918196843877759!3d39.426440923190185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd604ec1264990f1%3A0x11ff508fb0ece632!2sCarrer+de+Castell%C3%B3%2C+7%2C+46910+Sedav%C3%AD%2C+Valencia!5e0!3m2!1ses!2ses!4v1519319553664" style="border:0" allowfullscreen></iframe>'),
  (3,'Sala 16 Toneladas Valencia','Carrer de Ricardo Micó, 3, 46009 València',39.4812533,-0.3898079,'<iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3079.442905480527!2d-0.39016918438658477!3d39.48191251988194!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd604f596910d6fb%3A0x25ecd942c9585c9b!2sCarrer+de+Ricardo+Mic%C3%B3%2C+3%2C+46009+Val%C3%A8ncia%2C+Valencia!5e0!3m2!1ses!2ses!4v1519319584583" style="border:0" allowfullscreen></iframe>');
