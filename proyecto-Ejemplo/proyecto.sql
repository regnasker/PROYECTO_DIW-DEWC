-- Hemos añadido las restricciones (foreign keys) y algunos datos más para pruebas

--Reciclable
CREATE TABLE users (
                    user_id bigint(20) unsigned NOT NULL auto_increment,
                    first_name varchar(100) NOT NULL,
                    last_name varchar(100) NOT NULL,
                    age int(11) NOT NULL,
                    username varchar(50) NOT NULL,
                    password varchar(50) NOT NULL,
                    PRIMARY KEY (user_id)
                  );

-- Reciclable para tienda y para servicio
CREATE TABLE categories (
                    category_id bigint(20) unsigned NOT NULL auto_increment,
                    name varchar(150) NOT NULL,
                    description text NOT NULL,
                    PRIMARY KEY (category_id)
                );

-- Marcas de productos
CREATE TABLE brands (
                    brand_id bigint(20) unsigned NOT NULL auto_increment,
                    name varchar(150) NOT NULL,
                    description text NOT NULL,
                    img varchar(256) NOT NULL,
                    PRIMARY KEY (brand_id)
                );

-- Reciclable (añadir servicios)
CREATE TABLE products (
                    product_id bigint(20) unsigned NOT NULL auto_increment,
                    category_id bigint(20) unsigned NOT NULL,
                    brand_id bigint(20) unsigned NOT NULL,
                    name varchar(150) NOT NULL,
                    description text NOT NULL,
                    img varchar(256) NOT NULL,
                    price float NOT NULL,
                    posted timestamp,
                    PRIMARY KEY (product_id),
                    FOREIGN KEY (category_id) REFERENCES categories (category_id),
                    FOREIGN KEY (brand_id) REFERENCES brands (brand_id)
                   );
-- Reciclable (inventar carrito)
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

-- Reciclable  inventar comentarios
CREATE TABLE comments (
                       comment_id bigint(20) unsigned  NOT NULL auto_increment,
                       user_id bigint(20) unsigned  NOT NULL,
                       product_id bigint(20) unsigned  NOT NULL,
                       rating int unsigned NOT NULL,
                       title varchar(150) NOT NULL,
                       body text NOT NULL,
                       posted timestamp,
                       PRIMARY KEY (comment_id),
                       FOREIGN KEY (user_id) REFERENCES users (user_id),
                       FOREIGN KEY (product_id) REFERENCES products (product_id)
                      );

-- Salas
CREATE TABLE stores (
                        store_id bigint(20) unsigned NOT NULL auto_increment,
                        name varchar(150) NOT NULL,
                        address text NOT NULL,
                        lat float NOT NULL,
                        lng float NOT NULL,
                        PRIMARY KEY (store_id)
                      );

-- Inicializamos algunos valores de los registros.

INSERT INTO users VALUES (1,'Juan','Sánchez',20,'jsanchez',md5('secret'));
INSERT INTO users VALUES (2,'Antonia','González', 15,'agonzalez',md5('password'));
INSERT INTO users VALUES (3,'Luisa','García', 18 ,'lgarcia',md5('topsecret'));
INSERT INTO users VALUES (4,'Perfecto','Nazaruc', 27 ,'pnazaruc',md5('manzana'));
INSERT INTO users VALUES (5,'Sebas','Moya', 31 ,'semoya',md5('platano'));
INSERT INTO users VALUES (6,'Maria','Blas', 43 ,'mblas',md5('pasapalabra'));
INSERT INTO users VALUES (7,'Lucia','Tomás', 20 ,'ltomas',md5('tango3'));
INSERT INTO users VALUES (8,'Carlos','Fallos', 35 ,'cfallos',md5('4paredes'));


--(category_id / name / description)
INSERT INTO categories VALUES (1,'Amplificadores', '');
INSERT INTO categories VALUES (2,'Guitarras', '');
INSERT INTO categories VALUES (3,'Bajos', '');
INSERT INTO categories VALUES (4,'Teclados', '');
INSERT INTO categories VALUES (5,'Baterías', '');
INSERT INTO categories VALUES (6,'Pedales', '');
INSERT INTO categories VALUES (7,'Micrófonos', '');
INSERT INTO categories VALUES (8,'Discos', '');


 --(brand_id / name / description / img)
INSERT INTO brands VALUES (1, 'Randall', 'Increible cabezal amplificador', '/img/RandallThrasher50W.jpg');
INSERT INTO brands VALUES (2, 'Marshall', '', '/img/MarshallDSL40CST.jpg');
INSERT INTO brands VALUES (3, 'Jackson', 'Preciosa guitarra blanca', '/img/JacksonRRXT.jpg');
INSERT INTO brands VALUES (4, 'Ibanez', '', '/img/IbanezJEM77P.jpg');
INSERT INTO brands VALUES (5, 'ESP', 'Bonito bajo rojo', '/img/ESPstreamBass.jpg');
INSERT INTO brands VALUES (6, 'Fender', '', '/img/FenderPrecisionBass.jpg');
INSERT INTO brands VALUES (7, 'Cassio', '', '/img/CassioKeyboard.jpg');
INSERT INTO brands VALUES (8, 'Yamaha', '', '/img/yamahaPsr550.jpg');
INSERT INTO brands VALUES (9, 'Pearl', '', '/img/KitMasterCustomPearl.jpg');
INSERT INTO brands VALUES (10, 'Tama', '', '/img/KitStarDrumsTama.jpg');
INSERT INTO brands VALUES (11, 'Boss', '', '/img/BossStompbox.jpg');
INSERT INTO brands VALUES (12, 'Electro Harmonix', '', '/img/ElectroHarmonixMetalMuff.jpg');
INSERT INTO brands VALUES (13, 'Sennheisser', '', '/img/sennheiserSKM-5200.jpg');
INSERT INTO brands VALUES (14, 'Shure', '', '/img/ShureCD8Mic.jpg');
INSERT INTO brands VALUES (15, 'Nuclear Blast', 'Ultimo disco de machine head', '/img/CatharsisNuclearBlast.jpg');
INSERT INTO brands VALUES (16, 'Napalm Records', 'El mejor album de todos los tiempos', '/img/PowerWolfNapalmRecords.jpg');



INSERT INTO 'products' (`product_id`, `category_id`,`brand_id`, `name`, `description`, `img`,`price`, `posted`) VALUES
  ( , , ,'','', '',  ,),
  ( , , ,'','', '',  ,),
  ( , , ,'','', '',  ,),
  ( , , ,'','', '',  ,);

INSERT INTO `comments`(`user_id`, `product_id`,`rating`, `title`, `body`) VALUES
  ( , , , '', ''),
  ( , , , '', ''),
  ( , , , '', ''),
  ( , , , '', '');

INSERT INTO `shoppingcarts`(`user_id`, `product_id`,`item_number`) VALUES
  (1,1,1),
  (1,4,1),
  (2,3,10),
  (3,2,1),
  (3,2,1);


-- cambiar stores a Salas.. Tengo las salas de valencia, falta añadir 3 de Bcn y Mdrd
INSERT INTO `stores`(`store_id`,`name`,`address`,`lat`,`lng`) VALUES
  (1,'Juan de Garay','c/Juan de Garay, 25, 46017 Valencia', 39.4548243, -0.3957476),
  (2,'Malvarrosa','Playa de la Malvarrosa',39.47726,-0.3233746);
