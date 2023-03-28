library(MASS)
library(caret)
library(stats)
library(olsrr)
library(kableExtra)
library(knitr)
library(rmarkdown)

y_cuentas <- c(110,2,6,98,40,94,31,5,8,10)
x_distancia <- c(1.1,100.2,90.3,5.4,57.5,6.6,34.7,65.8,57.9,86.1)


plot(y_cuentas, x_distancia)
cor.test(y_cuentas, x_distancia)

hist(x_distancia, probability = TRUE) #x es la variable explicativa, no tiene forma de campana, no es normal, la regresión no se cumple siempre
lines(density(x_distancia))
shapiro.test(x_distancia) #con 10 variables, pocos datos, este test no es fiable, da una conclusión no valida, ya que da que es normal y es mentira.

xy <- y_cuentas*x_distancia
xy

x_cuadrado <- x_distancia^2
x_cuadrado

tabla_datos <- data.frame(y_cuentas, x_distancia, xy, x_cuadrado)
tabla_datos

kbl(tabla_datos)%>%
  kable_minimal()


sum_y <- sum(tabla_datos$y_cuentas)
sum_y
sum_x <- sum(tabla_datos$x_distancia)
sum_x
sum_xy <- sum(tabla_datos$xy)
sum_xy
sum_xcuadrado <- sum(tabla_datos$x_cuadrado)
sum_xcuadrado
sum_total <- c(sum_y, sum_x, sum_xy, sum_xcuadrado)
sum_total

tabla_datos2 <- rbind(tabla_datos, sum_total)
tabla_datos2
rownames(tabla_datos2)[11] <- "sumatorio"
rownames(tabla_datos2)[11]
tabla_datos2



