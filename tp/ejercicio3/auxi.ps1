#Si el archivo está en UTF8 se ven bien los dos puntos
#Si utilizas codificación ASCII te va a mostrar cualquier cosa
#incluso puede verse otro caracter por consola
#pero el nombre del archivo de salida debería verse bien
#en el explorador de windows

$date=Get-Date -Format "yyyy-MM-dd_HH꞉mm꞉ss" 
$path_informe="./resultado_$date.out"
"prueba de escritura de arch" | Out-File -LiteralPath $path_informe


### uso dos puntos latino (˸) ya que el dos puntos de US : es caracter reservado y no se puede escapear.