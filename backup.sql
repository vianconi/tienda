-- ============================
-- Crear una base de datos
-- ============================
CREATE DATABASE tienda; -- utf8mb4_unicode_ci


-- ============================
-- Crear la tabla tipousuario
-- ============================
CREATE TABLE `tienda`.`tipousuario` (
    `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_unicode_ci 
COMMENT = 'Almacena los tipos de usuarios';


-- ============================
-- Crear la tabla usuario
-- ============================
CREATE TABLE `tienda`.`usuario` (
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `usuario` VARCHAR(20) NOT NULL UNIQUE,
    `password` CHAR(94) NOT NULL,
    `tipousuario_id` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`tipousuario_id`) REFERENCES `tienda`.`tipousuario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB 
CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci 
COMMENT = 'Almacena los usuarios';


-- ============================
-- Crear la tabla autor
-- ============================
CREATE TABLE `tienda`.`autor` (
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `apellidos` VARCHAR(40) NOT NULL,
    `nombres` VARCHAR(40) NOT NULL,
    `fechanacimiento` DATE NULL,
    PRIMARY KEY (`id`),
    INDEX idx_apellidos (`apellidos`)
) ENGINE = InnoDB 
CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci 
COMMENT = 'Almacena los datos de los autores';


-- ============================
-- Crear la tabla libro
-- ============================
CREATE TABLE `tienda`.`libro` (
    `isbn` CHAR(13) NOT NULL,
    `titulo` VARCHAR(100) NOT NULL,
    `autor_id` SMALLINT UNSIGNED NOT NULL,
    `anoedicion` YEAR NOT NULL,
    `precio` DECIMAL(6,2) UNSIGNED NOT NULL,
    PRIMARY KEY (`isbn`),
    FOREIGN KEY (`autor_id`) REFERENCES `tienda`.`autor`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB 
CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci 
COMMENT = 'Almacena los datos de los libros';


-- ============================
-- Crear la tabla compra
-- ============================
CREATE TABLE `tienda`.`compra` (
    `uuid` CHAR(36) NOT NULL,
    `libro_isbn` CHAR(13) NOT NULL,
    `usuario_id` SMALLINT UNSIGNED NOT NULL,
    `fecha` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`uuid`),
    FOREIGN KEY (`libro_isbn`) REFERENCES `tienda`.`libro`(`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`usuario_id`) REFERENCES `tienda`.`usuario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB 
CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci 
COMMENT = 'Almacena los datos de las compras';
 

-- ============================
-- Insertando tipos de usuario
-- ============================
INSERT INTO `tipousuario` (`nombre`) 
VALUES 
    ('Administrador'), 
    ('Cliente');


-- ====================================
-- Insertando valores en la tabla autor
-- ====================================
INSERT INTO `autor` (`apellidos`, `nombres`, `fechanacimiento`) 
VALUES 
    ('Vallejo Mendoza', 'César Abraham', '1892-03-16'),
    ('Vargas Llosa', 'Jorge Mario Pedro', '1936-03-28'),
    ('Alegría Bazán', 'Ciro', '1909-11-04'),
    ('García Márquez', 'Gabriel José de la Concordia', '1927-03-06');


-- ====================================
-- Insertando valores en la tabla libro
-- ====================================
INSERT INTO `libro` (`isbn`, `titulo`, `autor_id`, `anoedicion`, `precio`) 
VALUES 
    ('978318472263', 'Los heraldos negros', 1, 1919, 48),
    ('892014771852', 'Poemas humanos', 1, 1939, 120),
    ('591338770183', 'Paco Yunque', 1, 1951, 55),
    
    ('480129403571', 'La ciudad y los perros', 2, 1963, 81),
    ('238874100138', 'Conversación en La Catedral', 2, 1951, 70),
    ('981402938251', 'La casa verde', 2, 1966, 105),
    ('890366138239', 'La fiesta del Chivo', 2, 2000, 30),
    
    ('383370912281', 'El mundo es ancho y ajeno', 3, 1941, 65),
    ('589120131047', 'Los perros hambrientos', 3, 1939, 31),
    ('483240184226', 'La serpiente de oro', 3, 1935, 85),
    
    ('762841019387', 'Cien años de soledad', 4, 1967, 75),
    ('930281938211', 'El amor en los tiempos del cólera', 4, 1985, 38),
    ('683425019133', 'El coronel no tiene quien le escriba', 4, 1961, 42),
    ('661984010128', 'El general en su laberinto', 4, 1989, 110);


-- ============================
-- 
-- ============================