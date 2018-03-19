\name{con.Rrss}
\alias{con.Rrss}
\title{Selecting a robust ranked set sample with a concomitant variable}
\usage{
  con.Rrss(X,Y,m,r=1,type="l",sets=FALSE,concomitant=FALSE,alpha)

}
\description{
  The \code{\link{con.Rrss}} function samples from a target population by using robust ranked set sampling methods. Ranking procedure of X is done by using the concomitant variable Y.

}

\arguments{
  \item{X}{ A vector of target population }
  \item{Y}{ A vector of concomitant variable from target population}

  \item{m}{Size of units in each set}

  \item{r}{Number of cycles. (By default =1)}

  \item{type}{type of the modified RSS method. "l" for L-RSS, "tb" for truncation-based RSS,
    "re" for robust extreme RSS. (By default ="l")}

  \item{sets}{logical; if TRUE, ranked set sample is given with ranked sets (see \code{\link{rankedsets}})}

  \item{concomitant}{logical; if TRUE, ranked set sample of concomitant variable is given }

  \item{alpha}{Coefficient of the method}
 }
\details{

  X and Y must be vectors and also they should be in same length.
  Coefficient of the method must be between 0 and 0.5.

}

\value{
  \item{corr.coef}{ the correlation coefficient between X and Y}
  \item{var.of.interest}{ the sets of X, which are ranked by Y}
  \item{concomitant.var.}{ the ranked sets of Y}
  \item{sample.x}{ the obtained ranked set sample of X}
  \item{sample.y}{ the obtained ranked set sample of Y}
}

\references{

    Al-Nasser, A. D. (2007). L ranked set sampling: A generalization procedure for robust
  visual sampling. Communications in Statistics-Simulation and Computation, 36(1),
  33-43.


  Al-Omari, A. I., & Raqab, M. Z. (2013). Estimation of the population mean and median
  using truncation-based ranked set samples. Journal of Statistical Computation and
  Simulation, 83(8), 1453-1471.


  Al-Nasser, A. D., & Mustafa, A. B. (2009). Robust extreme ranked set sampling.
  Journal of Statistical Computation and Simulation 79(7), 859-867.

}

\seealso{
  \code{\link{Mrss}}, \code{\link{Rrss}}, \code{\link{Drss}}, \code{\link{con.Mrss}}

}
\examples{
library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,3])

## Selecting robust ranked set samples
con.Rrss(xx,xy,m=8,r=4,type="l", sets=TRUE, concomitant=TRUE, alpha=0.3)
con.Rrss(xx,xy,m=5,r=2,type="re", sets=TRUE, concomitant=TRUE, alpha=0.2)
con.Rrss(xx,xy,m=6,r=3,type="tb", sets=TRUE, concomitant=TRUE, alpha=0.25)
}
