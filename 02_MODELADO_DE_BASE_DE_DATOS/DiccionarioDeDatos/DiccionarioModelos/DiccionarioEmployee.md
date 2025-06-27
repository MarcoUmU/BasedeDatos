# 📘 Diccionario de Datos – Employee

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `EmployeeID`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador del employee               |
| `SSN`        | INT      | -    | ❌  | ❌  | ❌   | ✅     | -             | -                                | SSN del employee             |
| `firstName`          | NVARCHAR          | 50      | ❌  | ❌  | ❌   | ❌     | -         | -                                | Primer apellido del doctor                        |
| `lastName`        | NVARCHAR      | 50    | ❌  | ❌  | ❌   | ❌     | -                  | -                                | Segundo apellido                      |
| `Name`      | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ❌     | -                                        | -               | Nombre del Employee    |
| `salary`      | int          | -      | ❌  | ❌  | ❌   | ❌     | -                                        | -               | Salario de usuario   |
| `birthdaty`      | date          | -      | ❌  | ❌  | ❌   | ❌     | -                                        | -               | Fecha de cumpleaños   |
| `address`      | NVARCHAR          | 50      | ❌  | ❌  | ❌   | ❌     | -                                        | -               | Direccion del empleado   |
| `sex`      | NVARCHAR          | 10      | ❌  | ❌  | ❌   | ❌     | -                                        | -               | Genero del empleado   |