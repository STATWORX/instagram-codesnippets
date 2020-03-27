# for loop with empty target vector and combine --------------------------------
myfun1 <- function(){
  # invoke an empty target object
  x <- NULL
  for (i in 1:300) {
    for (j in letters) {
      # use combine every time
      x <- c(x, paste(i, j, sep = "_"))
    }
  }
}

# for loop with iterator and correct vector length -----------------------------
myfun2 <- function(){
  # use an iterator
  iterator <- 0
  # invoke an target object with the correct class and length
  x <- character(300 * length(letters))
  for (i in 1:300) {
    for (j in letters) {
      # increase the iterator each iteration
      iterator <- iterator + 1
      # assign the result to the correct position in the target vector
      x[iterator] <- paste(i, j, sep = "_")
    }
  }
}

# apply loop -------------------------------------------------------------------
myfun3 <- function(){
  y <- apply(
    # use expand grid to get all possible combinations
    # the variable names are not necessary but might increase readability
    X =      expand.grid(i = 1:300, j = letters),
    # 1 for "rowwise" iteration
    MARGIN = 1,
    FUN =    function(x) paste(x["i"], x["j"], sep = "_"))
}

# yeah, same result! -----------------------------------------------------------
all.equal(myfun1(), myfun2(), trimws(myfun3()))
