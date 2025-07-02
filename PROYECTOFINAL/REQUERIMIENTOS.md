# Requerimientos del proyecto RANDOMPLAY
## Descripción General:
La tienda física "Random Play", ubicada en una zona de alto tráfico peatonal,
ofrece servicios de venta y renta de películas en formatos DVD y Blu-Ray, además
de un sistema de membresías para clientes frecuentes. Actualmente, el control
se realiza manualmente o por medio de hojas de Excel, lo que ha provocado:

- Descontrol del inventario.

- Falta de seguimiento en devoluciones.

- Registro deficiente de rentas y ventas.

- Imposibilidad de generar reportes de manera confiable.

El nuevo sistema de información busca digitalizar y automatizar estos procesos
para mejorar la gestión de la tienda.
Objetivo del Sistema
Desarrollar una base de datos que permita gestionar de manera eficiente:

- El inventario de películas

- Las operaciones de venta y renta.

- La información de clientes y membresías.

- La generación de reportes automáticos.

---

**Operaciones clave del sistema**

### Inventario de Películas

Cada película debe registrarse con: título, formato (DVD/Blu-Ray), género, año,
idioma, clasificación y stock.
Se debe llevar el control del número de copias disponibles.
Registrar precio de venta y de renta.

### Clientes
Registrar datos del cliente: nombre completo, dirección, correo, teléfono y si tiene
membresía activa.
Un cliente puede realizar múltiples compras o rentas.

### Membresías
Registro de tipo de membresía (estándar, premium).
Fecha de inicio y expiración.
Aplicación de descuentos automáticos según membresía.

### Ventas
Registrar venta de películas: cliente, fecha, títulos, precio.
Actualizar automáticamente el inventario.

### Rentas
Registrar nueva renta: cliente, película, fecha de inicio y fecha de devolución.
Calcular recargos por retraso si aplica.
Controlar estado: rentada, devuelta, con retraso.

### Reportes
Reporte diario/semanal/mensual de ventas y rentas.
Listado de películas más rentadas o más vendidas.
Estado del inventario actual.


---
