varRSS <-function(X,m,r,type){
  if (is.matrix(X)){
  if(type=="Stokes"){
    result=sum((X-mean(X))^2)/(length(X)-1)
  }else if (type=="Montip"){
    Wi=matrix(ncol=m,nrow=r)
    Bi=numeric()
    for(j in 1:r){
      for(i in 1:m){
        Wi[j,i]=(X[j,i]-mean(X[j,]))^2
      }
      Bi[j]=(mean(X[j,])-mean(X))^2
    }
    result=sum(Wi)/(m*r)+sum(Bi)/(r-1)
   }

  return(result)
  }else stop("X must be a matrix!",call.=F)
  }

