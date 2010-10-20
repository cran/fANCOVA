\name{loess.as}
\alias{loess.as}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fit a local polynomial regression with automatic smoothing parameter selection
}
\description{
Fit a local polynomial regression with automatic smoothing parameter selection. Two methods are available for the selection of the smoothing parameter: bias-corrected Akaike information criterion (aicc); and generalized cross-validation (gcv).
}
\usage{
loess.as(x, y, degree = 1, criterion = c("aicc", "gcv"), 
		family = c("gaussian", "symmetric"), user.span = NULL, 
		plot = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
a vector or two-column matrix of covariate values.
}
  \item{y}{
a vector of response values.
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
  \item{plot}{
if TRUE, the fitted curve or surface will be generated.
}
  \item{\dots}{
control parameters.
}
}
\details{
Fit a local polynomial regression with automatic smoothing parameter selection. The predictor x can either one-dimensional or two-dimensional.
}
\value{
An object of class ``loess''.
}
\references{
Cleveland, W. S. (1979) Robust locally weighted regression and smoothing scatterplots. \emph{Journal of the American Statistical Association}. 74, 829--836.

Hurvich, C.M., Simonoff, J.S., and Tsai, C.L. (1998), Smoothing Parameter Selection in Nonparametric Regression Using an Improved Akaike Information Criterion. \emph{Journal of the Royal Statistical Society B}. 60, 271--293.

Golub, G., Heath, M. and Wahba, G. (1979). Generalized cross validation as a method for choosing a good ridge parameter. \emph{Technometrics}. 21, 215--224.
}
\author{
X.F. Wang \email{wangx6@ccf.org}
}

\seealso{
\code{\link{loess}}, \code{\link{loess.ancova}}, \code{\link{T.L2}}, \code{\link{T.aov}}, \code{\link{T.var}}.
}
\examples{
## Fit Local Polynomial Regression with Automatic Smoothing Parameter Selection
n1 <- 100
x1 <- runif(n1,min=0, max=3)
sd1 <- 0.2
e1 <- rnorm(n1,sd=sd1)
y1 <- sin(2*x1) + e1

(y1.fit <- loess.as(x1, y1, plot=TRUE))

n2 <- 100
x21 <- runif(n2, min=0, max=3)
x22 <- runif(n2, min=0, max=3)
sd2 <- 0.25
e2 <- rnorm(n2, sd=sd2)
y2 <- sin(2*x21) + sin(2*x22) + 1 + e2

(y2.fit <- loess.as(cbind(x21, x22), y2, plot=TRUE))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{nonparametric}
\keyword{smooth}
