# 📘 Diccionario de Datos – Vehiculos

**tabla clientes**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `numCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador del cliente               |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | -             | -                                | Nombre completo del cliente             |
| `Apellido1`          | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ❌     | -         | -                                | Apellido del cliente                        |
| `Apellido2`        | VARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | -                   | -                                | Apellido 2 del cliente                      |