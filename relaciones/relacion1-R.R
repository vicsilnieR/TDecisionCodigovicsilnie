source("funciones/teoriadecision_funciones_incertidumbre.R")

tb01a <- crea.tablaX(c(5, 4, 6,
                       2, 3, 1,
                       -1, 8, 7,
                      5, 2, 0), numalternativas = 4, numestados = 3)

## Criterio de Wald (pesimista)

criterio.Wald(tb01a, favorable = TRUE)

## Criterio optimista

criterio.Optimista(tb01a, favorable = TRUE)

## Criterio de Hurwicz

criterio.Hurwicz(tb01a, alfa = 0.4, favorable = TRUE)
dibuja.criterio.Hurwicz(tb01a, favorable = TRUE)
dibuja.criterio.Hurwicz_Intervalos(tb01a, favorable = TRUE)

## Criterio de Savage (minimax de pérdidas)

criterio.Savage(tb01a, favorable = TRUE)

## Criterio de Laplace

criterio.Laplace(tb01a, favorable = TRUE)

## Criterio de punto ideal

criterio.PuntoIdeal(tb01a, favorable = TRUE)

## Tabla resumen de todos los criterios

criterio.Todos(tabla = tb01a, alfa = 0.4, favorable = TRUE)


## EJERCICIO 5

# Planteamiento del problema

# Alternativas

# d1: La música loca
# d2: El baratito
# d3: Cerca de casa

# Estados de la naturaleza (incertumbre)

# e1: comer, copas y taxi
# e2: comer, no toman copas y van andando

(m11 <- 60 * 2 + 5)
(m12 <- 60 * 2)
(m21 <- 70 * 2 + 16)
(m22 <- 30 * 2)
(m31 <- 65 * 2)
(m32 <- 40 * 2)
tb05 <- crea.tablaX(c(m11, m12,
                       m21, m22,
                       m31, m32), numalternativas = 3, numestados = 2)


#Resumen de los criterios. OJO ES DE COSTES
criterio.Todos(tabla = tb05, alfa = 0.4, favorable = FALSE)

library(tinytable)

# Representación gráfica Hurwicz

dibuja.criterio.Hurwicz(tb05, favorable = FALSE)
dibuja.criterio.Hurwicz_Intervalos(tb05, favorable = FALSE)

# Puntos de corte Hurwicz


## Ejercicio 6

# Planteamiento del problema

# Un decisor (dos personas que deciden de forma independiente)
# Modelo de beneficios (favorable = TRUE). Van a usar los 900 euros

# Alternativas

# d1: Invertir en renta variable 25%
# d2: Invertir en renta variable 50%
# d3: Invertir en renta variable 75%

# Estados de la naturaleza (incertidumbre)

# e1: Bolsa sube
# e2: Bolsa baja

(m11 <- 1000 * 0.25 * 0.1 + 1000 * 0.75 * 0.04)
(m12 <- - 1000 * 0.25 * 0.1 + 1000 * 0.75 * 0.04)
(m21 <- 1000 * 0.5 * 0.1 + 1000 * 0.5 * 0.04)
(m22 <- - 1000 * 0.5 * 0.1 + 1000 * 0.5 * 0.04)
(m31 <- 1000 * 0.75 * 0.1 + 1000 * 0.25 * 0.04)
(m32 <- - 1000 * 0.75 * 0.1 + 1000 * 0.25 * 0.04)
tb06 <- crea.tablaX(c(m11, m12,
                       m21, m22,
                       m31, m32), numalternativas = 3, numestados = 2,
                      nb_alternativas = c("A1. 25% RV", "A2. 50% RV", "A3. 75% RV"),
                      nb_estados = c("E1. Bolsa sube", "E2. Bolsa baja"))
tb06

#Resumen de los criterios. OJO ES DE BENEFICIOS

res06 <- criterio.Todos(tabla = tb06, alfa = 0.5, favorable = TRUE)
res06
tabla6_presentacion <- tt(res06)

## Ejercicio 7
# Planteamiento del problema
# Alternativas

# d1: Invertir en negocio de un amigo
# d2: Invertir en un negocio de alquiler de biciletas
# d3: Invertir en un chiringuito

# Estados de la naturaleza (incertidumbre)
# e1: Hace buen tiempo
# e2: Hace mal tiempo

### Tomar la decisión pensando en EL COSTE QUE TIENE TOMAR LA DECISIÓN EQUIVOCADA: Criterio Savage
### Tomar la decisión siendo una persona CONSERVADORA: Criterio Wald

(m11 <- 900 * 0.05)
(m12 <- 900 * 0.05)
(m21 <- 900 * 0.6)
(m22 <- -900 * 0.2)
(m31 <- 900 * 1)
(m32 <- -900 * 1)

tb07 <- crea.tablaX(c(m11, m12,
                       m21, m22,
                       m31, m32), numalternativas = 3, numestados = 2,
                      nb_alternativas = c("A1. Negocio amigo", "A2. Alquiler bicis", "A3. Chiringuito"),
                      nb_estados = c("E1. Buen tiempo", "E2. Mal tiempo"))

tb07
#Resumen de los criterios. OJO ES DE BENEFICIOS

res07 <- criterio.Todos(tabla = tb07, alfa = 0.5, favorable = TRUE)
res07

elección_María <- criterio.Wald(tb07, favorable = TRUE)
elección_amigo <- criterio.Savage(tb07, favorable = TRUE)
elección_María
elección_amigo


## Ejercicio 8

# Planteamiento del problema

# Un decisor
# Modelo de ganancias totales (favorable = TRUE). "Beneficios - Costos"

# Alternativas

# d1: Autopublicar
# d2: Buscar editorial

# Estados de la naturaleza (incertidumbre)

# e1: Libro tiene éxito
# e2: Libro no tiene éxito

(m11 <- -90000 + 200000 * 2)
(m12 <- -90000 + 10000 * 2)
(m21 <- 20000 + 200000 * 1)
(m22 <- 20000 + 10000 * 1)

tb08 <- crea.tablaX(c(m11, m12,
                       m21, m22) / 1000, numalternativas = 2, numestados = 2,
                      nb_alternativas = c("A1. Autopublicar", "A2. Buscar editorial"),
                      nb_estados = c("E1. Éxito", "E2. No éxito"))

tb08 #Expresado en miles de euros

#Resumen de los criterios. OJO ES DE BENEFICIOS

res08 <- criterio.Todos(tabla = tb08, alfa = 0.5, favorable = TRUE)
res08
