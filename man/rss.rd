\name{rss}
\alias{rss}
\title{Selecting classical ranked set sample}
\usage{
rss(X,m,r=1,sets=FALSE)

}
\description{
The \code{\link{rss}} function samples from a target population by using ranked set sampling method.

}

\arguments{
\item{X}{ A vector of target population }

\item{m}{Size of units in each set}

\item{r}{Number of cycles. (By default=1)}

\item{sets}{logical; if TRUE, ranked set samples are given with ranked sets (see \code{\link{rankedsets}})}


}

\details{

Target population X must be a vector.

}

\value{
\item{sets}{randomly chosen ranked sets }
\item{sample}{ the obtained ranked set sample of X}
}

\references{
  McIntyre, G. A. (1952). A method for unbiased selective sampling, using ranked sets. Australian Journal of Agricultural Research, 3(4), 385-390.
}

\seealso{
 \code{\link{con.rss}}

}
\examples{
data=rnorm(10000,1,3)
## Selecting classical ranked set sample with set size \emph{m} and cycle size \emph{r}
rss(data,m=5,r=3,sets=TRUE)
}
