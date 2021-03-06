\name{skewness}
\alias{skewness}
\alias{skewness.default}
%\alias{skewness.data.frame}
%\alias{skewness.POSIXct}
%\alias{skewness.POSIXlt}

\title{Skewness}

\description{
The \code{skewness.default} function from package \pkg{fBasics} is completed in order  
to implement Bickel's measure of skewness, based on the mode of the
distribution considered.
}

\usage{
skewness(x, 
         \dots)

  \method{skewness}{default}(x, 
         na.rm = FALSE, 
         method = c("moment", "fisher", "bickel"), 
         M = shorth(x), 
         \dots)
}


\arguments{
  \item{x}{ numeric. Vector of observations. }
  \item{na.rm}{ logical. Should missing values be removed? }
  \item{method}{ character. Specifies the method of computation. 
      These are either \code{"moment"}, \code{"fisher"} or \code{"bickel"}. 
      The \code{"moment"} method is based on the definition of 
      skewness for distributions; this form should 
      be used when resampling (bootstrap or jackknife). The 
      \code{"fisher"} method corresponds to the usual "unbiased" 
      definition of sample variance, although in the case of skewness 
      exact unbiasedness is not possible. 
      }
  \item{M}{ numeric. (An estimate of) the mode of the observations \code{x}. 
      Default value is \code{\link{shorth}(x)}. }
  \item{\dots}{ arguments to be passed. }
}

\value{
\code{skewness} returns a numeric value. 
An attribute which reports the method used is added.
}

\references{
  \itemize{
    \item Bickel D.R. (2002).
    Robust estimators of the mode and skewness of continuous data.
    \emph{Computational Statistics and Data Analysis}, \bold{39}:153-163.
    
    \item Bickel D.R. et Fruehwirth R. (2006).
    On a Fast, Robust Estimator of the Mode: Comparisons to Other Robust Estimators with Applications.
    \emph{Computational Statistics and Data Analysis}, \bold{50}(12):3500-3530.
  }
}

\author{
Diethelm Wuertz and other authors for the original \code{skewness} function from 
package \pkg{fBasics}; \cr
P. Poncet for the slight modification introduced.
}

\seealso{ package \pkg{fBasics}; 
\code{\link{mlv}} for general mode estimation;
\code{\link{shorth}} for the shorth estimate of the mode
%\code{\link{skewness.data.frame}};
%\code{\link{skewness.POSIXct}};
%\code{\link{skewness.POSIXlt}}
}  

\examples{
## Skewness = 0
x <- rnorm(1000)
skewness(x, method = "bickel", M = shorth(x))

## Skewness > 0 (left skewed case)
x <- rbeta(1000, 2, 5)
skewness(x, method = "bickel", M = betaMode(2, 5))

## Skewness < 0 (right skewed case)
x <- rbeta(1000, 7, 2)
skewness(x, method = "bickel", M = hsm(x, bw = 1/3))
}

\keyword{univar}
