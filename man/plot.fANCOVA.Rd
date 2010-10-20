\name{plot.fANCOVA}
\alias{plot.fANCOVA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot a fANCOVA Object
}
\description{
  To plot a fANCOVA object
}
\usage{
plot.fANCOVA(x, test.statistic = TRUE, main = "", n = 256, 
		legend.position = "topright", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
a fANCOVA object
}
  \item{test.statistic}{
if TRUE, plot the density of the test statistic under null hypothesis;
if FALSE, plot the estimated curves.
}
  \item{main}{
the title of the plot
}
  \item{n}{
the number of points that are used to draw the curves or surfaces in the plot.
}
  \item{legend.position}{
the position of legend in the plot: ``topright'', ``topleft'', ``bottomright'', ``bottomleft'', etc.
}
  \item{\dots}{
control parameters of the plot function
}
}
\details{
This function is to plot a fANCOVA object. The plot will be generated only if the predictor x is one-dimensional. if ``test.statistic=TRUE'', a density plot of the test statistic under null hypothesis will be generated; if ``test.statistic=FALSE'', the estimated curves for all groups are drawn.

}
\author{
X.F. Wang \email{wangx6@ccf.org}
}
\seealso{
\code{\link{T.L2}}, \code{\link{T.aov}}, \code{\link{T.var}}.
}
\keyword{ plot }
