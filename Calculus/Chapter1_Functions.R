


x <- 0.00000001
fx <- log(1/(1-x))

f1 <- function(x) {return (x???x^2+x^3)  }
f2 <- function(x) {return (x+0.5*x^2+x^3/3)  }
f3 <- function(x) {return (x+0.5*x^2)  }
f4 <- function(x) {return (x-0.5*x^2+x^3/3)  }
f5 <- function(x) {return (x-0.5*x^2+x^3/6)  }

fx / f1(x)
fx / f2(x)
v <- c(f1(x), f2(x), f3(x), f4(x), f5(x), x, fx)
v-fx
plot(v-fx)

f<-function(x){ return (atan(x)/(x^3+7*x))} 
f<-function(x){ return ((cos(3*x)-cos(5*x))/x^2)} 

x<-seq(0,.001,0.0001)
f(x)
1/0.1428571

n <- 0:15
sum((sqrt(2)*pi)^n/factorial(n))
1+pi*log(sqrt(2))
1/(1-pi*sqrt(2))
exp(sqrt(2)*pi)
pi*exp(sqrt(2))
atan(sqrt(2)*pi)
sqrt(2)/(1-pi)
exp(sqrt(2*pi))


x <- 0.32
k <- 0:100
v <- sum(3^(k+1) * x^k)
f1 <- function(x){ return (    1/(1-3*x)     ) } 
f2 <- function(x){ return (    3/(1-x)     ) } 
f3 <- function(x){ return (    3/(1-3*x)     ) } 
c(v,f1(x),f2(x),f3(x))



f<-function(x){ return (    exp(x*x)     ) } 
f<-function(x){ return (    log(1+x+x^2)     ) } 
x <- 1:10
cbind(f(x),x^4)
