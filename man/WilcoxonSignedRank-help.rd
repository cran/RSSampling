\name{wsrtestrss}
\alias{wsrtestrss}
\title{Wilcoxon signed rank test with RSS}
\usage{
  wsrtestrss(sampledata,m,r,delta0=0,alpha=0.05,alternative="two.sided")

}
\description{
  It performs the RSS version of the Wilcoxon signed rank test given by Chen et. al.(2003).
}

\arguments{
  \item{sampledata}{ An obtained ranked set sample }

  \item{m}{ Number of units in each set (set size) }

  \item{r}{ Number of cycles }

  \item{delta0}{The median value of difference in the null hypothesis}

  \item{alpha}{The significance level (by default = 0.05).}

  \item{alternative}{Character string defining the alternative hypothesis, one of "two.sided", "less"
or "greater" (by default = "two.sided")}
  }
  \details{
  The test statistics and an approximate confidence intervals are constructed by using the normal approximation. Also note that, we assume that the ranking mechanism in the RSS is consistent. For more details please refer to Chen et. al.(2003, pg. 124-133).
  }

  \value{
    \item{median}{  median value of the sample}
    \item{sign.rank.test.stat}{The value of the Wilcoxon signed rank test statistic}
    \item{z.test}{the z statistic for test}
    \item{p.value}{the p value for the test}
  }

  \references{
    Chen, Z., Bai Z., Sinha B. K. (2003). Ranked Set Sampling: Theory and Application. New York: Springer.
  }


  \examples{
library("LearnBayes")
mu=c(1,1.2,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,2])
samplerss=con.rss(xx,xy,m=3,r=12,concomitant=TRUE)
sample.x=as.numeric(samplerss$sample.x)
sample.y=as.numeric(samplerss$sample.y)
difference=sample.x-sample.y
wsrtestrss(difference,m=3,r=12,delta0=0)


  }


