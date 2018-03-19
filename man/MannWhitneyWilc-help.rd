\name{mwwutestrss}
\alias{mwwutestrss}
\title{Mann-Whitney-Wilcoxon test with RSS}
\usage{
  mwwutestrss(X,Y,m,r,l,n,delta0=0,alpha=0.05,lambda=0.5,alternative="two.sided")

}
\description{
 In this function, we introduce the RSS version of the Mann-Whitney-Wilcoxon (MWW) test.
}

\arguments{
  \item{X}{ First obtained ranked set sample }
   \item{Y}{ Second obtained ranked set sample }

  \item{m}{ Set size which was used while sampling X }

  \item{r}{ Cycles size which was used while sampling X}

  \item{l}{Set size which was used while sampling Y}

  \item{n}{Cycles size which was used while sampling Y}

  \item{delta0}{The median value of difference in the null hypothesis. (By Default = 0)}

  \item{alpha}{The significance level (by default = 0.05).}

  \item{lambda}{constant in the variance formula of the test statistic, see Chen et. al.(2003) }

  \item{alternative}{Character string defining the alternative hypothesis, one of "two.sided", "less"
or "greater" (by default = "two.sided")}
}

  \details{
    The test statistics and an approximate confidence intervals are constructed by using the normal approximation. Also note that, we assume that the ranking mechanism in the RSS is consistent. For more details please refer to Chen et. al.(2003, pg. 115-124).

    There should be two datasets to compare as "X" and "Y", respectively.
  }

  \value{
    \item{medianX}{median value of the first sample}
    \item{medianY}{median value of the second sample}
    \item{MWW.test.mwwUrss}{The value of the Mann-Whitney-Wilcoxon test statistic}
    \item{C.I.}{the confidence interval of the Mann-Whitney-Wilcoxon test statistic }
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
mwwutestrss(sample.x,sample.y,m=3,r=12,l=3,n=12,delta0=0)
  }


