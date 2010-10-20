\name{loess.ancova}
\alias{loess.ancova}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fit a semiparametric ANCOVA model with a local polynomial smoother
}
\description{
Fit a semiparametric ANCOVA model with a local polynomial smoother. The specific model considered here is

y_ij= g_i + m(x_ij) + e_ij,

where the parametric part of the model, g_i, is a factor variable; the nonparametric part of the model, m(.), is a nonparametric smooth function; e_ij are independent identically distributed errors. The errors e_ij do not have to be independent N(0, sigma^2) errors. The errors can be heteroscedastic, i.e., e_ij = sigma_i(x_ij) * u_ij, where u_ij are independent identically distributed errors with mean 0 and variance 1. The model is fitted by the direct estimation method (Speckman, 1988), or by the backfitting method (Buja, Hastie and Tibshirani, 1989; Hastie and Tibshirani, 1990).

}
\usage{
loess.ancova(x, y, group, degree = 2, criterion = c("aicc", "gcv"), 
		family = c("gaussian", "symmetric"), method=c("Speckman", "Backfitting"), 
		iter = 10, tol = 0.01, user.span = NULL, plot = FALSE, 
		data.points = FALSE, legend.position = "topright", ...)
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
  \item{degree}{
the degree of the local polynomials to be used. It can ben 0, 1 or 2.
}
  \item{criterion}{
the criterion for automatic smoothing parameter selection: ``aicc'' denotes bias-corrected AIC criterion, ``gcv'' denotes generalized cross-validation.
}
  \item{family}{
if ``gaussian'' fitting is by least-squares, and if ``symmetric'' a re-descending M estimator is used with Tukey's biweight function.
}
  \item{method}{
if ``Speckman'' the direct estimation method by Speckman (1988) will be used, and if ``Backfitting'' The model is fitted by the backfitting method (Buja, Hastie and Tibshirani, 1989; Hastie and Tibshirani, 1990).
}

  \item{iter}{
the number of iterations.
}
  \item{tol}{
the number of tolerance in the iterations.
}
  \item{user.span}{
the user-defined parameter which controls the degree of smoothing. If it is not specified, the smoothing parameter will be selected by ``aicc'' or ``gcv'' criterion.
}
  \item{plot}{
if TRUE (when x is one-dimensional), the fitted curves for all groups will be generated; if TRUE (when x is two-dimensional), only the smooth component in the model will be plotted.
}
  \item{data.points}{
if TRUE, the data points will be displayed in the plot.
}
  \item{legend.position}{
the position of legend in the plot: ``topright'', ``topleft'', ``bottomright'', ``bottomleft'', etc.
}
  \item{\dots}{
control parameters.
}
}
\details{
Fit a local polynomial regression with automatic smoothing parameter selection. The predictor x can either one-dimensional or two-dimensional.
}
\value{
a list of a vector of the parametric estimates and an object of class ``loess''.
}
\references{
Speckman, P. (1988). Kernel Smoothing in Partial Linear Models. \emph{Journal of the Royal Statistical Society. Series B (Methodological)}, 50, 413--436.

Buja, A., Hastie, T. J. and Tibshirani, R. J. (1989). Linear smoothers and additive
models (with discussion). \emph{Annals of Statistics}, 17, 453--555.

Hastie, T. J. and Tibshirani, R. J. (1990). \emph{Generalized Additive Models}. Vol. 43 of
Monographs on Statistics and Applied Probability, Chapman and Hall, London.
}
\author{
X.F. Wang \email{wangx6@ccf.org}
}

\seealso{
\code{\link{loess}}.
}
\examples{
## Fit semiparametric ANCOVA model
set.seed(555)
n1 <- 80
x1 <- runif(n1,min=0, max=3)
sd1 <- 0.3
e1 <- rnorm(n1,sd=sd1)
y1 <- 3*cos(pi*x1/2)  + 6 + e1

n2 <- 75
x2 <- runif(n2, min=0, max=3)
sd2 <- 0.2
e2 <- rnorm(n2, sd=sd2)
y2 <- 3*cos(pi*x2/2) + 3 + e2

n3 <- 90
x3 <- runif(n3, min=0, max=3)
sd3 <- 0.3
e3 <- rnorm(n3, sd=sd3)
y3 <- 3*cos(pi*x3/2)  + e3

data.bind <- rbind(cbind(x1,y1,1), cbind(x2,y2,2),cbind(x3,y3,3))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x','y','group') 

x <- data.bind[,1]
y <- data.bind[,2]
group <- data.bind[,3]

loess.ancova(x,y,group, plot=TRUE, data.points=TRUE)

## Fit semiparametric ANCOVA model when the predictor is two-dimensional
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
y3 <- sin(2*x31) + sin(2*x32) + 3 + e3

data.bind <- rbind(cbind(x11, x12 ,y1,1), cbind(x21, x22, y2,2),cbind(x31, x32,y3,3))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x1','x2', 'y','group') 

loess.ancova(data.bind[,c(1,2)], data.bind$y, data.bind$group, plot=TRUE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{semiparametric}
\keyword{nonparametric}
\keyword{smoothing}% __ONLY ONE__ keyword per line
