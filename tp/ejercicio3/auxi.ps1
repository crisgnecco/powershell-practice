param (
    [string]$Path = $(throw "-Path es parametro obligatorio!"),
    [string]$Resultado = $Path, # si no se ingresa, se usa el mismo path de analisis.
    [int]$Umbral # si no se ingresa, aca se asigna el tam promedio de archivos. en kB
)


$Resultado