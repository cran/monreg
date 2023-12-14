\name{monreg}
\alias{monreg}
\title{
Estimating Monotone Regression Functions Nonparametrically
}
\description{
monreg provides a strictly monotone estimator of the regression
function based on the nonparametric regression model.
}
\usage{
monreg(x, y, a = min(x), b = max(x), N = length(x), t = length(x),
       hd, Kd = "epanech", hr, Kr = "epanech", degree = 1,
       inverse = 0, monotonie = "isoton")
}
\arguments{
\item{x}{vector containing the x-values (design points) of a sample}
\item{y}{vector containing the y-values (response) of a sample}
\item{a}{lower bound of the support of the design points density
function, or smallest fixed design point}
\item{b}{upper bound of the support of the design points density
function, or largest fixed design point}
\item{N}{number or vector of evaluation points of the unconstrained
nonparametric regression estimator (e.g. Nadaraya-Watson estimator)}
\item{t}{number or vector of points where the monotone estimation is 
computed}
\item{hd}{bandwith of kernel \eqn{K_d} of the density estimation step}
\item{Kd}{Kernel for the density estimation step (monotonization step).
'epanech' for Epanechnikov, 'rectangle' for rectangle, 'biweight' for biweight,
'triweight' for triweight, 'triangle' for triangle, 'cosine' for cosine kernel}
\item{hr}{bandwith of kernel \eqn{K_r} of the regression estimation step.}
\item{Kr}{Kernel for the regression estimation step (unconstrained estimation).
'epanech' for Epanechnikov, 'rectangle' for rectangle, 'biweight' for biweight,
'triweight' for triweight, 'triangle' for triangle, 'cosine' for cosine kernel.}
\item{degree}{Determines the method for the unconstrained estimation.
'0' for the classical Nadaraya-Watson estimate, '1' for the local linear estimate.
As well degree can be the vector of the unconditional estimator provided by the
user for the design points given in the vector \code{N}}
\item{inverse}{For '0' the original regression function is estimated, for '1'
the inverse of the regression function is estimated.}
\item{monotonie}{Determines the type of monotonicity. 'isoton´ if the regression
function is assumed to be isotone, 'antinton' if the regression function is assumed to be antitone.}
}
\details{
Nonparametric regression models are of the form \eqn{Y_i = m(X_i) + \sigma(X_i) \cdot \varepsilon_i}, 
where \eqn{m} is the regression funtion and \eqn{\sigma} the variance function.
\code{monreg} performs a monotone estimate of the unknown regression function 
\eqn{m}. \code{monreg} first estimates \eqn{m} by an unconstrained nonparametric
method, the classical Nadaraya-Watson estimate or the local- linear estimate 
(unless the user decides to pass his or her own estimate).
In a second step the inverse of the (monotone) regression function is calculated,
by monotonizing this unconstrained estimate. With the above notation and 
\eqn{\hat m} for the unconstrained estimate, the second step writes as follows,
\deqn{\hat m_I^{-1} = \frac{1}{Nh_d} \sum\limits_{i=1}^N \int\limits_{-\infty}^t K_d \Bigl( \frac{\hat m (\frac{i}{N} ) - u}{h_d} \Bigr) \; du.}
Finally, the monotone estimate achieved by inversion of \eqn{\hat m_I^{-1}}.}
\value{
  \code{monreg} returns a list of values
  \item{xs}{the input values x, standardized on the interval \eqn{[0,1]}}
  \item{y}{input variable y}
  \item{z}{the points, for which the unconstrained function is estimated}
  \item{t}{the points, for which the monotone function values will be estimated}
  \item{length.x}{length of the vector x}
  \item{length.z}{length of the vector z}
  \item{length.t}{length of the vector t}
  \item{hd}{bandwidth used with the Kernel \eqn{K_d}}
  \item{hr}{bandwidth used with the Kernel \eqn{K_r}}
  \item{Kd}{kernel used for the monotonization step}
  \item{Kr}{kernel used for the initial unconstrained regression estimate}
  \item{degree}{method, which was used for the unconstrained regression estimate}
  \item{ldeg.vektor}{ length of the vector degree. If ldeg.vektor is not equal to 1 the user provided the vector of the unconditional
  estimator for the design points given in the vector N}
  \item{inverse}{indicates, if the origin regression function or its inverse has been estimated}
  \item{estimation}{the monotone estimate at the design points \eqn{t}}
  ...
}
\author{
This R Package was developed by Kay Pilz and Stefanie Titoff. Earlier developements of the estimator were made by Holger Dette and Kay Pilz.
}
\seealso{
\code{monvardiff} and \code{monvarresid} for monotone variance function estimation.
}
\keyword{ nonparametric }
\keyword{ smooth }
\keyword{ regression }
\examples{
x <- rnorm(100)
y <- x + rnorm(100)
mon1 <- monreg(x, y, hd = .5, hr = .5)
plot(mon1$t, mon1$estimation)
}
