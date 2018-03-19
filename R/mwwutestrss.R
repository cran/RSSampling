
mwwutestrss <- function(X,Y,m,r,l,n,delta0=0,alpha=0.05,lambda=0.5,alternative="two.sided"){
  if (is.vector(X)&is.vector(Y)){
    if ((alpha>0)*(alpha<1)){
      if ((lambda>0)*(lambda<1)){
     
  N=m*r;
  M=l*n;
  
  sortedsample=sort(X)
  
  if (N%%2 == 0) {
    medianX=(sortedsample[N/2]+sortedsample[(N/2)+1])/2
  } else {
    medianX=sortedsample[(N+1)/2]
  }
  
  sortedsampleY=sort(Y)
  
  if (M%%2 == 0) {
    medianY=(sortedsampleY[M/2]+sortedsampleY[(M/2)+1])/2
  } else {
    medianY=sortedsampleY[(M+1)/2]
  }
  
  UrssY=0
  for (i in 1:N)
  {
    for (j in 1:M)
    {
      if (X[i] < Y[j]){
        UrssY=UrssY+1
      } else if (X[i] == Y[j]) {
        UrssY=UrssY+0.5
      } 
      
    }  
  }
  
  UrssX=0
  for (i in 1:N)
  {
    for (j in 1:M)
    {
      if (X[i] > Y[j]){
        UrssX=UrssX+1
      } else if (X[i] == Y[j]) {
        UrssX=UrssX+0.5
      } 
    } 
  }
  
  mwwUrss=(N*(N+1)/2)+UrssY
  
  
  ztest=(UrssY-(M*N/2)+(1/2))/(M*N*sqrt((1/(6*lambda*(m+1)))+(1/(6*(1-lambda)*(r+1))))/sqrt(M+N))
  
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
  d=1
  diffr=as.numeric()
  for (i in 1:N)
  {
    for (j in 1:M)
    {
      diffr[d]=X[i]-Y[j]
      
      d=d+1 
    }  
  }
  
  sorteddiff=sort(diffr)
  
  UCImwwUrss=sorteddiff[ceiling(UrssY+(1/2)-((qnorm((alpha/2), mean = 0, sd = 1, lower.tail = TRUE)*(M*N*sqrt((1/(6*lambda*(m+1)))+(1/(6*(1-lambda)*(r+1))))/sqrt(M+N)))))]
  LCImwwUrss=sorteddiff[(M*N)+1-(ceiling(UrssY+(1/2)-((qnorm((alpha/2), mean = 0, sd = 1, lower.tail = TRUE)*(M*N*sqrt((1/(6*lambda*(m+1)))+(1/(6*(1-lambda)*(r+1))))/sqrt(M+N))))))]
  
  
  return(list(medianX=medianX,medianY=medianY,W.X=UrssX,W.Y=UrssY,C.I.=c(LCImwwUrss,UCImwwUrss),z.test=ztest,p.value=pvalue))
    }else stop("lambda is out of bound",call.=F) 
   }else stop("alpha is out of bound",call.=F)
   }else stop("X and Y must be vector!",call.=F)  
  
}

