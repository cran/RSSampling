\name{varRSS}
\alias{varRSS}
\title{Variance estimation based on ranked set sampling}
\usage{
  varRSS(X,m,r,type)

}
\description{
  The \code{\link{varRSS}} function estimates the variance based on ranked set sampling as types of Stokes or Montip&Sukuman.

}

\arguments{
  \item{X}{ An obtained ranked set sample }

  \item{m}{ Size of units in each set }

  \item{r}{ Number of cycles }

  \item{type}{character string, one of "Stokes" or "Montip". }
}

\details{
An obtained ranked set sample X must be m by r matrix.
Stokes (1980) showed that estimator for variance is biased. Montip and Sukuman(2003) showed that for one cycle there is no unbiased estimator for variance but for more than one cycle they proposed unbiased estimator for variance.
}

\value{
\item{var}{ the estimated population variance based on ranked set sampling }
}

\references{
Al-Hadhrami, S.A. (2010). "Estimation of the Population Variance Using
Ranked Set Sampling with Auxiliary Variable". Int. J. Contemp. Math. Sciences, Vol. 5, no. 52, 2567 - 2576.


Stokes, S.L. (1980). "Estimation of Variance Using Judgment Ordered Ranked Set Samples". Biometrics, Vol. 36, No. 1, pp. 35-42.

}

\examples{

 data=rnorm(10000,2,1)
 samplerss=rss(data,m=4,r=3,sets=FALSE)
 ## Estimation of variance based on ranked set sample by Stokes
 varRSS(samplerss,m=4,r=3,type="Stokes")
  ## Estimation of variance based on ranked set sample by Montip&Sukuman
 varRSS(samplerss,m=4,r=3,type="Montip")

}


