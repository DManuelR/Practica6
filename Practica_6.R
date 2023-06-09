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

modelo <- lm(y_cuentas ~ x_distancia, data = tabla_datos)
coeficientes <- coef(modelo)
coeficientes

plot(y_cuentas ~ x_distancia, main = "gráfico de dispersión la recta de regresión", ylab = "Cuentas", xlab = "Distancia")
abline(modelo)

res_estandarizados <- rstandard(modelo)
res_estandarizados
residuos <- resid(modelo)
residuos
res_estunderizados <- rstudent(modelo)
res_estunderizados

y_6_6 <- 95.36 - 1.0872 * 6.6
y_6_6


library(dplyr)
train <- data %>% dplyr::sample_frac(.8)
test <- dplyr::anti_join(data, train)
train
test

modelo_2 <- lm(y_cuentas ~ x_distancia, train)
summary(modelo_2)

#17, los tres asteriscos significan... 0.8641 cuanto más cerca del 1 mejor, porcentaje de...

#18, los grados de libertad del modelo se han obtenido mediante la función summary.

anova(modelo)
#19, el total de varianza explicada y no explicada por el modelo se encuentra con la función anova(), la cual aporta una tabla donde la columna Sum Sq nos proporciona la varianza total explicada y no explicada.

Predicci <- predict(modelo_2, newdata = test) 
Predicci

E_cadr_medio <- sqrt(mean((test$y_cuentas - Predicci)^2))
E_cadr_medio

#Para comprobar si existen valores influyentes en nuestro modelo podemos usar el método de Cook, que mide la influencia de una observación en el ajuste del modelo, eliminando la observación y comparando el ajuste del modelo con y sin ella. Si el ajuste del modelo cambia significativamente, entonces la observación se considera influyente.

plot(modelo, which = 1)
#observamos que uno de los puntos descarrila


# cargar el paquete lmtest
library(lmtest)

# realizar el test de Durbin-Watson
dwtest(modelo, alternative = "two.sided")
#hay una fuerte autocorrelación positiva en los residuos del modelo, ya que el valor estadistico obtenido es menos de 1, por tanto no se puede asumir la independencia de los residuos

plot(x = modelo$fitted.values, y = modelo$residuals,
     xlab = "Valores ajustados", ylab = "Residuos",
     main = "Gráfico de residuos versus valores ajustados")
abline(h = 0, col = "red")
#esto podría indicar que los errores del modelo no son constantes y que es necesario ajustar el modelo de manera diferente.



library(tinytex)
tinytex::reinstall_tinytex(repository = "illinois")
