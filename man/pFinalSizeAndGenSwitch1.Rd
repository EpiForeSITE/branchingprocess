% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pFinalSizeAndGenSwitch1.R
\name{pFinalSizeAndGenSwitch1}
\alias{pFinalSizeAndGenSwitch1}
\title{Joint probability of outbreak final size and number of transmission generations with offspring distribution parameters switched after generation one}
\usage{
pFinalSizeAndGenSwitch1(g, n, j, R0, k0, Rc, kc)
}
\arguments{
\item{g}{Number of generations}

\item{n}{Number of initial cases}

\item{j}{Final size}

\item{R0}{Mean of negative binomial offspring distribution from generation one}

\item{k0}{Dispersion of negative binomial offspring distribution from generation one}

\item{Rc}{Mean of negative binomial offspring distribution from generation two on}

\item{kc}{Dispersion of negative binomial offspring distribution from generation two on}
}
\value{
The joint probability of outbreak final size and number of transmission generations
}
\description{
Joint probability of outbreak final size and number of transmission generations with offspring distribution parameters switched after generation one
}
\examples{
# Probability that 1 initial infection leads to an outbreak of final size 20 over exactly
# 3 generations of transmission:
pFinalSizeAndGenSwitch1(g=3,n=1,j=20,R0=2,k0=0.1,Rc=0.5,kc=1)
}
\author{
Damon Toth
}
