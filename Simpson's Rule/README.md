A general MATLAB function for integrating experimental data using
Simpson’s 1/3 rule. The function will check if there are an odd number of
intervals, if there are, the trapezoidal rule will be used for the last interval.
The function numerically evaluates the integral of the vector of function
values ‘y’ with respect to ‘x’

  Inputs:
    x - row vector which serves as the integrated domain; IMPORTANT: must be evenly spaced
    y - contains the values of the function when evaluated at the values stored in 'x'
  Outputs :
    I - Simpson's rule approximation of the integral
