install.packages("tinytex")
library(tinytex)

x <- rnorm(1000)
hist(x)
library(tools)

y <- rnorm(100) #rnorm da valores seudoaleatorios
hist(y)

set.seed(1) #generador que al activar da valores aleatorios
rnorm(10)

set.seed(2)

#test de shapiro, shapiro.test(), contraste de hipotesis, para ver si es verdad que tiene forma de gaus.

y <- rnorm(1354)
shapiro.test(y)

tinytex::install_tinytex()
library(tinytex)
library(knitr)
library(markdown)
