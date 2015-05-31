q1 <- function(x) {return(sqrt(2*x-x^3))}
d <- seq(-5,5,.1)
plot(d,q1(d),type='l')

q2 <- function(x) {return (   log(x)*(x-3)/(x^2-4)    )  }
d <- seq(-5,5,.01)
plot(d,q2(d),type='l')

q3 <- function(x) {return (   asin((x-2)/3)    )  }
d <- seq(-6,6,.01)
plot(d,q3(d),type='l')

q5 <- function(x) {return (   log(1+x^2)    )  }
d <- seq(-6,6,.01)
plot(d,q5(d),type='l')

q6 <- function(x) {return (   atan(cos(x))    )  }
d <- seq(-6,6,.01)
plot(d,q6(d),type='l')
q6(0)
pi/4

q8 <- function(x) {
  e=exp(1) 
  return (   e^(2*x)    )  
}
q8(1)
log( q8(1)^2)
log( q8(1))/2



q1 <- function(x) {return(    log(sin(x))     )}
d <- seq(-9,9,.001)
plot(d,q1(d),type='l')


q2 <- function(k) {return(    (-1)^(k)*log(4)^(k)/factorial(k)    )}
sum(q2(0:20))


q3 <- function(k) {return(    (-1)^(k)*pi^(2*k)/factorial(2*k)    )}
sum(q3(0:20))


q4 <- function(k) {return(    (-1)^(k+1)*2^k/(2*k-1)    )}
q4(1:5)


q5 <- function(x) {return(    1/(1-x)    )}
d <- seq(-0.1,0.1,.001)
plot(d,q5(d),type='l')



