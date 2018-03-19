\name{obsno.Mrss}
\alias{obsno.Mrss}
\title{observation numbers based on classical and modified ranked set sampling methods}
\usage{
  obsno.Mrss(Y,m,r=1,type="r",p)

}
\description{
  The \code{\link{obsno.Mrss}} function gives the observation numbers to sample from a target population by using modified ranked set sampling methods.
  Ranking is done using the concomitant variable Y.


}

\arguments{
  \item{Y}{ A vector of concomitant variable from target population}

  \item{m}{Size of units in each set}

  \item{r}{Number of cycles}

  \item{type}{type of the modified RSS method. "r" for traditional RSS, "p" for Percentile RSS, "m" for Median RSS,
    "bg" for Balanced Groups RSS, "e" for Extreme RSS. Default value is "r"}
  \item{p}{Value of percentile for Percentile RSS method}
}


\details{

  Concomitant variable Y must be a vector.

}



\references{
  McIntyre, G. A. (1952). A method for unbiased selective sampling, using ranked sets. Australian Journal of Agricultural Research, 3(4), 385-390.


  Dell, T. R., & Clutter, J. L. (1972). Ranked set sampling theory with order statistics background. Biometrics, 28, 545-553.

  Samawi, H. M., Ahmed, M. S., & Abu-Dayyeh, W. (1996). Estimating the population mean using extreme ranked set sampling. Biometrical Journal, 38(5), 577-586.



  Muttlak, H. A. (1997). Median ranked set sampling. Journal of Applied Statistical Sciences, 6(4), 245-255.



  Muttlak, H. A. (2003). Modified ranked set sampling methods. Pakistan Journal Of Statistics, 19(3), 315-324.


  Jemain, A. A., Al-Omari, A., & Ibrahim, K. (2008). Some variations of ranked set sampling. Electronic Journal of Applied Statistical Analysis, 1(1), 1-15.



}

\seealso{
  \code{\link{con.Mrss}}, \code{\link{Mrss}}, \code{\link{rss}}

}
\examples{
  y=rexp(10000)
  ## Determining the observation numbers of the units which are chosen to sample

  y=rexp(10000)
  obsno.Mrss(y,m=3,r=5)
  obsno.Mrss(y,m=5,r=6,type="m")
  obsno.Mrss(y,m=7,r=3,type="e")
  obsno.Mrss(y,m=4,r=5,type="p",p=0.3)
  obsno.Mrss(y,m=6,r=2,type="bg")
}
