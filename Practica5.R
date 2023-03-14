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




