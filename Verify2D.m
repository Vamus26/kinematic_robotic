%% testen revolve2D

Drehmatrix = revolve2D(pi/2);

%% Testen Rod2D

a = [0; 0];
b = [80; 50];
width = 10;

rod2D(a,b,width,true,true,'r','k');
axis equal

%% Testen rotatePoint2D

center = [5; 5];
point = [5; 0]; 

Prev = rotatePoint2D(point, center, pi/2);

%% Testen Hom
%%Hom(c)

%% Teseten InHom

q = [3; 6; 15];
InHom(q)

%% Wir teste ein motionMatrix2D an einem seriellen 2-achsigen Roboter

width = 10;
r = [60 80];
angle = [pi/6 pi/4];
a = [0;0]; aHom = Hom(a);
b = [r(1);0]; bHom = Hom(b);
zero = [0;0];
M = motionMatrix2D(zero, angle(1));
aaHom = M * aHom;
bbHom = M * bHom;

fig = get(groot, 'CurrentFigure');
fig.Visible = 'off';
rod2D(InHom(aaHom),InHom(bbHom),width,true,true,'r','k');
hold on;
a = [0;0]; aHom = Hom(a);
b = [r(2);0]; bHom = Hom(b);
shift = [r(1);0];
N = motionMatrix2D(shift, angle(2));
M = M * N;
aaHom = M * aHom;
bbHom = M * bHom;
rod2D(InHom(aaHom),InHom(bbHom),width,true,true,'b','k');

hold off;
fig.Visible = 'on';
axis equal;

%%  Vorw�rtskinemtaik serieller Roboter 2D

%                     function M = dirKinSerial2D(u,r,k)
% 
%                     shift = [0;0];
%                     M = eye(3);
% 
%                         for i=1:k
%                              N = motionMatrix2D(shift,u,i);
%                              M = M * N;
%                              shift[r(i); 0];
%                         end
%                     end

%% showRobot2D

%                         function showRobot2D(u, r, k)
% 
%                             width = 10;
%                             color = ['b', 'r', 'y', 'g', 'w', 'k'];
% 
%                             aHom = [1;0;0];
% 
%                             for i = 1:k
%                                 b = [r(i); 0];
%                                 M = dirKinSerial2D(u,r,i)
%                                 aa = InHom(M * aHom)
%                                 bb = InHom(M * Hom(b))
%                                 rod2D(aa, bb, width, true, true, color(i), 'k');
%                             end
%                         end

%% Trying the whole thing out

clc; clear all; clf;

% Radient angeben
u = pi/180 * [30, 45, -22.5, 60, -36, -90];
r = [60, 50, 40, 35, 40, 30];
k = 6;

fig = get(groot, 'CurrentFigure');
fig.Visible = 'off';
hold on;

showRobot2D(u, r, k);

hold off;
axis equal;
fig.Visible = 'on';


%% Roboter Animation

clc; clear all; clf;

% Radient angeben
u = pi/180 * [30, 45, -22.5, 60, 90, -90];
r = [60, 50, 40, 35, 40, 30];
k = 6;
steps = 40;

% Animation loop
% for i = 1:steps
%     clf;
%     fig = get(groot, 'CurrentFigure');
%     fig.Visible = 'off';
%     hold on;
% 
%     showRobot2D(i/steps*u, r, 6);
% 
%     hold off;
%     xlim([-20, 240]);
%     ylim([-10, 200]);
%     axis equal;
%     fig.Visible = 'on';
%     drawnow expose;
% end

%% Inverse Kinematik eines seriellen 2D Roboters

clear all; clc; clf;

r = [55 70 50];
phi = 80*pi/180;
last_u = [30 -30 phi]*pi/180;

% Kurve
nop = 240;
t = linspace(0,2*pi,nop);
a = 50;
b = 30;
center = [75; 85];
distortion = [0*t; 0.05*a*sin(2*t)];
Curve = [center(1) + a * cos(t); center(2) + b * sin(t)] + distortion;


 %Animation loop
 for i = 1:nop
     clf;
     u = inverseKinSerial2D(r, Curve(:,i),phi,last_u);
     last_u = u;
     
     fig = get(groot, 'CurrentFigure');
     fig.Visible = 'off';
     hold on;
 
     
     c = plot(Curve(1,:), Curve(2,:));
     set(c, 'Color', [0, 0.5, 0.25], 'LineWidth', 6);
     showRobot2D(u, r, 3);
 
     hold off;
     fig.Visible = 'on';
     
     xlim([-60, 160]);
     ylim([-10, 140]);
     axis equal;
     
     drawnow expose;
 end
    
    
    
    
    
    
    
    
    
    
    

