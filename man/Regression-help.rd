\name{regRSS}
\alias{regRSS}
\title{Regression estimator based on ranked set sampling}
\usage{
  regRSS(X,Y,mu_Y)

}
\description{
  It obtains the regression estimator for mean of interested population based on ranked set sampling.

}

\arguments{
  \item{X}{ An obtained ranked set sample for interested variable from target population }
  \item{Y}{ An obtained ranked set sample for concomitant variable from target population }
  \item{mu_Y}{ The known mean for population Y }
}
\details{
In this code, variable X and Y represents interested and concomitant variable, respectively, please note that notation is vice versa in the reference (Yu&Lam(1997)).

X and Y must be in same length.
}

\value{
\item{B}{the B coefficient}
\item{X_reg}{the regression estimate for mean of X based on ranked set sampling}

}

\references{
Yu, P.L.H. and Lam, K. (1997). "Regression Estimator in Ranked Set Sampling". Biometrics, Vol. 53, No. 3, pp. 1070-1080.
}


\examples{
library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,2])
samplerss=con.rss(xx,xy,m=4,r=8,sets=FALSE,concomitant=TRUE)
sample.x=samplerss$sample.x
sample.y=samplerss$sample.y

regRSS(sample.x,sample.y,mu_Y=mean(xy))
}


