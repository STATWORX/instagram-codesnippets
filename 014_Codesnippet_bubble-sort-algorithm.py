def custom_bubble_sort(x):
    n = len(x)
    
    # iterate through array x
    for i in range(n):
        
        # the last i elements are already in place
        # switch elements if element j is bigger than element j+1
        for j in range(n-i-1):
            if x[j] > x[j+1]:
                x[j], x[j+1] = x[j+1], x[j]
        
    return x
