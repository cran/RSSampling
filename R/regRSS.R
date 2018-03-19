regRSS<-function(X,Y,mu_Y){
  if (length(X)==length(Y)){
  B=sum((Y-mean(Y))*(X-mean(X)))/sum((Y-mean(Y))^2)
        Xreg=mean(X)+B*(mu_Y-mean(Y))
        result=list(B_coefficient=B,Regression_estimate=Xreg)
        return(result)
  }else stop("X and Y must be in same length",call.=F)
}
