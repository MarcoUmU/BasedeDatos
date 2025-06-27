# 📘 Diccionario de Datos – Libros

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `numLibro`     | INT          | -      | ✅  | ❌  | ❌   | ✅     |  -                                        | -                                | Identificador del libro               |
| `ISBN`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅     | -             | -                                | Numero del libro             |
| `Autor`          | NVARCHAR          | 50      | ❌  | ❌  | ❌   | ❌     | -         | -                                | Nombre del autor                        |
| `Titulo`        | NVARCHAR      | 50    | ❌  | ❌  | ❌   | ❌     | -                   | -                                | Nombre del libro                      |
| `Cantidad`      | INT          | -      | ❌  | ❌  | ❌   | ❌     | -                                        | -               | Cantidad de un libro    |
