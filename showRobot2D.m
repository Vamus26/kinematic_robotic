function showRobot2D(u, r, k)

    width = 10;
    color = ['b', 'r', 'y', 'g', 'w', 'k'];

    aHom = [1;0;0];

    for i = 1:k
        b = [r(i); 0];
        M = dirKinSerial2D(u,r,i);
        aa = InHom(M * aHom);
        bb = InHom(M * Hom(b));
        rod2D(aa, bb, width, true, true, color(i), 'k');
    end
end