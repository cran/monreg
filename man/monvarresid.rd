\name{monvarresid}
\alias{monvarresid}
\title{
Estimating Monotone Variance Functions Using Nonparametric Residuals
}
\description{
monvarresid provides a strictly monotone estimator of the variance
function based on the nonparametric regression model.
}
\usage{
monvarresid(x,y,a=min(x),b=max(x),N=length(x),t=length(x),h,K="epanech",hd,Kd="epanech",
            hr,Kr="epanech",mdegree=1,sdegree=1,inverse=0,monotonie="isoton")
}
\arguments{
\item{x}{vector containing the x-values (design points) of a sample}
\item{y}{vector containing the y-values (response) of a sample}
\item{a}{lower bound of the support of the design points density
function, or smallest fixed design point}
\item{b}{upper bound of the support of the design points density
function, or largest fixed design point}
\item{N}{number or vector of evaluation points of the unconstrained
nonparametric variance estimator (e.g. Nadaraya-Watson estimator)}
\item{t}{number or vector of points where the monotone estimation is 
computed}
\item{h}{bandwith of kernel \eqn{K} of the regression estimation step}
\item{K}{Kernel for the regression estimation step.
'epanech' for Epanechnikov, 'rectangle' for rectangle, 'biweight' for biweight,
'triweight' for triweight, 'triangle' for triangle, 'cosine' for cosine kernel}
\item{hd}{bandwith of kernel \eqn{K_d} of the density estimation step}
\item{Kd}{Kernel for the density estimation step (monotonization step).
'epanech' for "Epanechnikov, 'rectangle' for rectangle, 'biweight' for biweight,
'triweight' for triweight, 'triangle' for triangle, 'cosine' for cosine kernel}
\item{hr}{bandwith of kernel \eqn{K_r} of the variance estimation step}
\item{Kr}{Kernel for the variance estimation step (unconstrained estimation).
'epanech' for "Epanechnikov, 'rectangle' for rectangle, 'biweight' for biweight,
'triweight' for triweight, 'triangle' for triangle, 'cosine' for cosine kernel.}
\item{mdegree}{determines the method for the regression estimation.
'0'for the classical Nadaraya-Watson estimate, '1' for the local linear estimate.
As well \code{mdegree} can be the vector of the estimator provided by the
user for the design points given by the vector \code{x}}
\item{sdegree}{Determines the method for the unconstrained variance estimation.
'0' for the classical Nadaraya-Watson estimate, '1' for the local linear estimate.
As well \code{sdegree} can be the vector of the unconditional estimator provided by the
user for the design points given by the vector \code{N}}
\item{inverse}{For '0' the original variance function is estimated, for '1'
the inverse of the variance function is estimated.}
\item{monotonie}{Determines the type of monotonicity. 'isoton' if the variance
function is assumed to be isotone, 'antinton' if the variance function is assumed to be antitone.}
}
\details{
Nonparametric regression models are of the form \eqn{Y_i = m(X_i) + \sigma(X_i) \cdot \varepsilon_i}, 
where \eqn{m} is the regression funtion and \eqn{\sigma} the variance function.
\code{monvarresid} performs a monotone estimate of the unknown variance function 
\eqn{s=\sigma^2}. \code{monvarresid} first estimates \eqn{m} by an unconstrained nonparametric
method, the classical Nadaraya-Watson estimate or the local-linear estimate 
(unless the user decides to pass his or her own estimate).
In a second step an unconstrained estimation for \eqn{s} is performed, again by the classical 
Nadaraya-Watson method or the local-linear estimate 
(unless the user decides to pass his or her own estimate).
In a third step the inverse of the (monotone) variance function is calculated,
by monotonizing the unconstrained estimate from the second step. With the above notation and 
\eqn{\hat s} for the unconstrained estimate, the third step writes as follows,
\deqn{\hat s_I^{-1} = \frac{1}{Nh_d} \sum\limits_{i=1}^N \int\limits_{-\infty}^t K_d \Bigl( \frac{\hat s (\frac{i}{N} ) - u}{h_d} \Bigr) \; du.}
Finally, the monotone estimate is achieved by inversion of \eqn{\hat s_I^{-1}}.}
\value{
  \code{monvarresid} returns a list of values
  \item{xs}{the input values x, standardized on the interval \eqn{[0,1]}}
  \item{y}{input variable y}
  \item{z}{the points, for which the unconstrained function is estimated}
  \item{t}{the points, for which the monotone variance function will be estimated}
  \item{length.x}{length of the vector x}
  \item{length.z}{length of the vector z}
  \item{length.t}{length of the vector t}
  \item{h}{bandwidth used with the Kernel \eqn{K}}
  \item{hd}{bandwidth used with the Kernel \eqn{K_d}}
  \item{hr}{bandwidth used with the Kernel \eqn{K_r}}
  \item{K}{kernel used for the regression estimation step}
  \item{Kd}{kernel used for the monotonization step}
  \item{Kr}{kernel used for the unconstrained variance estimate}
  \item{mdegree}{method, which was used for the unconstrained regression estimate}
  \item{lmdeg}{ length of the vector mdegree. If lmdeg is not equal to 1 the user provided the vector of the unconditional regression
  estimator for the design points given by the vector x}
  \item{sdegree}{method, which was used for the unconstrained variance estimate}
  \item{lsdeg}{ length of the vector sdegree. If lsdeg is not equal to 1 the user provided the vector of the unconditional variance
  estimator for the design points given by the vector N}
  \item{inverse}{indicates, if the origin variance function or its inverse has been estimated}
  \item{estimation}{the monotone estimate for the variance function at the design points \eqn{t}}
}
\author{
This R Package was developed by Kay Pilz and Stefanie Titoff. Earlier developements of the estimator were made by Holger Dette and Kay Pilz.
}
\seealso{
\code{monreg} for monotone regression function estimation and \code{monvardiff} for monotone variance function estimation by differences.
}
\keyword{nonparametric}
\keyword{smooth}
\keyword{regression}
