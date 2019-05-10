Uses False Position Approximation method to approximate roots of a function
   
   
   Inputs:
   
       func - the function being evaluated; must begin with @('variable used in function') ex. func = @(x) x^2
       xl - the lower guess
       xu - the upper guess
       es - the desired relative error (should default to 0.0001%)
       maxiter - the number of iterations desired (should default to 200)
       
   Outputs:
   
       root - the estimated root location
       fx - the function evaluated at the root location
       ea - the approximate relative error (%)
       iter - how many iterations were performed
       
IMPORTANT: clear workspace before running function
