#' Probability that n initial cases lead to an outbreak that lasts at least g generations
#' of transmission AND has exactly j total cases after generation g, with offspring 
#' distribution parameters switched after generation one
#'
#' @param g Number of generations of transmission
#' @param n Number of initial cases
#' @param j Total size of outbreak after generation g
#' @param R0 Basic reproduction number: mean of negative binomial offspring distribution from generation one
#' @param k0 Dispersion parameter of negative binomial offspring distribution from generation one
#' @param Rc Control reproduction number: mean of negative binomial offspring distribution from generation two plus
#' @param kc Dispersion parameter of negative binomial offspring distribution from generation two plus
#' @author Damon Toth
#' @returns The probability of the given outbreak size at the given transmission generation
#' @examples
#' #Probability that 10 initial cases leads to an outbreak lasting at least
#' # 3 transmission generations and is of exact size 30 after 3 generations  
#' pSizeAtGenSwitch1(g=3,n=10,j=30,R0=2,k0=0.5,Rc=0.5,kc=1)
#' @export
pSizeAtGenSwitch1 <- function(g,n,j,R0,k0,Rc,kc){
  
  if(g==1){
    out <-pNextGenSize(n,j-n,R0,k0)
  }else if(g==2){
    out <- sum(pNextGenSize(n,1:(j-n-1),R0,k0) *pNextGenSize(1:(j-n-1),(j-n-1):1,Rc,kc))
  }else{
    
    rs1 <- (j-n-g+1):1
    x1 <- rep(1:(j-n-g+1),choose(rs1+g-3,g-2))
    
    x <- matrix(0,length(x1),g-1)
    x[,1] <- x1
    
    pProd <-pNextGenSize(n,x1,R0,k0)
    
    rsA <- rs1
    for(i in 2:(g-1)){
      rsB <- sequence(rsA,rsA,-1)
      x[,i] <- rep(sequence(rsA),choose(rsB+g-2-i,g-1-i))
      pProd <- pProd *pNextGenSize(x[,i-1],x[,i],Rc,kc)
      rsA <- rsB
    }
    xLast <- j-n-rowSums(x)
    pProd <- pProd *pNextGenSize(x[,g-1],xLast,Rc,kc)
    out <- sum(pProd)
  }
  out
}