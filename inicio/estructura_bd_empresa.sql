-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS empresa_inventario;
USE empresa_inventario;

-- Tabla para usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para categorías de dispositivos
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Tabla para dispositivos
CREATE TABLE IF NOT EXISTS dispositivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria_id INT,
    descripcion TEXT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabla para inventario
CREATE TABLE IF NOT EXISTS inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dispositivo_id INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (dispositivo_id) REFERENCES dispositivos(id)
);

-- Tabla para mantenimiento
CREATE TABLE IF NOT EXISTS mantenimiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dispositivo_id INT,
    fecha DATE,
    descripcion TEXT,
    costo DECIMAL(10, 2),
    FOREIGN KEY (dispositivo_id) REFERENCES dispositivos(id)
);

-- Crear un usuario de prueba (opcional)
INSERT INTO usuarios (username, email, password) VALUES 
('admin', 'admin@empresa.com', PASSWORD('adminpass'));
