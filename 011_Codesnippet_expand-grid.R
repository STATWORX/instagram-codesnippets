# regular nested for loop ------------------------------------------------------
# define an iterator
iterator <- 0
# must invoke the character vector
x <- character(3 * 4 * 5)
# very complex structure
for (i in 1:3) {
  for (j in letters[1:4]) {
    for (k in LETTERS[1:5]) {
      # increase the iterator each iteration
      iterator <- iterator + 1
      # expand the character vector each time.
      # This is especially time consuming
      x[iterator] <- paste(i, j, k, sep = "_")
    }
  }
}

# apply solution ---------------------------------------------------------------
y <- apply(
  # use expand grid to get all possible combinations
  X =      expand.grid(i = 1:3, j = letters[1:4], k = LETTERS[1:5]),
  MARGIN = 1,
  FUN =    function(x) paste(x["i"], x["j"], x["k"], sep = "_")
)

# purrr solution ---------------------------------------------------------------
library(purrr)
# use pmap to specify a single input argument (.l) that can handle data frames.
# _char ensures that it returns a character vector rather than a list
z <- pmap_chr(
  # once again, use expand grid.
  .l = expand.grid(i = 1:3, j = letters[1:4], k = LETTERS[1:5]),
  # refer to the variables as given within expand.grid()
  # you cannot call the variable names directly but must specify them again
  .f = function(i = i, j = j, k = k) {
    paste(i, j, k, sep = "_")
    })

# yeah, same result! -----------------------------------------------------------
all.equal(sort(x), sort(y), sort(z))
