
Rrss<-function(X,m,r=1,type="l",sets=FALSE,alpha){

  rss=numeric()
  set=matrix(0,ncol=m,nrow=(m*r))

   if (is.vector(X)){
    a=0

  if (type=="l"){
    if ((alpha<0.5)&(alpha>=0)) {
      k=floor(m*alpha)
if (k>0){  for (j in 1:r){
  ms=rankedsets(X,m)
        for (i in 1:k){
          rss[i+a]=ms[i,k+1]
          set[i+a,]=ms[i,]
        }
        for (i in (k+1):(m-k)){
          rss[i+a]=ms[i,i]
          set[i+a,]=ms[i,]
        }
        for (i in (m-k+1):m){
          rss[i+a]=ms[i,(m-k)]
          set[i+a,]=ms[i,]
          }
        a=a+m
      }
}else {
  for (j in 1:r){
    ms=rankedsets(X,m)
    for (i in 1:(m)){
      set[i+a,]=ms[i,]
      rss[i+a]=ms[i,i]
    }

    a=a+m
  }
}


    }else stop("alpha is out of bound",call.=F)

  }else if (type=="tb"){
    if ((alpha<0.5)&(alpha>=0)) {
      k=floor(m*alpha)
      if (k>0){  for (j in 1:r){
        ms=rankedsets(X,m)
        for (i in 1:k){
          set[i+a,]=ms[i,]
          rss[i+a]=ms[i,1]
        }
        for (i in (k+1):(m-k)){
          set[i+a,]=ms[i,]
          rss[i+a]=ms[i,i]
        }
        for (i in (m-k+1):m){
          set[i+a,]=ms[i,]
          rss[i+a]=ms[i,m]
        }
        a=a+m
      }
      }else {
        for (j in 1:r){
          ms=rankedsets(X,m)
          for (i in 1:(m)){
            set[i+a,]=ms[i,]
            rss[i+a]=ms[i,i]
          }

          a=a+m
        }
      }


    }else stop("alpha is out of bound",call.=F)


  }else if (type=="re"){
    if ((alpha<0.5)&(alpha>=0)) {
      k=floor(m*alpha)


        if (m%%2==0){
          for (j in 1:r){
            ms=rankedsets(X,m)
          for (i in 1:(m/2)){
            set[i+a,]=ms[i,]
            rss[i+a]=ms[i,k+1]
          }
          for (i in ((m/2)+1):m){
            set[i+a,]=ms[i,]
            rss[i+a]=ms[i,m-k]
          }
          a=a+m
          }
        }else {
          for (j in 1:r){
            ms=rankedsets(X,m)
          for (i in 1:((m-1)/2)){
            set[i+a,]=ms[i,]
            rss[i+a]=ms[i,k+1]
          }

          rss[((m+1)/2)+a]=ms[((m+1)/2)+a,(m+1)/2]
          set[((m+1)/2)+a,]=ms[((m+1)/2),]
          for (i in ((m+3)/2):m){
            set[i+a,]=ms[i,]
            rss[i+a]=ms[i,m-k]
          }

          a=a+m
          }

        }

    }else stop("alpha is out of bound",call.=F)

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
      s=list(sets=set,samples=rss)
      return(s)

    } else {
      return(rss)}


   }else stop("x must be a vector!", call.=F)
}

