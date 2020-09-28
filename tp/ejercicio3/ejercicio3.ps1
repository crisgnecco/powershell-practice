<#
.synopsis
    determina la existencia de archivos duplicados en el File System 
    y cuales archivos superan en tamanio un umbral determinado.
 

.example
    .\ejercicio3.ps1 -Path . -Resultado . -Umbral 1
    .\ejercicio3.ps1 -Path . -Resultado .
    .\ejercicio3.ps1 -Path .
#>

param (
    [string]$Path = $(throw "-Path es parametro obligatorio!"),
    [string]$Resultado = $Path, # si no se ingresa, se usa el mismo path de analisis.
    [int]$Umbral # si no se ingresa, aca se asigna el tam promedio de archivos. en kB
)


###     Calcular el promedio de pesos para umbral por defecto

# recorro todos los archivos del dir actual y subdireactorios
$files=Get-ChildItem -Name $Path -File -Recurse     

foreach ( $file in $files ) { #separa por " "
    
    #Write-Host $file
    #Write-Host $file.Length

    $acum += $file.Length
    $cont++
}

$promedioPesos = $acum / $cont #aca es un Long

### Si no se ingreso umbral por parametro, asigno el promedio de pesos

if ( -not $umbral ) { # si no se paso por parametro
    $umbral = $promedioPesos
    Write-Host "umbral por defecto: $umbral"
}else {

    #convierto a bytes
    $umbral = $umbral * 1024    
    Write-Host "umbral de usuario: $umbral"
}


### Main ###
$superanUmbralHashTable = @{}

foreach ( $file in $files ) { 

    if ($file.Length -gt $umbral) {
        "supera"

        #guardo path completo y tamanio en hash table
    
        #you cannot use an integer as an index into the hash table
        $superanUmbralHashTable["$file"] = $file.Length
    } 
}

### TODO: ordeno hashTable descendente
# grabo >> agrega al final

$superanUmbralHashTable