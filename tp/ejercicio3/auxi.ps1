param (
    [string]$Path = $(throw "-Path es parametro obligatorio!"),
    [string]$resultado, # = TODO: agregar path por defecto si no se ingresa nada. 
    [int]$umbral = 100 # TODO: aca por def iria el promedio de peso de archivos.

)
write-output "el path es $path"
write-output "el path res es $resultado"
write-output "el umbral es $umbral"