#APL 2
#Ejercicio 1
#Integrantes:
#- Castro Gonzalo 41639230
#- Gnecco Cristian 40024360
#- Messina Gonzalo 38130447
#- Pernas Agustin Baltazar 42301787
#- Rodriguez Nicolas 41666941

Param (
 [Parameter(Position = 1, Mandatory = $false)]
 [String] $pathSalida = ".\procesos.txt ",
 [int] $cantidad = 3
)

# validar que la cantidad no sea negativa.
if ($cantidad -lt 0) {
    throw "la cantidad a mostrar debe ser mayor a 0"
}

$existe = Test-Path $pathSalida
if ($existe -eq $true) {

 $procesos = Get-Process | Where-Object { $_.WorkingSet -gt 100MB }

 $procesos | Format-List -Property Id,Name >> $pathSalida

 for ($i = 0; $i -lt $cantidad ; $i++) { #3
 Write-Host $procesos[$i].Id - $procesos[$i].Name
 }
} else {
 Write-Host "El path no existe"
}



#1. ¿Cuál es el objetivo del script?

#   Busca los procesos que estan ocupando mas de 100MB de memoria RAM, guarda ID y nombre 
#   en el pathSalida e imprime los {cantidad} primeros procesos por pantalla.

#2. ¿Agregaría alguna otra validación a los parámetros?

#   Validaria que el valor de cantidad sea mayor o igual a 0.

#3. ¿Qué sucede si se ejecuta el script sin ningún parámetro?

#   Lo que sucede es que el archivo de salida por defecto 
#   (que se asigna cuando el user no ingresa ningun path)
#   no existe. Por lo tanto, no sera un archivo valido.
#   si lo creamos previamente, ya sea dentro o fuera del script, 
#   funcionara sin problemas. 


#APL 2
#Ejercicio 1
#Integrantes:
#- Castro Gonzalo 41639230
#- Gnecco Cristian 40024360
#- Messina Gonzalo 38130447
#- Pernas Agustin Baltazar 42301787
#- Rodriguez Nicolas 41666941


