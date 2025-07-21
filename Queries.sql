SELECT * FROM ventas;

SELECT * FROM ventas LIMIT 5;

SELECT * FROM ventas WHERE descripcion = 'SILVER BLACK ORBIT BRACELET';

SELECT descripcion, SUM(cantidad) AS total_vendido, SUM(preciounitario * cantidad) AS precio_total
FROM ventas 
GROUP BY descripcion 
ORDER BY total_vendido DESC;

/*Ventas por producto/mes*/
SELECT descripcion, DATE_TRUNC('month', fechafactura) AS mes, SUM(cantidad) AS total_vendido, SUM(preciounitario * cantidad) AS precio_total
FROM ventas
GROUP BY descripcion, DATE_TRUNC('month', fechafactura)
ORDER BY descripcion ASC, mes ASC, total_vendido DESC;
/*Ventas por producto/mes*/


/*Ticket promedio*/
SELECT
  fecha AS dia,
  ROUND(AVG(total_factura), 2) AS ticket_promedio_diario
FROM (
  SELECT
    numeroFactura,
    DATE(fechaFactura) AS fecha,
    SUM(cantidad * precioUnitario) AS total_factura
  FROM ventas
  GROUP BY numeroFactura, DATE(fechaFactura)
) AS facturas_por_dia
GROUP BY fecha
ORDER BY fecha;
/*Ticket promedio*/

/*Ventas por dia*/
SELECT
  DATE(fechaFactura) AS dia,
  ROUND(SUM(cantidad * precioUnitario), 2) AS total_ventas
FROM ventas
GROUP BY dia
ORDER BY dia;
/*Ventas por dia*/

/*Facturacion por producto*/
SELECT
  descripcion,
  ROUND(SUM(cantidad * precioUnitario), 2) AS total_facturado
FROM ventas
GROUP BY descripcion
ORDER BY total_facturado DESC
/*Facturacion por producto*/













