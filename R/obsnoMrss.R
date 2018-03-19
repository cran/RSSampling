obsno.Mrss<-function(Y,m,r=1,type="r",p){
      if (is.vector(Y)){
        X=1:length(Y)
        data=matrix(ncol=2,nrow=length(X))
        data.x=X
        data.y=Y
        sample.x= sample.y=numeric()
        set.xy=data.frame(X,Y)
        set.x=set.y=matrix(nrow=(m*r),ncol=m)
        sample.x=sample.y=numeric()
        A<-matrix(0,nrow=(m*r),ncol=(m*2))
        
        a=1
        b=0
        
        if (type=="r"){
          
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
          
          
        }else if (type=="m"){
          if (m%%2==1){
            for (j in 1:r){
              
              for (i in 1:m){
                A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                sample.x[a]=A[sort.list(A[,2]),][(m+1)/2,1]
                sample.y[a]=A[sort.list(A[,2]),][(m+1)/2,2]
                set.x[i+b,]=A[sort.list(A[,2]),]$X
                set.y[i+b,]=A[sort.list(A[,2]),]$Y
                a=a+1
              }
              
              b=b+m
            } 
            
            
          }else { 
            for (j in 1:r){
              
              for (i in 1:(m/2)){
                A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                sample.x[a]=A[sort.list(A[,2]),][m/2,1]
                sample.y[a]=A[sort.list(A[,2]),][m/2,2]
                set.x[i+b,]=A[sort.list(A[,2]),]$X
                set.y[i+b,]=A[sort.list(A[,2]),]$Y
                a=a+1
              }
              for (i in ((m/2)+1):m){
                A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                sample.x[a]=A[sort.list(A[,2]),][(m+2)/2,1]
                sample.y[a]=A[sort.list(A[,2]),][(m+2)/2,2]
                set.x[i+b,]=A[sort.list(A[,2]),]$X
                set.y[i+b,]=A[sort.list(A[,2]),]$Y
                a=a+1
              }
              
              b=b+m
            } 
            
          }
        }else 
          if (type=="e"){
            if (m%%2==0){
              for (j in 1:r){
                for (i in 1:(m/2)){
                  A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                  sample.x[a]=A[sort.list(A[,2]),][1,1]
                  sample.y[a]=A[sort.list(A[,2]),][1,2]
                  set.x[i+b,]=A[sort.list(A[,2]),]$X
                  set.y[i+b,]=A[sort.list(A[,2]),]$Y
                  a=a+1
                }
                for (i in ((m/2)+1):m){
                  A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                  sample.x[a]=A[sort.list(A[,2]),][m,1]
                  sample.y[a]=A[sort.list(A[,2]),][m,2]
                  set.x[i+b,]=A[sort.list(A[,2]),]$X
                  set.y[i+b,]=A[sort.list(A[,2]),]$Y
                  a=a+1
                }
                
                b=b+m
              }
            } else {
              for (j in 1:r){
                for (i in 1:((m-1)/2)){
                  A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                  sample.x[a]=A[sort.list(A[,2]),][1,1]
                  sample.y[a]=A[sort.list(A[,2]),][1,2]
                  set.x[i+b,]=A[sort.list(A[,2]),]$X
                  set.y[i+b,]=A[sort.list(A[,2]),]$Y
                  a=a+1
                }
                for (i in (((m-1)/2)+1):(m-1)){
                  A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                  sample.x[a]=A[sort.list(A[,2]),][m,1]
                  sample.y[a]=A[sort.list(A[,2]),][m,2]
                  set.x[i+b,]=A[sort.list(A[,2]),]$X
                  set.y[i+b,]=A[sort.list(A[,2]),]$Y
                  a=a+1
                }
                for (i in m){
                  A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                  sample.x[a]=A[sort.list(A[,2]),][(m+1)/2,1]
                  sample.y[a]=A[sort.list(A[,2]),][(m+1)/2,2]
                  set.x[i+b,]=A[sort.list(A[,2]),]$X
                  set.y[i+b,]=A[sort.list(A[,2]),]$Y
                  a=a+1
                }
                
                b=b+m
              }
            }
          } else if (type=="bg") {
            
            if(m%%3==0){
              if (m%%2==1) {
                for (j in 1:r){
                  for (i in 1:(m/3)){
                    A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                    sample.x[a]=A[sort.list(A[,2]),][1,1]
                    sample.y[a]=A[sort.list(A[,2]),][1,2]
                    set.x[i+b,]=A[sort.list(A[,2]),]$X
                    set.y[i+b,]=A[sort.list(A[,2]),]$Y
                    a=a+1
                  }
                  for (i in ((m/3)+1):((2*m)/3)){
                    A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                    sample.x[a]=A[sort.list(A[,2]),][(m+1)/2,1]
                    sample.y[a]=A[sort.list(A[,2]),][(m+1)/2,2]
                    set.x[i+b,]=A[sort.list(A[,2]),]$X
                    set.y[i+b,]=A[sort.list(A[,2]),]$Y
                    a=a+1
                  }
                  for (i in  (((2*m)/3)+1):m){
                    A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                    sample.x[a]=A[sort.list(A[,2]),][m,1]
                    sample.y[a]=A[sort.list(A[,2]),][m,2]
                    set.x[i+b,]=A[sort.list(A[,2]),]$X
                    set.y[i+b,]=A[sort.list(A[,2]),]$Y
                    a=a+1
                  }
                  
                  b=b+m
                }
              }else if (m%%2==0){
                for (j in 1:r){
                  for (i in 1:(m/3)){
                    A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                    sample.x[a]=A[sort.list(A[,2]),][1,1]
                    sample.y[a]=A[sort.list(A[,2]),][1,2]
                    set.x[i+b,]=A[sort.list(A[,2]),]$X
                    set.y[i+b,]=A[sort.list(A[,2]),]$Y
                    a=a+1
                  }
                  for (i in (((m)/3)+1):((2*m)/3)){
                    A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                    sample.x[a]=(A[sort.list(A[,2]),][m/2,1]+A[sort.list(A[,2]),][(m+2)/2,1])/2
                    sample.y[a]=(A[sort.list(A[,2]),][m/2,2]+A[sort.list(A[,2]),][(m+2)/2,2])
                    set.x[i+b,]=A[sort.list(A[,2]),]$X
                    set.y[i+b,]=A[sort.list(A[,2]),]$Y
                    a=a+1
                  }
                  for (i in (((2*m)/3)+1):m){
                    A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                    sample.x[a]=A[sort.list(A[,2]),][m,1]
                    sample.y[a]=A[sort.list(A[,2]),][m,2]
                    set.x[i+b,]=A[sort.list(A[,2]),]$X
                    set.y[i+b,]=A[sort.list(A[,2]),]$Y
                    a=a+1
                  }
                  b=b+m
                }
                
              }
              
              
              
              
            }else stop(' m must be multiple of 3!', call.=F)
          } else if( type=="p"){
            
            if ((p<=1)&(p>=0)){
              if (m%%2==0){
                if ((p*(m+1))>0.5){
                  for (j in 1:r){
                    for (i in 1:(m/2)){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][round(p*(m+1)),1]
                      sample.y[a]=A[sort.list(A[,2]),][round(p*(m+1)),2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                      
                    }
                    
                    for (i in ((m/2)+1):m){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][(m+1-round(p*(m+1))),1]
                      sample.y[a]=A[sort.list(A[,2]),][(m+1-round(p*(m+1))),2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                      
                    }
                    b=b+m
                  }
                } else if ((p*(m+1))<=0.5){
                  for (j in 1:r){
                    
                    for (i in 1:(m/2)){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][ceiling(p*(m+1)),1]
                      sample.y[a]=A[sort.list(A[,2]),][ceiling(p*(m+1)),2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                    }
                    for (i in ((m/2)+1):m){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][(m+1-(ceiling(p*(m+1)))),1]
                      sample.y[a]=A[sort.list(A[,2]),][(m+1-(ceiling(p*(m+1)))),2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                      
                    }
                    b=b+m
                  }
                }
              }else if (m%%2==1){
                if ((p*(m+1))>0.5){
                  for (j in 1:r){
                    
                    for (i in 1:((m-1)/2)){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][ round(p*(m+1)),1]
                      sample.y[a]=A[sort.list(A[,2]),][ round(p*(m+1)),2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                      
                    }
                    for (i in (((m-1)/2)+1):(2*((m-1)/2))){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][(m+1-round(p*(m+1))),1]
                      sample.y[a]=A[sort.list(A[,2]),][ (m+1-round(p*(m+1))),2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                      
                    }
                    for (i in m){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][(m+1)/2,1]
                      sample.y[a]=A[sort.list(A[,2]),][(m+1)/2,2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                      
                    }
                    
                    b=b+m
                    
                  }
                }else if ((p*(m+1))<=0.5){
                  for (j in 1:r){
                    
                    for (i in 1:((m-1)/2)){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][ ceiling(p*(m+1)),1]
                      sample.y[a]=A[sort.list(A[,2]),][ ceiling(p*(m+1)),2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                      
                    }
                    for (i in (((m-1)/2)+1):(2*((m-1)/2))){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][(m+1-(ceiling(p*(m+1)))),1]
                      sample.y[a]=A[sort.list(A[,2]),][(m+1-(ceiling(p*(m+1)))),2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                    }
                    
                    for (i in m){
                      A=set.xy[sample(nrow(set.xy),size=m,replace=TRUE),]
                      sample.x[a]=A[sort.list(A[,2]),][(m+1)/2,1]
                      sample.y[a]=A[sort.list(A[,2]),][(m+1)/2,2]
                      set.x[i+b,]=A[sort.list(A[,2]),]$X
                      set.y[i+b,]=A[sort.list(A[,2]),]$Y
                      a=a+1
                    }
                    
                    b=b+m
                  }
                }
                
              }
              
            }else stop("p is out of bound.",call.=F)
          }
        
        rss=matrix(paste("Obs. ",sample.x),ncol=m,nrow=r,byrow=T)
        cn=rn=numeric()
        for (i in 1:r){
          rn[i]=paste("r","=",i)
        }
        for (i in 1:m){
          cn[i]=paste("m","=",i)
        }
        rownames(rss)=rn
        colnames(rss)=cn
      
          return(rss)
      
       }else stop("Y must be a vector!",call.=F)
    
 
  
}
