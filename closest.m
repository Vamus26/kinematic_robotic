function u = closest(c, a, b)
    if norm(b-c) < norm(a-c)
        u = b;
    else
        u = a;
    end
end