

<#

.synopsis
    Programa de practica en clase
.example
    .\clase.ps1

#>

[CmdletBinding()]
param (
    [Parameter()]
    [TypeName]
    $ParameterName1
   
)

#write-host "Hola!!" -BackgroundColor "red"


$val1=2 #param1
$val2=3 #param2

if ($val1 -eq $val2) {
    "son iguales!"
}else {
    "son diff!"
}

New-Variable -Name CONST_TEST -Option Constant #var constante.