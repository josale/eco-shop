-- =========== DDL: Creación de Tablas ===========

-- Limpieza (opcional, por si se ejecuta varias veces)
DROP TABLE IF EXISTS detalles_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;

-- Creación de la tabla de clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    fecha_registro DATE
);

-- Creación de la tabla de productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio NUMERIC(10, 2) CHECK (precio > 0),
    stock INT CHECK (stock >= 0)
);

-- Creación de la tabla de pedidos
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    fecha_pedido DATE,
    estado VARCHAR(20)
);

-- Creación de la tabla de detalles de pedido
CREATE TABLE detalles_pedido (
    detalle_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(pedido_id),
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT CHECK (cantidad > 0)
);

-- =========== DML: Inserción de Datos de Ejemplo ===========

-- Insertar clientes
INSERT INTO clientes (nombre, email, ciudad, pais, fecha_registro) VALUES
('Ana García', 'ana.garcia@email.com', 'Madrid', 'España', '2024-01-15'),
('Carlos Pérez', 'carlos.perez@email.com', 'Bogotá', 'Colombia', '2024-02-20'),
('Maria Rodriguez', 'maria.r@email.com', 'Madrid', 'España', '2024-03-10'),
('Juan Martinez', 'juan.m@email.com', 'Ciudad de México', 'México', '2024-04-05'),
('Lucia Hernandez', 'lucia.h@email.com', 'Buenos Aires', 'Argentina', '2024-05-21');

-- Insertar productos
INSERT INTO productos (nombre_producto, categoria, precio, stock) VALUES
('Botella de Agua Reutilizable', 'Hogar', 25.50, 150),
('Cepillo de Dientes de Bambú', 'Cuidado Personal', 4.99, 300),
('Bolsa de Tela Orgánica', 'Accesorios', 15.00, 200),
('Shampoo Sólido', 'Cuidado Personal', 12.75, 120),
('Libreta de Papel Reciclado', 'Oficina', 8.50, 250);

-- Insertar pedidos
INSERT INTO pedidos (cliente_id, fecha_pedido, estado) VALUES
(1, '2025-07-01', 'Entregado'),
(2, '2025-07-03', 'Enviado'),
(1, '2025-07-15', 'Procesando'),
(3, '2025-07-20', 'Entregado'),
(4, '2025-08-01', 'Enviado'),
(2, '2025-08-05', 'Entregado');

-- Insertar detalles de pedido
INSERT INTO detalles_pedido (pedido_id, producto_id, cantidad) VALUES
(1, 1, 2),  -- Pedido 1, Producto 1, 2 unidades
(1, 2, 5),  -- Pedido 1, Producto 2, 5 unidades
(2, 3, 10), -- Pedido 2, Producto 3, 10 unidades
(3, 4, 3),  -- Pedido 3, Producto 4, 3 unidades
(4, 2, 2),  -- Pedido 4, Producto 2, 2 unidades
(4, 5, 4),  -- Pedido 4, Producto 5, 4 unidades
(5, 1, 1),  -- Pedido 5, Producto 1, 1 unidad
(6, 3, 5);  -- Pedido 6, Producto 3, 5 unidades