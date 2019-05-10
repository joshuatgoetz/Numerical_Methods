function I = Simpson(x,y)
% A general MATLAB function for integrating experimental data using
% Simpson’s 1/3 rule. The function will check if there are an odd number of
% intervals, if there are, the trapezoidal rule will be used for the last interval.
% The function numerically evaluates the integral of the vector of function
% values ‘y’ with respect to ‘x’

    x_L = length(x); y_L = length(y);
    checkspace = linspace(x(1),x(x_L),x_L); %Evenly spaced vector of the same length as x, used for error checking
    if nargin ~= 2 %Checks # of input arguments
        error('Simpson function must have two inputs')
    elseif x_L ~= y_L %Checks that length of the vectors is the same
        error('x and y vectors must have the same length')
    elseif x ~= checkspace %Checks that the time vector is evenly spaced
        error('x vector must be evenly space')
    end
    h = x(2) - x(1); %Calculates step sizes
    if round(x_L/2) == x_L/2
        %Odd # of segments, thus approximation will be trapezoidal rule + Simpson's rule
        disp('There is an odd number of segments, so a partial trapezoidal rule must be used for the last segment')
        I = (h)*((y(y_L)+y(y_L-1))/2) + (h/3)*(y(1)+(4*sum(y(2:2:y_L-2)))+(2*sum(y(3:2:y_L-2)))+y(y_L-1));
    else
        %Even # of segments, thus Simpson's rule can be applied independently
        I = (h/3)*(y(1)+(4*sum(y(2:2:y_L-1)))+(2*sum(y(3:2:y_L-1)))+y(y_L));
    end
    fprintf('The integral approximation is: %0.5f \n',I)
end
