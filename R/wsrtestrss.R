wsrtestrss <- function(sampledata,m,r,delta0=0,alpha=0.05,alternative="two.sided"){
  if (is.vector(sampledata)){
    if ((alpha>0)*(alpha<1)){
  N=m*r;
  
  sortedsample=sort(sampledata)
  
  if (N%%2 == 0) {
    medianDifference=(sortedsample[N/2]+sortedsample[(N/2)+1])/2
  } else {
    medianDifference=sortedsample[(N/2)+1]
  }
  
  Wsignrss=as.numeric()
  Wsignrss=0
  
  for (i in 1:N)
  {
    for (j in i:N)
    {
      if ((0.5*(sampledata[i] + sampledata[j])) > delta0) {
        Wsignrss=Wsignrss+1
      } else if ((0.5*(sampledata[i] + sampledata[j])) == delta0) {
        Wsignrss=Wsignrss+0.5
      } 
    }  
  }
  
  ztest=(Wsignrss-(N*(N+1)/4))/sqrt((N^3)/(6*(m+1)))
  
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
  
  return(list(median=medianDifference,sign.rank.test.stat=Wsignrss,z.test=ztest,p.value=pvalue))
    }else stop("alpha is out of bound",call.=F)
  }else stop("sampledata must be vector!",call.=F)  
}