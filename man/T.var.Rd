\name{T.var}
\alias{T.var}
\alias{T.var.default}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Test the equality of nonparametric curves or surfaces based on variance estimators
}
\description{
Test the equality of nonparametric curves or surfaces based on variance estimators. The specific model considered here is

y_ij= m_i(x_ij) + e_ij,

where m_i(.), are nonparametric smooth functions; e_ij are independent identically distributed errors. The errors e_ij do not have to be independent N(0, sigma^2) errors. The errors can be heteroscedastic, i.e., e_ij = sigma_i(x_ij) * u_ij, where u_ij are independent identically distributed errors with mean 0 and variance 1. 

We are interested in the problem of testing the equality of the regression curves (when x is one-dimensional) or surfaces (when x is two-dimensional),

H_0: m_1(.) = m_2(.) = ...
	v.s.
H_1: otherwise

The problem can also be viewed as the test of the equality in the one-sample problem for functional data.

}
\usage{
T.var(x, ...)
\method{T.var}{default}(x, y, group, B = 200, degree = 1, criterion = c("aicc", "gcv"), 
		family = c("gaussian", "symmetric"), user.span = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
a vector or two-column matrix of covariate values.
}
  \item{y}{
a vector of response values.
}
  \item{group}{
a vector of group indicators that has the same length as y.
}
  \item{B}{
the number of bootstrap replicates. Usually this will be a single positive integer.
}
  \item{degree}{
the degree of the local polynomials to be used. It can ben 0, 1 or 2.
}
  \item{criterion}{
the criterion for automatic smoothing parameter selection: ``aicc'' denotes bias-corrected AIC criterion, ``gcv'' denotes generalized cross-validation.
}
  \item{family}{
if ``gaussian'' fitting is by least-squares, and if ``symmetric'' a re-descending M estimator is used with Tukey's biweight function.
}
  \item{user.span}{
the user-defined parameter which controls the degree of smoothing.
}
  \item{\dots}{
some control parameters can also be supplied directly
}
}
\details{
A wild bootstrap algorithm is applied to test the equality of nonparametric curves or surfaces based on variance estimators.
}
\value{
An object of class ``fANCOVA''.
}
\references{
Dette, H., Neumeyer, N. (2001). Nonparametric analysis of covariance. \emph{Annals of Statistics}. 29, 1361--1400.

Wang. X.F. and Ye, D. (2010). On nonparametric comparison of images and regression surfaces. \emph{Journal of Statistical Planning and Inference}. 140, 2875--2884.
}
\author{
X.F. Wang \email{wangx6@ccf.org}
}

\seealso{
\code{\link{T.L2}}, \code{\link{T.aov}}, \code{\link{loess.as}}, \code{\link{loess.ancova}}.
}
\examples{
## Nonparametric test the equality of multiple regression curves
## Simulate data sets

n1 <- 100
x1 <- runif(n1,min=0, max=3)
sd1 <- 0.2
e1 <- rnorm(n1,sd=sd1)
y1 <- sin(2*x1) + e1

n2 <- 100
x2 <- runif(n2, min=0, max=3)
sd2 <- 0.25
e2 <- rnorm(n2, sd=sd2)
y2 <- sin(2*x2) + 1 + e2

n3 <- 120
x3 <- runif(n3, min=0, max=3)
sd3 <- 0.25
e3 <- rnorm(n3, sd=sd3)
y3 <- sin(2*x3)  + e3

data.bind <- rbind(cbind(x1,y1,1), cbind(x2,y2,2),cbind(x3,y3,3))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x','y','group') 


t1 <- T.var(data.bind$x, data.bind$y, data.bind$group, degree=2, criterion="gcv")
t1
plot(t1)
plot(t1, test.statistic=FALSE)

########
## Nonparametric test the equality for regression surfaces
## Simulate data sets

n1 <- 100
x11 <- runif(n1,min=0, max=3)
x12 <- runif(n1,min=0, max=3)
sd1 <- 0.2
e1 <- rnorm(n1,sd=sd1)
y1 <- sin(2*x11) + sin(2*x12)  + e1

n2 <- 100
x21 <- runif(n2, min=0, max=3)
x22 <- runif(n2, min=0, max=3)
sd2 <- 0.25
e2 <- rnorm(n2, sd=sd2)
y2 <- sin(2*x21) + sin(2*x22) + 1 + e2

n3 <- 120
x31 <- runif(n3, min=0, max=3)
x32 <- runif(n3, min=0, max=3)
sd3 <- 0.25
e3 <- rnorm(n3, sd=sd3)
y3 <- sin(2*x31) + sin(2*x32) + e3

data.bind <- rbind(cbind(x11, x12 ,y1,1), cbind(x21, x22, y2,2),cbind(x31, x32,y3,3))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x1','x2', 'y','group') 

T.var(data.bind[,c(1,2)], data.bind$y, data.bind$group)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{nonparametric}
\keyword{smooth}
\keyword{test the equality}