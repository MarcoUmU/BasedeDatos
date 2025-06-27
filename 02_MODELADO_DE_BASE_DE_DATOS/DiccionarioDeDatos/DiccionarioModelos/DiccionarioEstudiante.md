# 📘 Diccionario de Datos – Estudiante

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `numEstudiante`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador del estudiante               |
| `Nombre`        | NVARCHAR      | 50    | ❌  | ❌  | ❌   | ❌     | -             | -                                | Nombre de pila del estudiante             |
| `Matricula`          | INT          | -      | ❌  | ❌  | ❌   | ✅     | -         | -                                | Matricula del estudiante                        |
| `ApPaterno`        | NVARCHAR      | 50    | ❌  | ❌  | ❌   | ✅     | -                   | -                                | Apellido paterno del estudiante                      |
| `ApMaterno`      | NVARCHAR          | -      | ❌  | ❌  | ✅   | ❌     | -                                        | -              | Apellido materno del estudiante   |
