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

