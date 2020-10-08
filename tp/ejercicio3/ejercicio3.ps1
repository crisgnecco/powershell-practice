#APL 2
#Ejercicio 3
#Integrantes:
#- Castro Gonzalo 41639230
#- Gnecco Cristian 40024360
#- Messina Gonzalo 38130447
#- Pernas Agustin Baltazar 42301787
#- Rodriguez Nicolas 41666941

<#
.synopsis
    Determina la existencia de archivos duplicados en el File System 
    y cuales archivos superan en tamaño un umbral determinado(en KB).
    Si no se ingresa umbral, se tomara como umbral el peso promedio 
    de los archivos.

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

### validaciones

if( !(Test-Path $Path)){
    throw "-Path invalido!"
} 

if($Umbral -and $Umbral -lt 1){
    throw "-Umbral debe ser mayor o igual a 1!"
}

if( $Resultado -and !(Test-Path $Resultado)){
    throw "-Resultado invalido!"
} 

###     genero el nombre del archivo

# aca se uso los dos puntos latinos ya que los dos puntos de US son reservados.
$date=Get-Date -Format "yyyy-MM-dd_HH꞉mm꞉ss" 
$path_informe="./resultado_$date.out"


###     Calcular el promedio de pesos para umbral por defecto

# recorro todos los archivos del dir actual y subdireactorios
$files=Get-ChildItem -Name $Path -File -Recurse     

foreach ( $file in $files ) { #separa por " "

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
$duplicadosArray = @() #para saber si ya guarde duplicado de ese file.


foreach ( $file in $files ) { 

    if ($file.Length -gt $umbral) {

        #guardo path completo y tamanio en hash table
        $superanUmbralHashTable["$file"] = $file.Length
    } 

    ### por cada file, busco uno con el mismo nombre pero diff carpeta

    $nameFile = Split-Path $file -leaf
    $esPrimerDuppDeEsteArchivo = 0

    if( ! $duplicadosArray.Contains($nameFile)){

        foreach ( $file2 in $files ) { 
            
            # obtengo los nombres de los arch
            $nameFile2 = Split-Path $file2 -leaf
            
            if ( ( !($file2 -eq $file)) -and $nameFile -eq $nameFile2 ) { #               
                
                if($esPrimerDuppDeEsteArchivo -eq 0){
                    
                    # la primera vez q encuentre dup, guarda nombre y la primera ruta, luego solo guardara la ruta de los dupp.
                    "-----------------------" >> $path_informe 
                    
                    "Nombre: $nameFile " >> $path_informe 
                    " " >> $path_informe
                    "Path: $file " >> $path_informe #path

                    ### armo la ruta para fecha.
                    if($Path -eq "."){  
                        $item = Get-Item $Path/$file
                    }else {
                        $item = Get-Item $Path/$file
                    }

                    $item.LastWriteTime >> $path_informe
                    " " >> $path_informe

                    $duplicadosArray += $nameFile
                    $esPrimerDuppDeEsteArchivo = 1
                }
                 
                "Path: $file2" >> $path_informe #path

                if($Path -eq "."){ 
                    $item2 = Get-Item $Path/$file2
                }else {
                    $item2 = Get-Item $Path/$file2
                }

                $item2.LastWriteTime >> $path_informe
                " " >> $path_informe
            }
            
        }
    }
}
# ordeno de forma descendente
$superanUmbralEnum = $superanUmbralHashTable.GetEnumerator() | Sort-Object -Property Value -Descending

$superanUmbralEnum | Out-File -LiteralPath $path_informe -Append

$content = Get-Content -Path $path_informe

$content | Format-Table 

#APL 2
#Ejercicio 3
#Integrantes:
#- Castro Gonzalo 41639230
#- Gnecco Cristian 40024360
#- Messina Gonzalo 38130447
#- Pernas Agustin Baltazar 42301787
#- Rodriguez Nicolas 41666941