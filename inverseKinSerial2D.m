function u = inverseKinSerial2D(r, p, phi, last_u)

    q = p - r(3)*[cos(phi); sin(phi)];
    d = norm(q);

    alpha = atan2(q(2), q(1));

    if abs((d^2+r(1)^2-r(2)^2)/(2*r(1)*d)) < 1
        beta = acos((d^2+r(1)^2-r(2)^2)/(2*r(1)*d));
    else
        beta = 0;
    end

    u11 = alpha + beta;
    u12 = alpha - beta;

    s1 = r(1) * [cos(u11); sin(u11)];
    s2 = r(1) * [cos(u12); sin(u12)];

    w1 = q - s1;
    w2 = q - s2;

    u21 = atan2(w1(2),w1(1)) - u11;
    u22 = atan2(w2(2),w2(1)) - u12;

    u31 = phi - u11 - u21;
    u32 = phi - u12 - u22;

    u1 = [u11, u21, u31];
    u2 = [u12, u22, u32];

    u = closest(last_u, u1, u2);
end