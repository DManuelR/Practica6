set.seed(1)
z <- rnorm(100)
x <- rpois(100, 10.3)
y <- rbinom(100, 1, .25)
y1 <- 5*z+x*10+rnorm(100,2,1)
y2 <- 5*z+x*12+rnorm(100,2,1)

hist(y1)
hist(y2)

#nos interesa que no sean iguales a 0.
t.test(y1)
t.test(y2)

boxplot(y1, y2)


#2- Decimos que la correlación lineal es una prueba de correlación paramétrica porque asume que las variables involucradas en el análisis siguen una distribución normal y que la relación entre ellas es lineal.
# Las pruebas paramétricas y no paramétricas son diferentes en cuanto a las suposiciones que hacen sobre la distribución de los datos y en cuanto a los tipos de datos que pueden analizar.


#9- Una relación lineal se refiere a una relación entre dos variables que se puede representar por una línea recta. Por otro lado, una relación monótona se refiere a una relación entre dos variables que sigue un patrón creciente o decreciente, pero no necesariamente lineal.
# Generar datos para una relación lineal
set.seed(123)
horas_de_estudio <- rnorm(100, mean = 20, sd = 5)
promedio_de_calificacion <- horas_de_estudio * 0.5 + rnorm(100, mean = 70, sd = 10)

# Generar datos para una relación monótona
set.seed(123)
horas_de_estudio <- rnorm(100, mean = 20, sd = 5)
promedio_de_calificacion <- 100 - 1 / (horas_de_estudio + 1) + rnorm(100, mean = 0, sd = 5)

# Graficar las relaciones
par(mfrow=c(1,2))
plot(horas_de_estudio, promedio_de_calificacion, main = "Relación lineal")
plot(horas_de_estudio, promedio_de_calificacion, main = "Relación monótona")
#El primer gráfico muestra la relación lineal entre las dos variables. Podemos ver que la nube de puntos sigue una línea recta, lo que indica una relación lineal positiva entre las variables. En cambio, el segundo gráfico muestra la relación monótona entre las dos variables. Podemos ver que la nube de puntos no sigue una línea recta, pero sí sigue un patrón creciente general.



#10- Se suele aplicar la correlación de rangos de Spearman. Con un par de vectores, por ejemplo, utilizamos cor.test(x, y, method = "spearman").






