Drss<-function(X,m,r=1,type="d",sets=FALSE,p){
  rss=matrix(nrow=r,ncol=m)
  setss=matrix(ncol=m)
  if (is.vector(X)){



if (type=="d"){
  for (j in 1:r){
  rsam=numeric()
  d=Mrss(X,m,m,type="r",sets=T)
  set=d$sets
  sam=d$samples
  for (k in 1:m){
    sam[k,]=sort(sam[k,])
  }
  for (i in 1:m){
   rsam[i]=sam[i,i]
  }
  rss[j,]=rsam
  setss=rbind(setss,set)
  }
  setss=setss[-1,]
}else if (type=="de"){
  for (j in 1:r){
  rsam=numeric()
  d=Mrss(X,m,m,type="e",sets=T)
  set=d$sets
  sam=d$samples
   for (k in 1:m){
    sam[k,]=sort(sam[k,])
  }
  if (m%%2==0){
  for (i in 1:(m/2)){
    rsam[i]=sam[i,1]
  }
    for (i in ((m/2)+1):m){
      rsam[i]=sam[i,m]
    }
  }else {
    for (i in 1:((m-1)/2)){
      rsam[i]=sam[i,1]
    }
    for (i in (((m-1)/2)+1):(m-1)){
      rsam[i]=sam[i,m]
    }
      rsam[m]=sam[m,(m+1)/2]
  }
  rss[j,]=rsam
  setss=rbind(setss,set)
  }
  setss=setss[-1,]
  }else if (type=="dm"){
    for (j in 1:r){
      rsam=numeric()
    d=Mrss(X,m,m,type="m",sets=T)
    set=d$sets
    sam=d$samples
    b=matrix(sam,byrow=F,ncol=m)
    for (k in 1:m){
      sam[k,]=sort(sam[k,])
    }
    if (m%%2==0){
      for (i in 1:(m/2)){
        rsam[i]=sam[i,(m/2)]
      }
      for (i in ((m/2)+1):m){
        rsam[i]=sam[i,(m/2)+1]
      }
    }else {
      for (i in 1:m){
        rsam[i]=sam[i,(m+1)/2]
      }

    }

    rss[j,]=rsam
    setss=rbind(setss,set)
    }
    setss=setss[-1,]
  }else if (type=="dp"){

    if ((p<=1)&(p>=0)){
      for (j in 1:r){
        rsam=numeric()
    d=Mrss(X,m,m,type="r",sets=T)
    set=d$sets
    sam=d$samples
    b=matrix(sam,byrow=T,ncol=m)
    for (k in 1:m){
      sam[k,]=sort(sam[k,])
    }
    if (m%%2==0){
      for (i in 1:(m/2)){
        if ((p*(m+1))>0.5){
          rsam[i]=sam[i,round(p*(m+1))]
        }else if ((p*(m+1))<=0.5){
          rsam[i]=sam[i,ceiling(p*(m+1))]
        }
      }
      for (i in ((m+2)/2):m){
        if ((p*(m+1))>0.5){
          rsam[i]=sam[i,(m+1-round(p*(m+1)))]
        }else if ((p*(m+1))<=0.5){
          rsam[i]=sam[i,(m+1-(ceiling(p*(m+1))))]
        }
      }
    }else {
      for (i in 1:((m-1)/2)){
        if ((p*(m+1))>0.5){
          rsam[i]=sam[i,round(p*(m+1))]
        }else if ((p*(m+1))<=0.5){
          rsam[i]=sam[i,ceiling(p*(m+1))]
        }
      }
      for (i in (((m-1)/2)+1):(2*((m-1)/2))){
        if ((p*(m+1))>0.5){
          rsam[i]=sam[i,(m+1-round(p*(m+1)))]
        }else if ((p*(m+1))<=0.5){
          rsam[i]=sam[i,(m+1-(ceiling(p*(m+1))))]
        }
      }
      rsam[m]=sam[m,(m+1)/2]
    }
    rss[j,]=rsam
    setss=rbind(setss,set)
    }
      setss=setss[-1,]
    }else stop("p is out of bound.",call.=F)
  }
    cn=rn=numeric()
    for (i in 1:r){
      rn[i]=paste("r","=",i)
    }
    for (i in 1:m){
      cn[i]=paste("m","=",i)
    }
    rownames(rss)=rn
    colnames(rss)=cn

if (sets==F){
  return(rss)
}else return(list(sets=setss,samples=rss))
  }else stop(" X must be a vector!",call.=F)
}
