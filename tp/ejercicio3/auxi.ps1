param (
    [string]$Path = $(throw "-Path es parametro obligatorio!"),
    [string]$resultado, # = TODO: agregar path por defecto si no se ingresa nada. 
    [int]$umbral = 100 # TODO: aca por def iria el promedio de peso de archivos.

)
write-output "The price is $price"
write-output "The Computer Name is $ComputerName"
write-output "The True/False switch argument is $SaveData"