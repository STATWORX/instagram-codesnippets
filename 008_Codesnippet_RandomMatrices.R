
# creating two random matrices and a vector 
set.seed(1632)
nrow <- 1e3
A <- matrix(sample(1:100, nrow^2, replace = TRUE), nrow=nrow)
B <- matrix(sample(1:100, nrow^2, replace = TRUE), nrow=nrow)
c <- c(sample(1:100, nrow, replace = TRUE))

# checking matrix calculation
microbenchmark::microbenchmark(
  {A%*%B%*%c},
  {A%*%(B%*%c)},
  times = 100,
  unit = "s"
)

# expr                 mean time in s
#   { A %*% B %*% c }      0.77973594
# { A %*% (B %*% c) }      0.01442676

# Conclusion: order matters and can save a lot of time!
# Note: there are small machine precision diffrences