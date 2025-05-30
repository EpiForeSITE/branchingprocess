% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pGenSwitch2.R
\name{pGenSwitch2}
\alias{pGenSwitch2}
\title{Probability that one initial case leads to an outbreak lasting
less than g generations of transmission, with offspring distribution
parameters switched after generation two.}
\usage{
pGenSwitch2(gMax, R0, k0, Rc, kc)
}
\arguments{
\item{gMax}{Maximum number of generations}

\item{R0}{Basic reproduction number: mean of negative binomial offspring distribution from generation one and two}

\item{k0}{Dispersion of negative binomial offspring distribution from generation one and two}

\item{Rc}{Control reproduction number: mean of negative binomial offspring distribution from generation three plus}

\item{kc}{Dispersion of negative binomial offspring distribution from generation three plus}
}
\value{
A vector of probabilities for each number of generations from 1 to gmax
}
\description{
Probability that one initial case leads to an outbreak lasting
less than g generations of transmission, with offspring distribution
parameters switched after generation two.
}
\examples{
# Probability of outbreak lasting less than 1,2,3,...,10 generations:
pGenSwitch2(gMax=10, R0=3, k0=0.1, Rc=0.5, kc=1)
}
\author{
Damon Toth
}
