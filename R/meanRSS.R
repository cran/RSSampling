meanRSS <- function(X,m,r,alpha=0.05,alternative="two.sided",mu_0){
  if (is.matrix(X)){
    if ((alpha>0)*(alpha<1)){
  a=mean(X)
  vr=ztest=numeric()
  for (j in 1:r){
    vr[j]=sum((X[j,]-mean(X[j,]))^2)/(m-1)
    }

  vr=sum(vr)/(m*r^2)
  sdRSS=sqrt(vr)
  cin=a-qnorm(1-alpha/2)*sdRSS
  cip=a-qnorm(alpha/2)*sdRSS
  ztest=(mean(X)-mu_0)/sdRSS
  if (alternative=="two.sided"){
    p= pnorm(ztest, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
    if (p>0.5){
      pvalue=(1-p)*2

    } else {
      pvalue=p*2
    }

  } else if (alternative=="less"){
    pvalue=pnorm(ztest, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)

  } else if (alternative=="greater"){
    pvalue=1-pnorm(ztest, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)

  }

  result=list(mean=a,CI=c(cin,cip),z.test=ztest,p.value=pvalue)
  return(result)

    }else stop("alpha is out of bound",call.=F)
}else stop("X must be a matrix!",call.=F)
}
