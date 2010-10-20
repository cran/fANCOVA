\name{USpopu}
\docType{data}
\alias{USpopu}
\usage{
data(USpopu)
}
\title{US national population}
\description{
US national population by four groups from 1900 to 1979. The four groups are: Age 0; Age 20; Age 40; Age 60.
}
\format{A data frame with 320 observations on 3 variables.
  \tabular{lll}{
    \code{age}  \tab numeric  \tab the group variable of age \cr
    \code{year}   \tab numeric  \tab a numeric vector, giving year \cr
    \code{population}  \tab numeric  \tab a numeric vector, giving population in millions \cr
  }
}
\seealso{
\code{\link{T.L2}}, \code{\link{T.aov}}, \code{\link{T.var}}.
}
\references{
\url{www.census.gov/popest/archives/pre-1980/PE-11.html}, U.S. Census Bureau, Population Division. Internet Release date: October 1, 2004
}
\examples{
data(USpopu)
t1 <- T.L2(USpopu$year, USpopu$population, USpopu$age, degree=2)
t1
plot(t1)
plot(t1, test.statistic=FALSE, legend.position="topleft")
}
\keyword{datasets}
