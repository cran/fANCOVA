\name{wild.boot}
\alias{wild.boot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate one or multiple bootstrap samples of regression residuals using the wild bootstrap method
}
\description{
Generate bootstrap samples using the wild bootstrap method introduced by Wu (1986). One of the advantages for the wild bootstrap method is that it allows for a heterogeneous variance in the residuals in regression analysis.
}
\usage{
wild.boot(x, nboot = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
a vector of regression residuals.
}
  \item{nboot}{
the number of bootstrap replicates. Usually this will be a single positive integer.
}
}
\details{
This function is to generate bootstrap residuals using the wild bootstrap method.
}
\value{
a vector or a matrix.
}
\references{
Wu, C. (1986) Jackknife, bootstrap and other resampling methods in regression analysis (with discussion). \emph{Annals of Statistics}. 14, 1261--1350.

Mammen, E. (1991). Bootstrap, wild bootstrap, and asymptotic normality. \emph{Probability Theory and Related Fields}. 93, 439--455.
}
\author{
X.F. Wang \email{wangx6@ccf.org}
}

\seealso{
\code{\link{T.L2}}, \code{\link{T.aov}}, \code{\link{T.var}}.
}
\examples{
n <- 1000
x <- runif(n, min=0, max=1)
## generate heteroscedastic error variances
sig.x <- sqrt(exp(x)/2.5-0.4)
err <- sapply(sig.x, function(x) rnorm(1, sd=x))
x2 <- x^2
y <- 10+3*x+2*x2 +err
plot(x,y)
fit <- lm(y ~ x + x2)
## obtain 12 samples of the wild bootstrap residuals 
res.boot <- wild.boot(fit$res, nboot=12)
## obtain 12 samples of the wild bootstrap responses
y.boot <- matrix(rep(fit$fit,time=12), ncol=12) + res.boot
## plot the 12 wild bootstrap samples
## The wild bootstrap method keeps the patterns of variance heterogeneity 
## in the orginal sample.
par(mfrow=c(4,3))
for (i in 1:12) plot(x, y.boot[,i])

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{bootstrap}
\keyword{wild bootstrap}
\keyword{regression}
% __ONLY ONE__ keyword per line
