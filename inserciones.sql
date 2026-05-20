-- ============================================================
--  SCRIPT DE INSERCIÓN DE DATOS
-- ============================================================

-- ------------------------------------------------------------
-- TABLA: Cliente
-- ------------------------------------------------------------
INSERT INTO Cliente (cedula, Nombre, Apellido, Direccion, Telefono, Correo) VALUES
('0745897558', 'Bolivar',   'Tuza',    'Las Pitas',          '0984563214', 'boliv@gmail.com'),
('1103218594', 'Juan',      'Pérez',   'Av. Universitaria',  '0991234567', 'juan@gmail.com'),
('1105203192', 'Andy',      'Cruz',    'La Libertad',        '0994589281', 'andy@gmail.com'),
('1458756628', 'Francisco', 'Ramirez', 'San Cayetano Bajo',  '0998457623', 'ramir@gmial.com');

-- ------------------------------------------------------------
-- TABLA: Vehiculo
-- ------------------------------------------------------------
INSERT INTO Vehiculo (Matricula, Marca, precio_diario, Estado) VALUES
('AAL-3214', 'Hyunday',   40.55, 'Disponible'),
('ALP-3145', 'BMW',       60.50, 'Disponible'),
('GHI-3456', 'Kia',       35.00, 'En mantenimiento'),
('JKL-7890', 'Nissan',    42.00, 'Alquilado'),
('XYZ-5678', 'Chevrolet', 38.50, 'Alquilado');

-- ------------------------------------------------------------
-- TABLA: Alquiler
-- ------------------------------------------------------------
INSERT INTO Alquiler (id_alquiler, fecha_inicio, fecha_fin, fecha_devolucion, Estado, CI_cliente, Matricula_v) VALUES
('ALQ-001', '2025-01-10', '2025-01-15', '2025-01-15', 'finalizado', '1103218594', 'AAL-3214'),
('ALQ-002', '2025-02-05', '2025-02-10', NULL,         'activo',     '0745897558', 'ALP-3145'),
('ALQ-003', '2025-02-20', '2025-02-24', '2025-02-25', 'finalizado', '1105203192', 'JKL-7890'),
('ALQ-004', '2025-03-01', '2025-03-04', NULL,         'cancelado',  '1458756628', 'GHI-3456'),
('ALQ-005', '2025-03-10', '2025-03-15', NULL,         'activo',     '1103218594', 'XYZ-5678');

-- ------------------------------------------------------------
-- TABLA: Pago
-- ------------------------------------------------------------
INSERT INTO Pago (id_pago, metodo_pago, Monto, fecha_de_pago, id_alquiler) VALUES
('PAG-001', 'efectivo',      202.75, '2025-01-15', 'ALQ-001'),
('PAG-002', 'transferencia', 302.50, '2025-02-05', 'ALQ-002'),
('PAG-003', 'efectivo',      168.00, '2025-02-25', 'ALQ-003'),
('PAG-004', 'transferencia', 105.00, '2025-03-01', 'ALQ-004'),
('PAG-005', 'efectivo',      192.50, '2025-03-10', 'ALQ-005');

-- ------------------------------------------------------------
-- TABLA: Multa
-- ------------------------------------------------------------
INSERT INTO Multa (id_multa, tipo_multa, Descripcion, Monto, Estado, id_alquiler) VALUES
('MUL-001', 'Devolución tardía', 'Vehículo devuelto 1 día después',  42.00, 'pagada',    'ALQ-003'),
('MUL-002', 'Daño en vehículo',  'Rayón en puerta delantera',        40.00, 'pendiente', 'ALQ-004'),
('MUL-003', 'Combustible',       'Tanque entregado vacío',           12.00, 'pagada',    'ALQ-001'),
('MUL-004', 'Devolución tardía', 'Vehículo devuelto 2 días después', 77.00, 'pendiente', 'ALQ-005');

-- ------------------------------------------------------------
-- TABLA: Garantia
-- ------------------------------------------------------------
INSERT INTO Garantia (id_garantia, tipo_documento, Estado, Monto, id_alquiler) VALUES
('GAR-001', 'Cédula de identidad',  'liberada',  50.00, 'ALQ-001'),
('GAR-002', 'Pasaporte',            'activa',    50.00, 'ALQ-002'),
('GAR-003', 'Licencia de conducir', 'liberada',  50.00, 'ALQ-003'),
('GAR-004', 'Cédula de identidad',  'ejecutada', 50.00, 'ALQ-004'),
('GAR-005', 'Pasaporte',            'activa',    50.00, 'ALQ-005');
