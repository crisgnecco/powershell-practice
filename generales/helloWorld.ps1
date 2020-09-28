
# Recursos: https://www.tutorialspoint.com/powershell/powershell_operators.htm

#Write-Host "Hello, World!"

$variable = 10
$date = Get-Date # crear variable, puedo asignarle cualquier objeto (cmdlet)

#Special Variables / global variables
#$ARGS # Represents an array of the undeclared parameters and/or parameter values that are passed to a function, script, or script block
#$HOME # trae el path de home
#$location | Get-Member	# obtener los miembros de una var


if ($variable -gt 9) {
    Write-Output "es mayor!!"
    $date
} 

# > (Redirectional Opeator: redirecciona la salida para ser impresa en un archivo o disp)

$date > textFile.txt # guardo la fecha actual en el archivo