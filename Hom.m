function pointHom = Homogeneous(point)
    n = length(point);
    s = size(point);
    pointHom(1) = 1;
    for i = 2:n+1 
        pointHom(i) = point(i-1);
    end 
    if s(2) == 1
        pointHom = transpose(pointHom);
    end
end
        
