\name{con.Mrss}
\alias{con.Mrss}
\title{Selecting a ranked set sample (classical or modified) with a concomitant variable}
\usage{
  con.Mrss(X,Y,m,r=1,type="r",sets=FALSE,concomitant=FALSE,p)

}
\description{
  The \code{\link{Mrss}} function samples from a target population by using modified ranked set sampling methods. Ranking procedure of X is done by using the concomitant variable Y.

}

\arguments{
  \item{X}{ A vector of target population }
  \item{Y}{ A vector of concomitant variable from target population}

  \item{m}{Size of units in each set}

  \item{r}{Number of cycles. (By default = 1)}


  \item{type}{type of the modified RSS method. "r" for traditional RSS, "p" for Percentile RSS, "m" for Median RSS,   "bg" for Balanced Groups RSS, "e" for Extreme RSS. (By default = "r")}
   \item{sets}{logical; if TRUE, ranked set samples are given with ranked sets (see \code{\link{rankedsets}})}
  \item{concomitant}{logical; if TRUE, ranked set sample of concomitant variable is given }

 \item{p}{Value of percentile for Percentile RSS method}
}
\details{

X and Y must be vectors and also they should be in same length.
Value of percentile (p) must be between 0 and 1.


}

\value{
\item{corr.coef}{ the correlation coefficient between X and Y}
\item{var.of.interest}{ the sets of X, which are ranked by Y}
\item{concomitant.var.}{ the ranked sets of Y}
\item{sample.x}{ the obtained ranked set sample of X}
\item{sample.y}{ the obtained ranked set sample of Y}
}

\references{
  McIntyre, G. A. (1952). A method for unbiased selective sampling, using ranked sets. Australian Journal of Agricultural Research, 3(4), 385-390.



  Samawi, H. M., Ahmed, M. S., & Abu-Dayyeh, W. (1996). Estimating the population mean using extreme ranked set sampling. Biometrical Journal, 38(5), 577-586.



  Muttlak, H. A. (1997). Median ranked set sampling. Journal of Applied Statistical Sciences, 6(4), 245-255.



  Muttlak, H. A. (2003). Modified ranked set sampling methods. Pakistan Journal Of Statistics, 19(3), 315-324.


  Jemain, A. A., Al-Omari, A., & Ibrahim, K. (2008). Some variations of ranked set sampling. Electronic Journal of Applied Statistical Analysis, 1(1), 1-15.


}

\seealso{
  \code{\link{Mrss}}, \code{\link{Rrss}}, \code{\link{Drss}}, \code{\link{con.Rrss}}

}
\examples{
library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,3])

## Selecting modified ranked set samples
con.Mrss(xx, xy, m=5, r=3, type="r", concomitant=TRUE, sets=TRUE)
con.Mrss(xx, xy, m=4, r=7, type="m", concomitant=TRUE, sets=TRUE)
con.Mrss(xx, xy, m=5, r=2, type="e", concomitant=TRUE, sets=TRUE)
con.Mrss(xx, xy, m=8, r=3, type="p", concomitant=TRUE, sets=TRUE, p=0.25)
con.Mrss(xx, xy, m=6, r=5, type="bg", concomitant=TRUE, sets=TRUE)

}
