function rod2D(a,b,width,round1,round2,fcol,lcol)

% This procedure is meant to deliver a cylinder rod in 2D
% The points a, b are the endpoints of the centerline
% The width is the overall diameter
% round1 and round2 are two flags (true/false); 
% they say whether the rod is rounded off at the side of the point a. 
% round 2 tells the same thing with b.
% fcol refers to the overall paint,
% lcol refers to the paint of the circumference.

%fig = get(groot,'CurrentFigure');
%fig.Visible = 'off';

q = 20; % This is the number of increments 
        % at either end (circle or straight line).        
direction = b - a;
across = [b(2)-a(2);a(1)-b(1)];
across = across/norm(across)*width/2;
R1 = a + across; 
R2 = a + across + direction; 
R3 = a - across + direction; 
R4 = a - across;
R = [linspace(0,1,2*q);linspace(0,1,2*q)];
t = linspace(0,1,q);
if round2
   for i = 1:q
        Rev = revolve2D(pi/(q-1)*(i-1));
        R(:,i) = b + Rev*(R2-b);           
   end  
else
for i = 1:q
   R(:,i) = (1-t(i))*R2 + t(i)*R3;           
end
end;
if round1 
   for i = 1:q
        Rev = revolve2D(pi/(q-1)*(i-1));
        R(:,q+i) = a + Rev*(R4-a);           
   end 
else
for i = 1:q
   R(:,i+q) = (1-t(i))*R4 + t(i)*R1;          
end
end;
rPlot = fill(R(1,:),R(2,:),fcol);
set(rPlot, 'LineWidth', 1, 'EdgeColor', lcol);

end
