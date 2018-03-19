
sign1testrss <- function(sampledata,m,r,median0,alpha=0.05,alternative="two.sided"){
  if (is.vector(sampledata)){
    if ((alpha>0)*(alpha<1)){
  N=m*r
  sortedsample=sort(sampledata)
  
  if (N%%2 == 0) {
    median=(sortedsample[N/2]+sortedsample[(N/2)+1])/2
  } else {
    median=sortedsample[(N+1)/2]
  }
  
  
  sign1rss=0
  for (i in 1:N)
  {
    if (sampledata[i] > median0){
      sign1rss=sign1rss+1
    }
  }    
  
  
  dfb=0
  for (z in 1:m){
    dfb=dfb+((pbeta(0.5, z, (m-z+1))-0.5)^2)
  }    
  
  delta0sq=1-(4/m)*(dfb)
  
  varsign1rss=(0.25*N*delta0sq)
  
  
  LCIsign1rss=sortedsample[ceiling((N/2)+1+((qnorm((alpha/2), mean = 0, sd = 1, lower.tail = TRUE)*sqrt(varsign1rss))))]
  UCIsign1rss=sortedsample[ceiling((N/2)+1+((qnorm((alpha/2), mean = 0, sd = 1, lower.tail = FALSE)*sqrt(varsign1rss))))]
  
  
  
  
  ztest=(sign1rss-(N/2))/sqrt(varsign1rss)
  
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
  
  return(list(median=median,sign.test.stat=sign1rss,C.I.=c(LCIsign1rss,UCIsign1rss),z.test=ztest,p.value=pvalue))
    }else stop("alpha is out of bound",call.=F)
  }else stop("sampledata must be vector!",call.=F) 
  
}