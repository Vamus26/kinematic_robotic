
function M = motionMatrix2D(shift, angle)
    cs = cos(angle);
    sn = sin(angle);
    M = [1 0 0; shift(1) cs -sn; shift(2) sn cs]
end