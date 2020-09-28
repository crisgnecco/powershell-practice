<#
.synopsis
    determina la existencia de archivos duplicados en el File System 
    y cuales archivos superan en tamanio un umbral determinado.
 

.example
    .\clase.ps1
#>

[CmdletBinding()]
param (
    [Parameter()]
    [TypeName]
    $ParameterName
)

$param1



### recorro todos los archivos del dir actual y subdireactorios
$files=Get-ChildItem -File -Recurse

foreach ( $file in $files ) { #separa por " "
    #Write-Host $file
}



