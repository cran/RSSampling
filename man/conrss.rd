\name{con.rss}
\alias{con.rss}
\title{Selecting ranked set sample with a concomitant variable}
\usage{
con.rss(X,Y,m,r=1,sets=FALSE,concomitant=FALSE)

}
\description{
The \code{\link{con.rss}} function samples from a target population by using ranked set sampling method. Ranking procedure of X is done by using concomitant variable Y.

}

\arguments{
\item{X}{A vector of interested variable from target population}
\item{Y}{A vector of concomitant variable from target population}

\item{m}{Size of units in each set}

\item{r}{Number of cycles. (Default by = 1)}

\item{sets}{logical; if TRUE, ranked set sample is given with ranked sets(see \code{\link{rankedsets}})}

\item{concomitant}{logical; if TRUE, ranked set sample of concomitant variable is given }

}

\details{
X and Y must be vectors and also they should be in same length.
}

\value{
\item{corr.coef}{the correlation coefficient between X and Y}
\item{var.of.interest}{the sets of X, which are ranked by Y}
\item{concomitant.var.}{the ranked sets of Y}
\item{sample.x}{the obtained ranked set sample of X}
\item{sample.y}{the obtained ranked set sample of Y}
}

\references{
  McIntyre, G. A. (1952). A method for unbiased selective sampling, using ranked sets. Australian Journal of Agricultural Research, 3(4), 385-390.


  Lynne Stokes, S. (1977). Ranked set sampling with concomitant variables. Communications in Statistics-Theory and Methods, 6(12), 1207-1211.


  Chen, Z., Bai, Z., & Sinha, B. (2003). Ranked set sampling: theory and applications (Vol. 176). Springer Science & Business Media.
}

\seealso{
 \code{\link{rss}}

}
\examples{
library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,3])
con.rss(xx, xy, m=3, r=4, sets=TRUE, concomitant=TRUE)

}
