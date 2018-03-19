\name{Drss}
\alias{Drss}
\title{Selecting double (classical or modified) ranked set sample}
\usage{
  Drss(X,m,r=1,type="d",sets=FALSE,p)

}
\description{
 The \code{\link{Drss}} function samples from a target population by using multi-stage ranked set sampling methods.

}

\arguments{

\item{X}{ A vector of target population }

  \item{m}{Size of units in each set}

  \item{r}{Number of cycles. (By default = 1)}

  \item{sets}{logical; if TRUE, ranked set samples are given with ranked sets (see \code{\link{rankedsets}})}

  \item{type}{type of the modified RSS method. "d" for double RSS, "dm" for double median RSS, "dp" for double percentile RSS,
  "de" for double extreme RSS. (By default = "d")}

 \item{p}{Value of percentile for double percentile RSS method}

}

\details{

  Target population X must be a vector.
  Value of percentile (p) must be between 0 and 1.

}

\value{
  \item{sets}{ the ranked sets where ranked set sample is chosen from}
  \item{sample}{ the obtained ranked set sample of X}
}

\references{
  Al-Saleh, M. F., & Al-Kadiri, M. A. (2000). Double-ranked set sampling. Statistics &
Probability Letters, 48: 205-212.


Samawi, H.M. & Tawalbeh, E.M. (2002). Double median ranked set sampling: Comparison to other double ranked set samples for mean and ratio estimators. Journal of Modern Applied Statistical Methods, 1(2): 428-442.

Samawi, H.M. 2002. On double extreme ranked set sample with application to regression estimator. Metron, LXn1-2: 53-66.

Jemain, A.A. & Al-Omari, A.I. (2006). Double percentile ranked set samples for estimating the population mean. Advances and Applications in Statistics, 6(3): 261-276.

}

\seealso{

 \code{\link{Mrss}}, \code{\link{Rrss}}, \code{\link{con.Mrss}}, \code{\link{con.Rrss}}

}

\examples{
 data=rnorm(10000)
 ##Seleceting a double ranked set sample
 Drss(data,m=4,r=3,sets=TRUE)
 ##Seleceting a double median ranked set sample
 Drss(data,m=4,r=3,type="dm",sets=TRUE)
 ##Seleceting a double extreme ranked set sample
 Drss(data,m=4,r=3,type="de",sets=TRUE)
 ##Seleceting a double percentile ranked set sample
 Drss(data,m=4,r=3,type="dm",sets=TRUE,p=0.6)
}





