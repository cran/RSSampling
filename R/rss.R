rss<-function(X,m,r=1,sets=FALSE){

  rss=numeric()
  set=matrix(0,ncol=m,nrow=(m*r))
  if (is.vector(X)){
    a=0

      for (j in 1:r){
        ms=rankedsets(X,m)

        for (i in 1:(m)){
          set[i+a,]=ms[i,]
          rss[i+a]=ms[i,i]
        }

        a=a+m
      }

    rss=matrix(rss,ncol=m,nrow=r,byrow=T)
    cn=rn=numeric()
    for (i in 1:r){
      rn[i]=paste("r","=",i)
    }
    for (i in 1:m){
      cn[i]=paste("m","=",i)
    }
    rownames(rss)=rn
    colnames(rss)=cn

    if (sets){
      s=list(sets=set,sample=rss)
      return(s)

    } else {
      return(rss)}

  }else stop(" X must be a vector!",call.=F)
}
