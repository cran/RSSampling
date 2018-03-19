\name{sign1testrss}
\alias{sign1testrss}
\title{Sign Test with RSS}
\usage{
  sign1testrss(sampledata,m,r,median0,alpha=0.05,alternative="two.sided")

}
\description{
  It performs the RSS version of the sign test given by Chen et. al.(2003).
}

\arguments{
  \item{sampledata}{ An obtained ranked set sample }

  \item{m}{ Number of units in each set (set size) }

  \item{r}{ Number of cycles }

  \item{median0}{The median value in the null hypothesis}

  \item{alpha}{The significance level (by default = 0.05).}

  \item{alternative}{Character string defining the alternative hypothesis, one of "two.sided", "less"
or "greater" (by default = "two.sided")}
}

\details{
The test statistics and an approximate confidence intervals are constructed by using the normal approximation. Also note that, we assume that the ranking mechanism in the RSS is consistent. For more details please refer to Chen et. al.(2003, pg. 103-115).
}

\value{
  \item{median}{ The median value of the given set}

  \item{sign.test.stat}{The value of the RSS sign test statistic}

  \item{C.I.}{the confidence interval for median}

  \item{z.test}{the z statistic for test}

  \item{p.value}{the p value for the test}
  }

\references{
  Chen, Z., Bai Z., Sinha B. K. (2003). Ranked Set Sampling: Theory and Application. New York: Springer.
  }


\examples{

  data=rnorm(10000,0,1)
  samplerss=as.numeric(rss(data,m=3,r=12))
  sign1testrss(samplerss,m=3,r=12,median0=0.5)
}


