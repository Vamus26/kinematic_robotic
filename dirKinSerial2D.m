function M = dirKinSerial2D(u,r,k)

shift = [0;0];
M = eye(3);

    for i=1:k
         N = motionMatrix2D(shift,u(i));
         M = M * N;
         shift = [r(i); 0];
    end
end