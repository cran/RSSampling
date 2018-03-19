\name{Mrss}
\alias{Mrss}
\title{Selecting a ranked set sample (classical or modified)}
\usage{
  Mrss(X,m,r=1,type="r",sets=FALSE,p)

}
\description{
  The \code{\link{Mrss}} function samples from a target population by using modified ranked set sampling methods.

}

\arguments{
  \item{X}{ A vector of target population }

  \item{m}{Size of units in each set}

  \item{r}{Number of cycles. (By default = 1)}

  \item{sets}{logical; if TRUE, ranked set samples are given with ranked sets (see \code{\link{rankedsets}})}

  \item{type}{type of the modified RSS method. "r" for traditional RSS, "p" for Percentile RSS, "m" for Median RSS,
  "bg" for Balanced Groups RSS, "e" for Extreme RSS. (By default = "r")}

 \item{p}{Value of percentile for Percentile RSS method}
}
\details{

  Target population X must be a vector.

}

\value{
  \item{sets}{ the ranked sets where ranked set sample is chosen from}
  \item{sample}{ the obtained ranked set sample of X}
}

\references{
  McIntyre, G. A. (1952). A method for unbiased selective sampling, using ranked sets. Australian Journal of Agricultural Research, 3(4), 385-390.



  Samawi, H. M., Ahmed, M. S., & Abu-Dayyeh, W. (1996). Estimating the population mean using extreme ranked set sampling. Biometrical Journal, 38(5), 577-586.



  Muttlak, H. A. (1997). Median ranked set sampling. Journal of Applied Statistical Sciences, 6(4), 245-255.



  Muttlak, H. A. (2003). Modified ranked set sampling methods. Pakistan Journal Of Statistics, 19(3), 315-324.


  Jemain, A. A., Al-Omari, A., & Ibrahim, K. (2008). Some variations of ranked set sampling. Electronic Journal of Applied Statistical Analysis, 1(1), 1-15.



}

\seealso{
  \code{\link{con.Mrss}}, \code{\link{Rrss}}, \code{\link{Drss}}

}
\examples{
  data=rgamma(10000,1,1)
  ## Selecting a median ranked set sample
  Mrss(data,m=4,r=5,sets=TRUE,type="m")
   ## Selecting an extreme ranked set sample
  Mrss(data,m=3,r=5,sets=TRUE,type="e")
   ## Selecting a percentile ranked set sample
  Mrss(data,m=4,r=3,sets=TRUE,type="p",p=0.2)
   ## Selecting a balanced groups ranked set sample
  Mrss(data,m=6,r=2,sets=TRUE,type="bg")

}
