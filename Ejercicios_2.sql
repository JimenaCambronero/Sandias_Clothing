/*🍉 Ejercicio 2
Análisis de Transacciones
¿Cuántas transacciones únicas hubo? (El campo de transacciones es el id_txn de la tabla ventas)
*/
SELECT COUNT(Distinct(id_txn))
FROM ventas;

-- ¿Cuáles son las ventas totales brutas de cada transacción?
SELECT id_txn, SUM(qty*precio) as ventas_brutas
FROM ventas
GROUP BY id_txn
ORDER BY ventas_brutas DESC;

-- ¿Qué cantidad de productos totales se compran en cada transacción?
SELECT id_txn, SUM(qty) AS cantidad_prod_transaccion
FROM ventas
GROUP BY id_txn;

-- Ordena el resultado anterior de mayor a menor cantidad de productos.
SELECT id_txn, SUM(qty) AS cantidad_prod_transaccion
FROM ventas
GROUP BY id_txn
ORDER BY cantidad_prod_transaccion DESC;

-- ¿Cuál es el valor de descuento promedio por transacción?
SELECT id_txn, AVG(descuento) as media_descuento_txn
FROM ventas
GROUP BY id_txn;

-- ¿Cuál es el ingreso promedio neto para transacciones de miembros “t”?
SELECT id_txn, AVG(qty*precio-descuento) as media_ventas_netas
FROM ventas
WHERE miembro = 't'
GROUP BY id_txn
ORDER BY media_ventas_netas DESC;
