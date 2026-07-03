\name{lbo_metaheuristic}

\alias{lbo_metaheuristic}

\title{Ladybug Optimization Algorithm (LBO)}

\description{Provides an implementation of the Ladybug Optimization (LBO) algorithm for
             optimization problems.}

\details{The Ladybug Optimization algorithm is a swarm intelligence metaheuristic inspired
         by the biological behaviors of ladybugs. The algorithm simulates phases such as
         foraging/dispersion using Lévy flights, hibernation (aggregation based on global heat),
         and survival during freezing temperatures to explore and exploit the feasible
         search space.}

\usage{
  lbo_metaheuristic(
    obj.fun,
    pop.size=30,
    dim=2,
    lb,
    ub,
    gen=100,
    pb=0,
    EE=FALSE,
    pa=0.1,
    sigma=0.05,
    beta=8,
    temp.init=100,
    ...)
}

\arguments{
  \item{obj.fun}{
    A function to be minimized, with first argument the vector of parameters
    over which minimization is to take place.
  }
  \item{pop.size}{
    An integer specifying the population size (number of ladybugs).
  }
  \item{dim}{
    An integer indicating the dimensionality of the search space.
  }
  \item{lb}{
    A numeric vector defining the lower bounds of the search space.
  }
  \item{ub}{
    A numeric vector defining the upper bounds of the search space.
  }
  \item{gen}{
    An integer specifying the maximum number of generations (iterations).
  }
  \item{pb}{
    An integer specifying the patience limit for early stopping
    (the number of consecutive generations without improvement
    before the algorithm terminates).
  }
  \item{EE}{
    A logical value indicating whether to enable explicit exploration
    mechanisms during population initialization process.
  }
  \item{pa}{
    A numeric value representing the maximum proportion of the population
    allowed to die during the freezing phase.
  }
  \item{sigma}{
    A numeric value controlling the step size during the foraging/dispersion
    phase (Lévy Flight).
  }
  \item{beta}{
    A numeric value representing the parameter for the survival probability equation.
  }
  \item{temp.init}{
    A numeric value specifying the initial environmental temperature.
  }
  \item{...}{
    Additional arguments of the objective function.
    }
}

\value{
  Returns a list with the following entries:
  \item{\code{best.fit}}{A numeric value representing the best fitness
              value found by the algorithm.}
  \item{\code{best.sol}}{A numeric vector representing the best individual
              (solution) found that achieved the \code{best.fit} value.}
}

\examples{
  obj.fun <- function (x){
  y <- sum(x^2)
  return (y)
  }
  pop.size <- 30
  dim <- 2
  lb <- -5.12
  ub <- 5.12
  gen <- 100
  pb <- 20
  EE <- TRUE

  res.sphere <- lbo_metaheuristic(obj.fun, pop.size, dim, lb, ub, gen, pb, EE)

  cat("Best value on Sphere: ", paste(round(res.sphere$best.fit, 4),
      collapse=", "), "\n")
  cat("Best solution en Sphere: ", paste(round(res.sphere$best.sol, 4),
      collapse=", "), "\n")
}

\references{
  Safiri, S., & Nikoofard, A. (2022). Ladybug Beetle Optimization algorithm: application for real-world problems. \emph{The Journal of Supercomputing}, 79, 3511-3560. \doi{10.1007/s11227-022-04755-2}
}
