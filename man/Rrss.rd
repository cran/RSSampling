\name{Rrss}
\alias{Rrss}
\title{Selecting a robust ranked set sample}
\usage{
  Rrss(X,m,r=1,type="l",sets=FALSE,alpha)

}
\description{
  The \code{\link{Rrss}} function samples from a target population by using robust ranked set sampling methods.
}

\arguments{
  \item{X}{ A vector of target population }

  \item{m}{Size of units in each set}

  \item{r}{Number of cycles. (By default = 1)}

  \item{type}{type of the modified RSS method. "l" for L-RSS, "tb" for truncation-based RSS,
    "re" for robust extreme RSS. (By default = "l")}

  \item{sets}{logical; if TRUE, ranked set samples are given with ranked sets (see \code{\link{rankedsets}})}

  \item{alpha}{Coefficient of the method}
}


\details{

  Target population X must be a vector.
  Coefficient of the method must be between 0 and 0.5.

}

\value{
  \item{sets}{ the ranked sets where ranked set sample is chosen from}
  \item{sample}{ the obtained ranked set sample of X}
}

\references{
  Al-Nasser, A. D. (2007). L ranked set sampling: A generalization procedure for robust
  visual sampling. Communications in Statistics-Simulation and Computation, 36(1),
  33?43.


  Al-Omari, A. I., & Raqab, M. Z. (2013). Estimation of the population mean and median
  using truncation-based ranked set samples. Journal of Statistical Computation and
  Simulation, 83(8), 1453?1471.


  Al-Nasser, A. D., & Mustafa, A. B. (2009). Robust extreme ranked set sampling.
  Journal of Statistical Computation and Simulation, 79(7), 859?867.

}

\seealso{
  \code{\link{con.Mrss}}, \code{\link{Rrss}}, \code{\link{Drss}}

}
\examples{
 data=rexp(10000)
 ## Selecting L-ranked set sample
 Rrss(data, m=8, r=3, sets=TRUE, alpha=0.2)
  ## Selecting Truncation-based ranked set sample
 Rrss(data, m=8, r=3, type="tb", sets=TRUE, alpha=0.1)
  ## Selecting Robust extreme ranked set sample
 Rrss(data, m=8, r=3, type="re", sets=TRUE, alpha=0.4)
}
