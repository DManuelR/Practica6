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

hist(x_distancia) #x es la variable explicativa, no tiene forma de campana, no es normal, la regresión no se cumple siempre
shapiro.test(x_distancia)

