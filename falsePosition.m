function [root, fx, ea, iter] = falsePosition(func,xl,xu,es,maxiter)
%Uses False Position Approximation method to approximate roots of a function
%   Inputs:
%       func - the function being evaluated; must begin with @('variable used in function') ex. func = @(x) x^2
%       xl - the lower guess
%       xu - the upper guess
%       es - the desired relative error (should default to 0.0001%)
%       maxiter - the number of iterations desired (should default to 200)
%   Outputs:
%       root - the estimated root location
%       fx - the function evaluated at the root location
%       ea - the approximate relative error (%)
%       iter - how many iterations were performed
%IMPORTANT: clear workspace before running function

    %check Validity of Bracket for the function, will throw error if signs
    %are the same or if a limit is evaluated to be zero
    if feval(func,xu)*feval(func,xl) > 0
       error('Lower and Upper limits have the same sign, a root may not exist in this bracket. Please redefine limits') 
    end
    
    %checking # of input variables, setting standard values for missing inputs, and throwing error if there aren't enough
    if nargin < -1
        error('Insufficient number of input variables')
    elseif nargin == 3
        es = 0.0001;
        maxiter = 200;
    elseif nargin == 4
        maxiter = 200;
    end
    
    %initilizing appx error, # of iterations, and creating vector to store
    %root approximations
    ea=100;iter=0; xr = 0;
    while ea > es && iter < maxiter %will break if max iterations or minimum error is surpassed
        oldroot = xr;
        xr = xu - ((feval(func,xu)*(xl-xu))/(feval(func,xl)-feval(func,xu))); %calculates new root approximation
        if iter > 1
            ea = abs(100*((xr-oldroot)/xr)); %calculates appx error
        end
        % I don't use division to check sign differences below in case of rounding float errors
        if (sign(feval(func,xl)) == sign(feval(func,xr))) %moves xl to the right if xr and xl have the same sign
            xl = xr;
        elseif (sign(feval(func,xu)) == sign(feval(func,xr)))%moves xu to the left if xr and xu have the same sign
            xu = xr;
        end
        iter = iter + 1; %increments the iteration counter
    end
    
    root = xr; %declare final approximated root
    fx = feval(func,root); %evalutes function at final root
    %display outputs of the function
    fprintf('The root was found to be close to %10.10f, which has a value of %1.10f when evaluated by the function.\nThe final approximate error is %1.10f, and there were %2.0f iterations.\n',root,fx,ea,iter);
end