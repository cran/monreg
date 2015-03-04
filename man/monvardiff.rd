\name{monvardiff}
\alias{monvardiff}
\title{
Estimating Monotone Variance Functions Using Pseudo-Residuals
}
\description{
monvardiff provides a strictly monotone estimator of the variance
function based on the nonparametric regression model.
}
\usage{
monvardiff(x,y,a=min(x),b=max(x),N=length(x),t=length(x),r=2,hr,Kr="epanech",
           hd,Kd="epanech",degree=1,inverse=0,monotonie="isoton")
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
\item{r}{order of the difference scheme, i.e. weights \eqn{d_0,...,d_r} to calculate the pseudo-residuals} 
\item{hr}{bandwith of kernel \eqn{Kr} of the variance estimation step}
\item{Kr}{Kernel for the variance estimation step (unconstrained estimation).
'epanech' for Epanechnikov, 'rectangle' for rectangle, 'biweight' for biweight,
'triweight' for triweight, 'triangle' for triangle, 'cosine' for cosine kernel}
\item{hd}{bandwith of kernel \eqn{K_d} of the density estimation step}
\item{Kd}{Kernel for the density estimation step (monotonization step).
'epanech' for Epanechnikov, 'rectangle' for rectangle, 'biweight' for biweight,
'triweight' for triweight, 'triangle' for triangle, 'cosine' for cosine kernel}
\item{degree}{determines the method for the unconstrained variance estimation.
'0' for the classical Nadaraya-Watson estimate, '1' for the local linear estimate.
As well \code{degree} can be the vector of the unconditional estimator provided by the
user for the design points given in the vector \code{N}}
\item{inverse}{for '0' the original variance function is estimated, for '1'
the inverse of the variance function is estimated.}
\item{monotonie}{determines the type of monotonicity. 'isoton' if the variance
function is assumed to be isotone, 'antinton' if the variance function is assumed to be antitone.}
}
\details{
Nonparametric regression models are of the form \eqn{Y_i = m(X_i) + \sigma(X_i) \cdot \varepsilon_i}, 
where \eqn{m} is the regression funtion and \eqn{\sigma} the variance function.
\code{monvardiff} performs a monotone estimate of the unknown variance function 
\eqn{s=\sigma^2}. \code{monvardiff} first estimates \eqn{s} by an unconstrained nonparametric
method, the classical Nadaraya-Watson estimate or the local- linear estimate 
(unless the user decides to pass his or her own estimate). This estimation contains the usage of the
Pseudo-Residuals. In a second step the inverse of the (monotone) variance function is calculated
by monotonizing the unconstrained estimate from the first step. With the above notation and 
\eqn{\hat s} for the unconstrained estimate, the second step writes as follows,
\deqn{\hat s_I^{-1} = \frac{1}{Nh_d} \sum\limits_{i=1}^N \int\limits_{-\infty}^t K_d \Bigl( \frac{\hat s (\frac{i}{N} ) - u}{h_d} \Bigr) \; du.}
Finally, the monotone estimate is achieved by inversion of \eqn{\hat s_I^{-1}}.}
\value{
  \code{monvardiff} returns a list of values
  \item{xs}{the input values x, standardized on the interval \eqn{[0,1]}}
  \item{y}{input variable y}
  \item{z}{the points, for which the unconstrained function is estimated}
  \item{t}{the points, for which the monotone variance function will be estimated}
  \item{length.x}{length of the vector x}
  \item{length.z}{length of the vector z}
  \item{length.t}{length of the vector t}
  \item{r}{order of the difference scheme, i.e. number of weights to calculate the pseudo-residuals}
  \item{hr}{bandwidth used with the Kernel \eqn{K_r}}
  \item{hd}{bandwidth used with the Kernel \eqn{K_d}}
  \item{Kr}{kernel used for the unconstrained variance estimate}
  \item{Kd}{kernel used for the monotonization step}
  \item{degree}{method, which was used for the unconstrained variance estimate}
  \item{ldeg.vektor}{ length of the vector degree. If ldeg.vektor is not equal to 1 the user provided the vector of the unconditional variance
  estimator for the design points given in the vector N}
  \item{inverse}{indicates, if the origin variance function or its inverse has been estimated}
  \item{estimation}{the monotone estimate at the design points \eqn{t}}
}
\author{
This R Package was developed by Kay Pilz and Stefanie Titoff. Earlier developements of the estimator were made by Holger Dette and Kay Pilz.
}
\seealso{
\code{monreg} for monotone regression function estimation and \code{monvarresid} for monotone variance function estimation by nonparametric residuals.
}
\keyword{
nonparametric}
\keyword{ smooth}
\keyword{ regression
}
