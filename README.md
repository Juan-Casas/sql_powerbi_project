# sql_powerbi_project

# 📊 Dashboard de Análisis de Ventas con SQL + Power BI
Este proyecto muestra cómo se puede transformar y analizar una base de datos de ventas utilizando SQL y Power BI, conectando ambas herramientas para generar visualizaciones interactivas y extraer insights comerciales clave.

## 🧠 Objetivo
Construir un dashboard profesional conectando Power BI a una base local de PostgreSQL, utilizando SQL para obtener indicadores relevantes como el ticket promedio, las ventas por producto, el comportamiento mensual y más.

## 📂 Dataset utilizado
- Dataset de ventas estilo e-commerce.
- Contiene facturas, productos, cantidades, precios, clientes y países.
- Fuente: E-Commerce de Kaggle.

## 🧪 KPIs calculados
Las siguientes consultas SQL fueron utilizadas para obtener las métricas clave:

### 📅 Ventas por producto/mes
```
SELECT descripcion, DATE_TRUNC('month', fechafactura) AS mes,
       SUM(cantidad) AS total_vendido,
       SUM(preciounitario * cantidad) AS precio_total
FROM ventas
GROUP BY descripcion, DATE_TRUNC('month', fechafactura)
ORDER BY descripcion ASC, mes ASC, total_vendido DESC;
```

### 💳 Ticket promedio por día
```
SELECT fecha AS dia,
       ROUND(AVG(total_factura), 2) AS ticket_promedio_diario
FROM (
  SELECT numeroFactura,
         DATE(fechaFactura) AS fecha,
         SUM(cantidad * precioUnitario) AS total_factura
  FROM ventas
  GROUP BY numeroFactura, DATE(fechaFactura)
) AS facturas_por_dia
GROUP BY fecha
ORDER BY fecha;
```

💰 Ventas totales por día
```
SELECT DATE(fechaFactura) AS dia,
       ROUND(SUM(cantidad * precioUnitario), 2) AS total_ventas
FROM ventas
GROUP BY dia
ORDER BY dia;
```

🧾 Facturación total por producto
```
SELECT descripcion,
       ROUND(SUM(cantidad * precioUnitario), 2) AS total_facturado
FROM ventas
GROUP BY descripcion
ORDER BY total_facturado DESC;
```
