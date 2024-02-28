/* 🍉 Ejercicio 1:
Previamente a la práctica debes tener en consideración que las ventas netas son aquellas que se les resta el valor de la columna descuento.
Las ventas brutas son sin el descuento.
Análisis de Ventas
¿Cuál fue la cantidad (no suma de las ventas)total vendida de todos los productos?
*/
SELECT SUM(qty) as Total_cantidad_Vendida
FROM ventas;

-- Cantidad Vendida por id_producto
SELECT id_producto, SUM(qty) as cantidad
FROM ventas
GROUP BY id_producto;

-- ¿Cuál es el ingreso total generado por todos los productos antes de los descuentos
SELECT SUM(qty*precio) As ventas_bruta
FROM ventas;

-- ¿Cuál es el ingreso medio generado por todos los productos antes de descuentos?
SELECT AVG(qty*precio) as media_ventas_brutas
FROM ventas;

-- ¿Cuál es el ingreso total generado por cada producto antes de los descuentos?
SELECT p.nombre_producto, SUM(qty*p.precio) as ventas_brutas
FROM ventas
LEFT JOIN producto_detalle p 
ON ventas.id_producto = p.id_producto
GROUP BY p.nombre_producto
ORDER BY ventas_brutas DESC;

SELECT id_producto, SUM(qty*precio) as ventas_brutas
FROM ventas
GROUP BY id_producto;

-- ¿Cuál fue el monto total del descuento para todos los productos?
SELECT SUM(descuento) as total_descuento
FROM ventas;

-- ¿Cuál fue el monto total del descuento por cada producto?
SELECT nombre_producto, SUM(descuento) as descuento
FROM ventas
LEFT JOIN producto_detalle p
ON ventas.id_producto = p.id_producto
GROUP BY nombre_producto
ORDER BY 2 DESC;
