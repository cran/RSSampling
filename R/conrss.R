con.rss<-function(X,Y,m,r=1,sets=FALSE,concomitant=FALSE){
  if (is.vector(X)){
    if (is.vector(Y)){
      if (length(X)==length(Y)){
        data=matrix(ncol=2,nrow=length(X))
        data.x=X
        data.y=Y
        sample.x=sample.y=numeric()
        set.xy=data.frame(X,Y)
        set.x=set.y=matrix(nrow=(m*r),ncol=m)
        rss=sample.x=sample.y=numeric()
        A<-matrix(0,nrow=(m*r),ncol=(m*2))

        a=1
        b=0
          for (j in 1:r){

             for (i in 1:m){
              A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
              sample.x[a]=A[sort.list(A[,2]),][i,1]
              sample.y[a]=A[sort.list(A[,2]),][i,2]
              set.x[i+b,]=A[sort.list(A[,2]),]$X
              set.y[i+b,]=A[sort.list(A[,2]),]$Y
              a=a+1
            }

            b=b+m
          }

        sample.x=matrix(sample.x,ncol=m,nrow=r,byrow=T)
        cn=rn=numeric()
        for (i in 1:r){
          rn[i]=paste("r","=",i)
        }
        for (i in 1:m){
          cn[i]=paste("m","=",i)
        }
        rownames(sample.x)=rn
        colnames(sample.x)=cn


        sample.y=matrix(sample.y,ncol=m,nrow=r,byrow=T)

        rownames(sample.y)=rn
        colnames(sample.y)=cn
 if (concomitant==T){
   if (sets==T){
     return(list(corr.coef=cor(X,Y),var.of.interest=set.x,concomitant.var.=set.y,sample.x=sample.x,sample.y=sample.y))
   }else {
     return(list(sample.x=sample.x,sample.y=sample.y))
   }
 }else {
   if (sets==T){
     return(list(corr.coef=cor(X,Y),var.of.interest=set.x,sample.x=sample.x))
   }else {
     return(list(sample.x=sample.x))
   }
 }



      }else stop("X and Y must be in same length",call.=F)

    }else stop("Y must be a vector!",call.=F)

  }else stop("X must be a vector!",call.=F)


}
