
## RELACIÓN BINARIA NO BORROSA DE PREFERENCIA-INDIFERENCIA

## Método maximales

# Veremos un 1 en la tabla si a_i domina a_j, este método suma por columnas las alternativas
# dominadas y escoge la de menor suma como la mejor alternativa. Usando esta función
# tomaremos la de mayor suma puesto que está sumando a cuantas domina. 
# Ante empates hay que ver si hay alguna alternativa que domine a las otras empatadas.
# (1-1) o (1-0) o (0-1) para ver si hay indiferencia o preferencia.

source("funciones/teoriadecision_funciones_multicriterio.R")

## Ejercicio 1

# Maximales no borrosos

tb01a <- multicriterio.crea.matrizvaloraciones(c(1, 0, 1,
                                                1, 1, 1,
                                                0, 0, 1),
                                              numalternativas = 3) 
multicriterio.constfuncutilidad.maximales(tb01a)
soltb01a <- multicriterio.constfuncutilidad.maximales(tb01a)
sort(soltb01a, TRUE)

tb01b <- multicriterio.crea.matrizvaloraciones(c(1, 0, 1,
                                                1, 1, 1,
                                                1, 0, 1),
                                              numalternativas = 3) 
multicriterio.constfuncutilidad.maximales(tb01b)
soltb01b <- multicriterio.constfuncutilidad.maximales(tb01b)
sort(soltb01b, TRUE)

tb01d <- multicriterio.crea.matrizvaloraciones(c(1, 1, 1, 0, 1,
                                                 0, 1, 0, 0, 1,
                                                 1, 0, 1, 0, 1,
                                                 1, 1, 1, 1, 0,
                                                 0, 0, 0, 0, 1),
                                              numalternativas = 5)
multicriterio.constfuncutilidad.maximales(tb01d)
soltb01d <- multicriterio.constfuncutilidad.maximales(tb01d)
sort(soltb01d, TRUE)

multicriterio.constfuncutilidad.estructuraborrosa(tb01d)

## Ejercicio 3

# 1 Crear matriz de decisión
# 2 Homogeneizar criterios (si es necesario)
# 3 Crear matriz de valoraciones

## Método Nadir: tomar max y min de cada columna, (Valor - min) / (max - min)
## Cuando me enfrento a costos => cambio de signos en la columna.

tb03_ini <- multicriterio.crea.matrizdecision(c(100, 15, 7, 40, 50,
                                                200,25, 7, 60, 200,
                                                100, 20, 4, 25, 25,
                                                200, 30, 20, 70, 350,
                                                250, 25, 15, 100, 500),
                                              numalternativas = 5,
                                              numcriterios = 5)
tb03_Nadir <- multicriterio.homogeneizacion.nadir(tb03_ini)

tb03_promethee <- multicriterio.homogeneizacion.promethee(tb03_ini,
                                                          v.delta.min = c(
                                                            30, 3, 4, 20, 100),
                                                          v.delta.max = c(
                                                            120, 12, 10, 60, 400)
                                                          )
tb03_promethee

## OJO: no aplicar los métodos anteriores puesto que estas matrices
# son alternativa-criterio y no alternativa-alternativa.
