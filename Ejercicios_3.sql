/*🍉 Ejercicio 3
Análisis de Producto 
¿Cuántas son los tres productos principales por ingresos totales antes del descuento?
devolver el nombre
*/
SELECT nombre_producto,
SUM(qty*v.precio) as ventas_brutas
FROM ventas v
LEFT JOIN producto_detalle p 
ON p.id_producto = v.id_producto
GROUP BY nombre_producto
ORDER BY ventas_brutas desc
LIMIT 3;

#¿Cuál es la cantidad total, los ingresos y el descuento de cada segmento de producto?
SELECT nombre_segmento,
SUM(qty) as cantidad_productos,
SUM(qty*v.precio-descuento) as ventas_netas,
SUM(descuento) as descuento
FROM ventas v
LEFT JOIN producto_detalle p
ON v.id_producto = p.id_producto
GROUP BY nombre_segmento;

#¿Cuál es el producto más vendido para cada segmento?
SELECT nombre_segmento, nombre_producto,
SUM(qty*v.precio-descuento) as ventas_netas
FROM ventas v
LEFT JOIN producto_detalle p
ON v.id_producto = p.id_producto
GROUP BY nombre_segmento, nombre_producto
ORDER BY nombre_segmento, ventas_netas desc;

#¿Cuál es la cantidad total, los ingresos y el descuento para cada categoria?
SELECT nombre_categoria,
SUM(qty) as cantidad,
SUM(qty*v.precio-descuento) as ventas_netas,
SUM(descuento) as descuento
FROM ventas v
LEFT JOIN producto_detalle p
ON v.id_producto = p.id_producto
GROUP BY nombre_categoria;

#¿Cuál es el producto más vendido de cada categoria?
SELECT nombre_categoria,nombre_producto,
SUM(qty*v.precio-descuento) as ventas_netas
FROM ventas v
LEFT JOIN producto_detalle p
ON v.id_producto = p.id_producto
GROUP BY nombre_categoria, nombre_producto
ORDER BY ventas_netas desc
LIMIT 2;

#Cuáles son los 5 productos que menos venden
SELECT nombre_producto,
SUM(qty*v.precio-descuento) as ventas_netas
FROM ventas v
LEFT JOIN producto_detalle p
ON v.id_producto = p.id_producto
GROUP BY nombre_producto
ORDER BY ventas_netas asc
LIMIT 5;

#¿Cuál es la cantidad de productos vendidos para la categoria Mujer?
SELECT nombre_categoria,
SUM(qty) as cantidad_productis
FROM ventas v
LEFT JOIN producto_detalle p
ON v.id_producto = p.id_producto
WHERE nombre_categoria = 'Mujer'
GROUP BY nombre_categoria;
