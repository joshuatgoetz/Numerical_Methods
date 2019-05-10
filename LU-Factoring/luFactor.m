function [L,U,P] = luFactor(A)
    %This function will calculate the LU decomposition for a given square
    %matrix, including the upper and lower triangular matrixes as well as
    %the pivot matrix.
    %If an insufficient input is given, an accordant error message will be
    %displayed.
    %
    %Inputs:
    %   A - coefficient matrix
    %Outputs:
    %   L - lower triangular matrix
    %   U - upper triangular matrix
    %   P - the pivot matrix

    [n,m] = size(A);
    if n~= m
        error('Matrix must be a square');
    elseif n == 1
        error('Matrix cannot only be a scalar');
    end
    P = eye(n); %Identity Matrix to keep track of pivoting
    U = A; %A' will be the partially pivoted matrix
    L = zeros(n);
    %%nested for-loop to do guassian elimination
    for i = 1:n-1 %moves across columns
       for k = i:n-1
           [maxc, rindex] = max(abs(U(k:n,i))); %Finds the highest value in the first column not already pivoted & its row #
           %maxc is used for debugging
           rindex = rindex + k - 1; %pivots matrix to move higher absolute values in the first column to the top
           r_1 = U(k,:); r_2 = U(rindex,:); P_1 = P(k,:); P_2 = P(rindex,:); L_1 = L(k,:); L_2 = L(rindex,:); %creates temporary row vectors to store rows which will be pivoted
           U(rindex,:) = r_1;
           U(k,:) = r_2;
           P(rindex,:) = P_1;
           P(k,:) = P_2;
           L(rindex,:) = L_1;
           L(k,:) = L_2;
       end
       for j = i+1:n %moves down rows
           L(j,i) = U(j,i)/U(i,i);
           U(j,:) = U(j,:) - L(j,i)*U(i,:);
       end
    end
    L = L + eye(n)
    U
end
