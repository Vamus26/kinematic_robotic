function pointInhom = InHomogeneous(point)
% This function returns the inhomogeneous value 
%             of a homogeneour coordinate n-tuple.
% It works for column vectors as well as for rows.
% The dimension n+2 of the input vector is also arbitrary (finite).

    eps = 0.0001;
    n = length(point)-1;
    s = size(point);
    pointInhom = ones(1,n);
    if abs(point(1)) < eps
        factor = sign(point(1))/eps;
    else
        factor = 1/point(1);
    end;
    for i = 1:n 
        pointInhom(i) = factor*point(i+1);
    end 
    if s(2) == 1
        pointInhom = transpose(pointInhom);
    end
end
        
