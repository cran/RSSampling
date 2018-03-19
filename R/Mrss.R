Mrss<-function(X,m,r=1,type="r",sets=FALSE,p){

  rss=numeric()
  set=matrix(0,ncol=m,nrow=(m*r))
if (is.vector(X)){
  a=0

  if (type=="r"){
    for (j in 1:r){
      ms=rankedsets(X,m)

      for (i in 1:(m)){
        set[i+a,]=ms[i,]
        rss[i+a]=ms[i,i]
      }

      a=a+m
    }
  } else if (type=="m"){

    if (m%%2==1) {
    for (j in 1:r){
      ms=rankedsets(X,m)
      for (i in 1:(m)){
        set[i+a,]=ms[i,]
        rss[i+a]=ms[i,(m+1)/2]
      }

      a=a+m
    }
    } else if (m%%2==0) {
      for (j in 1:r){
        ms=rankedsets(X,m)
        for (i in 1:(m/2)){
          set[i+a,]=ms[i,]
          rss[i+a]=ms[i,(m)/2]
        }
        for (i in ((m/2)+1):m){
          set[i+a,]=ms[i,]
          rss[i+a]=ms[i,(m+2)/2]
        }
        a=a+m
      }

    }

     } else if (type=="e"){

        if (m%%2==0){

          for (j in 1:r){
            ms=rankedsets(X,m)
                 for (i in 1:(m/2)){
              set[i+a,]=ms[i,]
              rss[i+a]=ms[i,1]
            }
            for (i in ((m/2)+1):m){
              set[i+a,]=ms[i,]
              rss[i+a]=ms[i,m]
            }
            a=a+m
          }

        } else if (m%%2==1) {
a=0
          for (j in 1:r){
            ms=rankedsets(X,m)
            for (i in 1:((m-1)/2)){
              set[i+a,]=ms[i,]
              rss[i+a]=ms[i,1]
            }
            for (i in (((m-1)/2)+1):(m-1)){
              set[i+a,]=ms[i,]
              rss[i+a]=ms[i,m]
            }
              rss[m+a]=ms[m,(m+1)/2]
              set[m+a,]=ms[m,]
            a=a+m
          }
         }
}else if (type=="p"){
  if ((p<=1)&(p>=0)){
        if (m%%2==0){
      for (j in 1:r){
        ms=rankedsets(X,m)
        for (i in 1:(m/2)){
          set[i+a,]=ms[i,]
          if ((p*(m+1))>0.5){
          rss[i+a]=ms[i,round(p*(m+1))]
          }else if ((p*(m+1))<=0.5){
          rss[i+a]=ms[i,ceiling(p*(m+1))]
          }
        }
        for (i in ((m+2)/2):m){
          set[i+a,]=ms[i,]
          if ((p*(m+1))>0.5){
          rss[i+a]=ms[i,(m+1-round(p*(m+1)))]
          }else if ((p*(m+1))<=0.5){
            rss[i+a]=ms[i,(m+1-(ceiling(p*(m+1))))]
          }
        }
        a=a+m
      }


      }else if (m%%2==1){
      for (j in 1:r){
        ms=rankedsets(X,m)
        for (i in 1:((m-1)/2)){
          set[i+a,]=ms[i,]
          if ((p*(m+1))>0.5){
          rss[i+a]=ms[i,round(p*(m+1))]
        }else if ((p*(m+1))<=0.5){
          rss[i+a]=ms[i,ceiling(p*(m+1))]
        }
        }
        for (i in (((m-1)/2)+1):(2*((m-1)/2))){
          set[i+a,]=ms[i,]
          if ((p*(m+1))>0.5){
            rss[i+a]=ms[i,(m+1-round(p*(m+1)))]
          }else if ((p*(m+1))<=0.5){
            rss[i+a]=ms[i,(m+1-(ceiling(p*(m+1))))]
          }
        }

        set[m+a,]=ms[m,]
        rss[m+a]=ms[m,(m+1)/2]
        a=a+m
      }
    }
  }else stop("p is out of bound.",call.=F)

     } else if (type=="bg"){
       if(m%%3==0){
       if (m%%2==1) {

    for (j in 1:r){
      ms=rankedsets(X,m)

     for (i in 1:(m/3)){
       set[i+a,]=ms[i,]
       rss[i+a]=ms[i,1]
     }
     for (i in ((m/3)+1):((2*m)/3)){
       set[i+a,]=ms[i,]
       rss[i+a]=ms[i,(m+1)/2]
     }
     for (i in (((2*m)/3)+1):m){
       set[i+a,]=ms[i,]
       rss[i+a]=ms[i,m]
     }
      a=a+m
   }

       } else if (m%%2==0) {

       for (j in 1:r){
         ms=rankedsets(X,m)
         for (i in 1:(m/3)){
           set[i+a,]=ms[i,]
           rss[i+a]=ms[i,1]
         }
         for (i in (((m)/3)+1):((2*m)/3)){
           set[i+a,]=ms[i,]
           rss[i+a]=(ms[i,m/2]+ms[i,(m+2)/2])/2
         }
         for (i in (((2*m)/3)+1):m){
           set[i+a,]=ms[i,]
           rss[i+a]=ms[i,m]
         }
         a=a+m
       }

       }

       }else stop(' m must be multiple of 3!', call.=F)
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

}else stop(" X must be a vector!",call.=F)
}
