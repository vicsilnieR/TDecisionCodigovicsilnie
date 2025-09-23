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
