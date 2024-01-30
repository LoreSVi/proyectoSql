-- Creación de la base de datos--
create database geneseindumentaria; 

-- hacer uso de la base de datos--
use geneseindumentaria; 

-- Creación de tablas--

CREATE TABLE categoria(
id_categoria INT AUTO_INCREMENT NOT NULL,
nombre_categoria VARCHAR(25) NOT NULL,
PRIMARY KEY(id_categoria)
);

CREATE TABLE colores(
nombre_color VARCHAR(12) NOT NULL,
PRIMARY KEY(nombre_color)
);

CREATE TABLE talle(
letra_talle CHAR(3) NOT NULL,
PRIMARY KEY(letra_talle)
);

CREATE TABLE provincia(
id_provincia INT AUTO_INCREMENT NOT NULL,
nombre_provincia VARCHAR(35) NOT NULL,
PRIMARY KEY(id_provincia)
);

CREATE TABLE producto(
id_producto INT AUTO_INCREMENT NOT NULL,
nombre_producto VARCHAR(45) NOT NULL,
nombre_color VARCHAR(12) NOT NULL,
letra_talle CHAR(3) NOT NULL,
id_categoria INT NOT NULL, 
precio_unitario DECIMAL(6,2) NOT NULL,
stock INT,
PRIMARY KEY(id_producto),
FOREIGN KEY(nombre_color) REFERENCES colores(nombre_color),
FOREIGN KEY (letra_talle) REFERENCES talle(letra_talle),
FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE cliente(
id_cliente INT AUTO_INCREMENT NOT NULL,
nombre_cliente VARCHAR(25) NOT NULL,
apellido_cliente VARCHAR(25) NOT NULL,
fecha_nacimiento DATE NOT NULL,
email_cliente VARCHAR(255),
tel_contacto VARCHAR(15),
localidad VARCHAR(45) NOT NULL,
dirección_cliente VARCHAR(45) NOT NULL,
id_provincia INT NOT NULL,
PRIMARY KEY(id_cliente),
FOREIGN KEY(id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE clienteLogin(
id_usuario INT AUTO_INCREMENT NOT NULL,
usuario VARCHAR(10) NOT NULL,
contraseña CHAR(8) NOT NULL,
create_time DATE NOT NULL, 
id_cliente INT NOT NULL,
PRIMARY KEY(id_usuario),
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE pedido(
num_pedido INT AUTO_INCREMENT NOT NULL,
fecha_creacion DATE NOT NULL,
cant_requerida INT NOT NULL,
estado VARCHAR(20) NOT NULL,
id_producto INT NOT NULL,
PRIMARY KEY(num_pedido),
FOREIGN KEY(id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE envio(
id_envio INT AUTO_INCREMENT NOT NULL,
fecha_envio DATE NOT NULL,
transportista VARCHAR(45) NOT NULL,
num_pedido INT NOT NULL,
id_cliente INT NOT NULL,
fecha_entrega DATE NOT NULL,
PRIMARY KEY(id_envio),
FOREIGN KEY(num_pedido) REFERENCES pedido(num_pedido),
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE ventas(
id_venta INT AUTO_INCREMENT NOT NULL,
cant_vendida INT NOT NULL,
importe_total DECIMAL(7,2) NOT NULL,
id_envio INT NOT NULL,
PRIMARY KEY(id_venta),
FOREIGN KEY(id_envio) REFERENCES envio(id_envio)
);


use geneseindumentaria; 

-- Insericion de registros---
INSERT INTO categoria (id_categoria, nombre_categoria) VALUES
(1, 'camisas'),
(2, 'pantalones'),
(3, 'abrigos'),
(4, 'sueters'),
(5, 'remeras')
;

INSERT INTO talle (letra_talle) VALUES
('XS'),
('S'),
('M'),
('L'),
('XL')
;

INSERT INTO colores (nombre_color) VALUES
('rojo'),
('amarillo'),
('azul'),
('verde'),
('violeta'),
('beige'),
('rosa'),
('camel'),
('dorado'),
('blanco'),
('crema'),
('plateado'),
('fuscia'),
('celeste'),
('negro'),
('gris'),
('marron'),
('coral'),
('lila'),
('verde agua')
;

INSERT INTO provincia (id_provincia, nombre_provincia) VALUES
(null , 'Buenos Aires'),
(null, 'CABA'),
(null, 'Catamarca'),
(null, 'Chaco'),
(null, 'Chubut'),
(null, 'Cordoba'),
(null, 'Corrientes'),
(null, 'Entre Rios'),
(null, 'Formosa'),
(null, 'Jujuy'),
(null, 'La Pampa'),
(null, 'La Rioja'),
(null, 'Mendoza'),
(null, 'Misiones'),
(null, 'Neuquen'),
(null, 'Rio Negro'),
(null, 'Salta'),
(null, 'San Juan'),
(null, 'San Luis'),
(null, 'Santa Cruz'),
(null, 'Santa Fe'),
(null, 'Santiago del Estero'),
(null, 'Tierra del Fuego'),
(null, 'Tucuman')
;

INSERT INTO cliente (id_cliente, nombre_cliente, apellido_cliente, fecha_nacimiento, email_cliente, tel_contacto, localidad, dirección_cliente, id_provincia) VALUES
(null, 'Susana', 'Perez', '1953-12-15', 'susanaPerez@gmail.com', '1122334455', 'salta', 'trelles 2250', 17),
(null, 'Susana', 'Gonzalez', '1956-05-18', 'susanaGonzalez@gmail.com', '1125894531', 'cafayate', 'r1 121', 17),
(null, 'Barbi', 'Jonson', '1987-04-23', 'barbiJonsongmail.com', '1123564874', 'san telmo', 'bolivar 400', 2),
(null, 'Lorena', 'Irvibes', '1989-02-03', 'lorenaIrvibes@gmail.com', '1132659858', 'flores', 'culpina 400', 2),
(null, 'Jessica', 'Prime', '1990-07-19', 'jessicaPrime@gmail.com', '1168953245', 'avellaneda', 'salta 2214', 1),
(null, 'Vanesa', 'Prime', '1986-09-01', 'vanesaPrime@gmail.com', '1135689741', 'clorinda', 'arrayanes 255', 9),
(null, 'Mara', 'Jonson', '1993-10-22', 'maraJonson@gmail.com', '1123654897', 'caballito', 'Av. Rivadavia 5012', 2),
(null, 'Celeste', 'Capristo', '1999-03-27', 'celesteCapristo@gmail.com', '1145484732', 'villa Luro', 'Escalada 2100', 2),
(null, 'Brisa', 'Robles', '2000-08-03', 'brisaRobles@gmail.com', '115536971649', 'san cristobal', 'mazza 3154', 2),
(null, 'Alma', 'Cannes', '1979-02-13', 'almaCannes@gamil.com', '1178653423', 'san luis', 'pepiri 256', 19)
;

INSERT INTO clientelogin (id_usuario, usuario, contraseña, create_time, id_cliente) VALUES
(null, 'SusyPe', 'SuPe533w', '2023-10-21', 1),
(null, 'Goni22', 'susiGo21', '2023-11-02', 2),
(null, 'Bar87', 'Tofu4563', '2023-11-16', 3),
(null, 'LoliIrvi', 'luna235', '2023-12-03', 4),
(null, 'Jess15', 'estrella', '2023-12-05', 5),
(null, 'millo34','vanmillo', '2023-12-05', 6),
(null, 'MaritaJ', 'myta_3tr', '2023-12-06', 7),
(null, 'cele99', 'cccuerva', '2023-12-07', 8),
(null, 'robles_Bri', 're21sole', '2023-12-08', 9),
(null, 'Almi', 'ACann131', '2023-12-10', 10)
;

INSERT INTO producto (id_producto, nombre_producto, nombre_color, letra_talle, id_categoria, precio_unitario, stock) VALUES
(null, 'Saco', 'camel', 'S', 3, 8500.00, 2),
(null, 'Saco', 'camel', 'M', 3, 8500.00, 5),
(null, 'Saco', 'camel', 'L', 3, 8500.00, 2),
(null, 'Saco', 'camel', 'XL', 3, 8500.00, 1),
(null, 'Engomado negro', 'negro', 'S', 2, 1200.00, 3),
(null, 'Engomado negro', 'negro', 'M', 2, 1200.00, 8),
(null, 'Engomado negro', 'negro', 'L', 2, 1200.00, 3),
(null, 'Polera', 'beige', 'M', 3, 4000.00, 5),
(null, 'Blanca y pintitas', 'blanco', 'M', 1, 4200.00, 3),
(null, 'Saco', 'negro', 'S', 3, 8500.00, 6),
(null, 'Saco', 'negro', 'M', 3, 8500.00, 8),
(null, 'Saco', 'negro', 'L', 3, 8500.00, 4),
(null, 'Saco', 'negro', 'XL', 3, 8500.00, 2),
(null, 'buzo', 'lila', 'M', 4, 3800.00, 2),
(null, 'remera love', 'rosa', 'M', 5, 2500.00, 4)
;

INSERT INTO pedido (num_pedido, fecha_creacion, cant_requerida, estado, id_producto) VALUES
(null, '2023-11-02', 1, 'listo', 10),
(null, '2023-12-05', 2, 'listo', 15),
(null, '2023-12-08', 1, 'listo', 14),
(null, '2023-12-09', 1, 'en proceso', 9),
(null, '2023-12-09', 1, 'en proceso', 5),
(null, '2023-12-10', 1, 'en proceso', 4),
(null, '2023-12-12', 1, 'en proceso', 6),
(null, '2023-11-02', 1, 'despachado', 2),
(null, '2023-11-02', 1, 'despachado', 3),
(null, '2023-11-02', 1, 'despachado', 11),
(null, '2023-11-02', 1, 'despachado', 1)
;

INSERT INTO envio ( id_envio, fecha_envio, transportista, num_pedido, id_cliente, fecha_entrega) VALUES
(null, '2023-11-02', 'correo Argentino', 8, 2, '2023-11-04'),
(null, '2023-11-02', 'correo Argentino', 9, 3, '2023-11-04'),
(null, '2023-11-02', 'correo Argentino', 10, 6, '2023-11-04'),
(null, '2023-11-02', 'correo Argentino', 11, 9, '2023-11-04')
;

INSERT INTO ventas (id_venta, cant_vendida, importe_total, id_envio) VALUES
(null, 1, 8500.00, 1),
(null, 1, 8500.00, 2),
(null, 1, 8500.00, 3),
(null, 1, 8500.00, 4)
;

-- creación vistas--
use geneseindumentaria; 

-- vista de la tabla pedidos que muestra aquellos pedidos que se encuentran en proceso-- 
CREATE OR REPLACE VIEW p_en_proceso AS
(SELECT * FROM pedido 
where estado like upper('en proceso'));

SELECT * FROM p_en_proceso;

-- vista de la tabla pedidos que muestra aquellos pedidos que se encuentran listos-- 
CREATE OR REPLACE VIEW pedido_listo AS
(SELECT * FROM pedido 
where estado like upper('listo'));

SELECT * FROM pedido_listo;

-- vista de la tabla pedidos que muestra aquellos pedidos que se encuentran despachados-- 
CREATE OR REPLACE VIEW pedido_despachado AS
(SELECT * FROM pedido 
where estado like upper('despachado'));

SELECT * FROM pedido_despachado;

-- vista que muestra los productos despachados(vendidos) en el mes de noviembre --
CREATE VIEW vista_ventas_noviembre AS
SELECT
    *
FROM
    envio
WHERE
    MONTH(fecha_entrega) = 11 AND YEAR(fecha_entrega) = 2023;
    
SELECT * FROM vista_ventas_noviembre;

-- vista que muestra las ventas por provincia con nombre del cliente--
CREATE OR REPLACE VIEW ventasxprov AS
(SELECT 
    c.id_provincia,
    c.nombre_cliente,
    c.apellido_cliente,
    c.id_cliente, 
    pr.nombre_provincia
FROM 
    cliente c
 INNER JOIN 
    provincia pr ON c.id_provincia = pr.id_provincia
WHERE 
    c.id_cliente IN (SELECT id_cliente FROM envio));

SELECT * FROM ventasxprov;

-- vista que muestra detalle de las ventas(cliente, cuanto abono, cuando se entrego el producto, quien lo entrego,cantidad de producto--
CREATE VIEW vista_ventas_envio_pedido AS
SELECT DISTINCT
    v.id_venta,
    v.importe_total,
    e.fecha_entrega,
    e.id_envio,
    e.transportista,
    cl.dirección_cliente,
    p.num_pedido,
    p.cant_requerida
FROM
    ventas v
JOIN
    envio e ON v.id_envio = e.id_envio
JOIN
    pedido p ON e.num_pedido = p.num_pedido
    JOIN
    cliente cl  ON e.id_cliente = cl.id_cliente;

-- consultando la vista--
SELECT * FROM vista_ventas_envio_pedido;

-- VISTA pedidos despachados con nombre de producto--
CREATE OR REPLACE VIEW ped_despachado_nombreprod AS
SELECT 
    p.id_producto,
    pd.nombre_producto,
    p.cant_requerida,
    p.estado, 
    p.num_pedido
FROM 
    pedido p
 INNER JOIN 
    producto pd ON p.id_producto = pd.id_producto
   where estado like upper('despachado') ;

SELECT * FROM ped_despachado_nombreprod;


-- FUNCIONES--
-- Función que dando un precio unitario y cantidad de productos me devuelve el precio total--
DELIMITER //
CREATE FUNCTION f_importeTotal(precio_unitario DECIMAL(6,2), cant_requerida INT)
RETURNS DECIMAL(11,2)
NO SQL 
BEGIN
	DECLARE total_products DECIMAL(11,2);
	SET total_products = precio_unitario * cant_requerida;
	RETURN total_products;
END//
DELIMITER ;


-- Función que dando el id del cliente me trae su Nombre y Apellido--
DELIMITER //
CREATE FUNCTION get_clienteName (param_id_cliente INT )
 RETURNS VARCHAR(50)
 READS SQL DATA
 BEGIN
 DECLARE clienteName VARCHAR (50);
 SET clienteName =(SELECT concat(nombre_cliente,' ', apellido_cliente) from cliente where id_cliente = param_id_cliente) ;
 RETURN clienteName; 
 END
//
DELIMITER ;

-- probando las funciones--
SELECT f_importeTotal(3800.00, 2) AS total_compra;

SELECT get_clienteName (2) AS nombre_clientebyid;


-- Creación stored procedure--

-- procedimiento que actualiza el precio en la tabla producto --
DELIMITER //
CREATE PROCEDURE sp_actualizar_precio (
 IN p_id_producto INT,
IN p_nuevo_precio DECIMAL(6,2))
BEGIN
UPDATE producto 
SET precio_unitario = p_nuevo_precio
WHERE id_producto = p_id_producto;
END //
DELIMITER ; 
-- probando procedimiento--
call sp_actualizar_precio (15,2700.00);

-- procedimiento que actualiza el stock en la tabla producto --
DELIMITER //
CREATE PROCEDURE sp_actualizar_stock (
 IN p_id_producto INT,
IN p_nuevo_stock INT)
BEGIN
UPDATE producto 
SET stock = p_nuevo_stock
WHERE id_producto = p_id_producto;
END //
DELIMITER ; 
-- probando procedimiento--
call sp_actualizar_stock (9,10);

-- procedimiento que informa a logística para despacho del producto --
DELIMITER //
CREATE PROCEDURE sp_pase_transportista()
BEGIN
SELECT * FROM pedido
WHERE estado LIKE 'listo';
END //
DELIMITER ; 
-- probando procedimiento--
call sp_pase_transportista();


-- creacción triggers--

CREATE TABLE new_producto(
id_auditoria_producto INT PRIMARY KEY AUTO_INCREMENT,
id_producto INT NOT NULL,
nombre_producto VARCHAR(45) NOT NULL,
nombre_color VARCHAR(12) NOT NULL,
letra_talle CHAR(3) NOT NULL,
id_categoria INT NOT NULL, 
precio_unitario DECIMAL(6,2) NOT NULL,
stock INT,
usuario VARCHAR (255),
fecha_hora DATETIME,
tipo_mov VARCHAR(255)
);

DROP TRIGGER IF EXISTS tr_add_new_producto;

CREATE TRIGGER tr_add_new_producto
AFTER INSERT ON producto 
FOR EACH ROW
INSERT INTO new_producto VALUES 
( DEFAULT, new.id_producto, new.nombre_producto, new.nombre_color, new.letra_talle, new.id_categoria, new.precio_unitario, new.stock, 
 USER(), NOW(),'se inserto un nuevo producto');

#Insercion en la tabla producto de un nuevo registro
INSERT INTO geneseindumentaria.producto VALUES( DEFAULT, 'buzo', 'blanco', 'M', '4', 3800.00, 3);

SELECT * FROM geneseindumentaria.new_producto;


DROP USER  'administrador'@'localhost';
DROP USER 'usuario'@'localhost';
-- creación de usuarios --
#Creacion de usuario + contraseña 
CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'm3i4la!$';
CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'delfin123';

 
 -- permiso solo lectura sobre todas las tablas-- 
 GRANT SELECT ON geneseindumentaria.* TO 'usuario'@'localhost';
 
 -- permisos lectura, inserción y modificación ---
  GRANT ALL ON geneseindumentaria.* TO 'administrador'@'localhost';
 
 -- ninguno podra eliminar registros de las tablas--
 REVOKE DELETE ON *.* FROM 'administrador'@'localhost';
 REVOKE DELETE ON *.* FROM 'usuario'@'localhost' ;





