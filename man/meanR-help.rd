\name{meanRSS}
\alias{meanRSS}
\title{Mean estimation based on ranked set sampling}
\usage{
  meanRSS(X,m,r,alpha=0.05,alternative="two.sided",mu_0)

}
\description{
  The \code{\link{meanRSS}} function estimates the population mean based on ranked set sampling.  Also, it calculates confidence interval, p-value and z-statistics for hypothesis testing.

}

\arguments{
  \item{X}{ is an obtained ranked set sample }

  \item{m}{ is the size of units in each set }

  \item{r}{ is the number of cycles }

  \item{alpha}{ is the alpha value for the confidence interval. (By default = 0.05) }

  \item{alternative}{ is a character string, one of "greater","less" or "two.sided".
  For one sample test, alternative refers to the true mean of the parent population in relation to the hypothesized value mu_0 }

  \item{mu_0}{ is the initial value for mean in hypothesis testing formula }

}

\details{
An obtained ranked set sample X must be m by r matrix.
}

\value{
\item{mean}{ the estimated population mean based on ranked set sampling }
\item{CI}{is a confidence interval for the true mean}
\item{z.test}{the z-statistic for the test}
\item{p.value}{the p-value for the test}
}

\references{
  Chen, Z., Bai Z., Sinha B. K. (2003). Ranked Set Sampling: Theory and Application. New York: Springer.

}


\examples{
library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,2])
samplerss=con.Mrss(xx,xy,m=4,r=8,type="r",sets=FALSE,concomitant=FALSE)$sample.x

## mean estimation, confidence interval and hypothesis testing for ranked set sample
meanRSS(samplerss,m=4,r=8,mu_0=1)

}





