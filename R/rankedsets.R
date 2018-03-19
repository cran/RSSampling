rankedsets<-function(X,m,s=m){
  if(s==m){
  x=sample(X,(m^2),replace=F)
  n=matrix(x,ncol=m,nrow=m,byrow=T)
  ms=matrix(0,ncol=m,nrow=m)


  for (i in 1:m){
    ms[i,]=sort(n[i,])
  }


  }else {
    x=sample(X,(m*s),replace=F)
    n=matrix(x,ncol=m,nrow=s,byrow=T)
    ms=matrix(0,ncol=m,nrow=s)
    for (i in 1:s){
      ms[i,]=sort(n[i,])
    }
      }



 return(ms)
}

