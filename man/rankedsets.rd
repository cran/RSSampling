\name{rankedsets}
\alias{rankedsets}
\title{Selecting ranked sets}
\usage{
  rankedsets(X,m,s=m)

}
\description{
  The \code{\link{rankedsets}} function selects ranked sets from a target population. The selection of units in a set is without replacement, but the sets are selecting with replacement.

}

\arguments{
  \item{X}{ A vector of target population}

  \item{m}{Size of units in each set}

  \item{s}{Number of sets. (by default = m)}

 }

\details{
Target population X must be a vector.
}

\value{
  It returns a matrix of ranked sets.
}

\references{
 McIntyre, G. A. (1952). A method for unbiased selective sampling, using ranked sets. Australian Journal of Agricultural Research, 3(4), 385-390.

}


\examples{

  data=rexp(10000,3)
  ## Creating m by m matrix (a regular cycle)
  rankedsets(data,m=5)
  ## Creating m by s matrix
  rankedsets(data,m=3,s=5)

}
