function cPlot = circle2D(a,radius,fcol,lcol)

% This procedure is meant to deliver a circle centered in a.
% fcol refers to the overall paint,
% lcol refers to the paint of the circumference.

q = 60; % This is the number of points on the circle  

for i = 1:q
    Rev = revolve2D(2*pi/(q-1)*(i-1));
    R(:,i) = a + radius* Rev*([1;0]);           
end   

cPlot = fill(R(1,:),R(2,:),fcol);
set(cPlot, 'LineWidth', 2, 'EdgeColor', lcol);
axis equal
end


