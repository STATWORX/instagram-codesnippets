# recursive function
def fib(n):
    if n < 2:
        return n
    else:
        value = fib(n-2) + fib(n-1)
        return value

# using memoization
def fib_memoized(n, mem={}):
    # check whether number was already computed
    if n in mem:
        return mem[n]
    elif n < 2:
        mem[n] = n
        return n
    else:
        value = fib_memoized(n-2) + fib_memoized(n-1)
        # save number at nth position
        mem[n] = value
        return value
