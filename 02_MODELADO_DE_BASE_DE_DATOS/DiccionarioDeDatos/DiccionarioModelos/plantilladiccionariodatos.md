# 📘 Diccionario de Datos – Doctores

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `IDdoctor`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador del doctor               |
| `nombrePila`        | NVARCHAR      | 50    | ❌  | ❌  | ❌   | ❌     | -            | -                                | Nombre de pila del doctor             |
| `apellido1`          | NVARCHAR          | 50      | ❌  | ❌  | ❌   | ❌     | -         | -                                | Apellido Paterno del doctor                        |
| `apellido2`        | NVARCHAR      | 50    | ❌  | ❌  | ✅   | ❌     | -                   | -                                | Apellido materno del doctor                      |
