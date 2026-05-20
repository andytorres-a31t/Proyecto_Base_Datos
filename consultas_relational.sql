-- ============================================================
-- Sistema de Gestión de Alquiler de Vehículos
-- ============================================================

-- ============================================================
--   1. ¿Qué clientes tienen pagos mayores a 150?
--      Mostrar nombre, estado del alquiler y monto del pago.
-- ------------------------------------------------------------
-- ÁLGEBRA RELACIONAL:
--   π Nombre, Estado, Monto (
--     σ Monto > 150 (
--       cliente
--       ⋈
--       (ρ CI_cliente → cedula (
--         alquiler
--         ⋈
--         (ρ id_alquiler → id_alquiler (pago))
--       ))
--     )
--   )
-- ------------------------------------------------------------
-- SQL:
SELECT
    c.Nombre,
    a.Estado,
    p.Monto
FROM cliente c
INNER JOIN alquiler a
    ON c.cedula = a.CI_cliente
INNER JOIN pago p
    ON a.id_alquiler = p.id_alquiler
WHERE p.Monto > 150;

-- ============================================================
--   2. ¿Qué clientes tienen multas pendientes?
--      Mostrar nombre, estado del alquiler, monto y estado de la multa.
-- ------------------------------------------------------------
-- ÁLGEBRA RELACIONAL:
--   π Nombre, Estado, Monto, estadoMulta (
--     σ estadoMulta == 'pendiente' (
--       cliente
--       ⋈
--       (ρ CI_cliente → cedula (
--         alquiler
--         ⋈
--         (ρ Estado → estadoMulta (multa))
--       ))
--     )
--   )
-- ------------------------------------------------------------
-- SQL:
SELECT
    c.Nombre,
    a.Estado,
    m.Monto,
    m.Estado AS estadoMulta
FROM cliente c
INNER JOIN alquiler a
    ON c.cedula = a.CI_cliente
INNER JOIN multa m
    ON a.id_alquiler = m.id_alquiler
WHERE m.Estado = 'pendiente';

-- ============================================================
--   3. ¿Qué clientes con pasaporte tienen garantías?
--      Mostrar nombre, tipo de documento y estado de la garantía.
-- ------------------------------------------------------------
-- ÁLGEBRA RELACIONAL:
--   π Nombre, tipo_documento, estadoGarantia (
--     σ tipo_documento == 'Pasaporte' (
--       cliente
--       ⋈
--       (ρ CI_cliente → cedula (
--         alquiler
--         ⋈
--         (ρ Estado → estadoGarantia (garantia))
--       ))
--     )
--   )
-- ------------------------------------------------------------
-- SQL:
SELECT
    c.Nombre,
    g.tipo_documento,
    g.Estado AS estadoGarantia
FROM cliente c
INNER JOIN alquiler a
    ON c.cedula = a.CI_cliente
INNER JOIN garantia g
    ON a.id_alquiler = g.id_alquiler
WHERE g.tipo_documento = 'Pasaporte';

-- ============================================================
--   4. ¿Qué clientes tienen un vehículo disponible?
--      Mostrar nombre, apellido, cédula, marca y estado del vehículo.
-- ------------------------------------------------------------
-- ÁLGEBRA RELACIONAL:
--   π Nombre, Apellido, cedula, Marca, estadoV (
--     σ estadoV == 'Disponible' (
--       cliente
--       ⋈
--       (ρ CI_cliente → cedula (
--         alquiler
--         ⋈
--         (ρ Matricula → Matricula_v (
--           ρ Estado → estadoV (vehiculo)
--         ))
--       ))
--     )
--   )
-- ------------------------------------------------------------
-- SQL:
SELECT
    c.Nombre,
    c.Apellido,
    c.cedula,
    v.Marca,
    v.Estado AS estadoV
FROM cliente c
INNER JOIN alquiler a
    ON c.cedula = a.CI_cliente
INNER JOIN vehiculo v
    ON a.Matricula_v = v.Matricula
WHERE v.Estado = 'Disponible';

-- ============================================================
--   5. Mostrar nombre, apellido, cédula del cliente, marca y estado
--      del vehículo, y monto del pago, de alquileres con monto > 150.
-- ------------------------------------------------------------
-- ÁLGEBRA RELACIONAL:
--   π Nombre, Apellido, cedula, Marca, estadoV, Monto (
--     σ Monto > 150 (
--       cliente
--       ⋈
--       (ρ CI_cliente → cedula (
--         (
--           (ρ Matricula_v → Matricula (alquiler))
--           ⋈
--           (ρ Estado → estadoV (vehiculo))
--         )
--         ⋈
--         (ρ id_alquiler → id_alquiler (pago))
--       ))
--     )
--   )
-- ------------------------------------------------------------
-- SQL:
SELECT
    c.Nombre,
    c.Apellido,
    c.cedula,
    v.Marca,
    v.Estado AS estadoV,
    p.Monto
FROM cliente c
INNER JOIN alquiler a
    ON c.cedula = a.CI_cliente
INNER JOIN vehiculo v
    ON a.Matricula_v = v.Matricula
INNER JOIN pago p
    ON a.id_alquiler = p.id_alquiler
WHERE p.Monto > 150;
