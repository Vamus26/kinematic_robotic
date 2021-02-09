%% rotate point 2d
%% Rotiert den Punkt Punkt um Center und den Winkel
function R = rotatePoint2D(point, center, angle)
    R = revolve2D(angle) * point + center;
  
end