function r = rectangle_droite(f, a, b, n)
    h = (b - a) / (n - 1);
    x = linspace(a, b, n);
    y = f(x(2:n));
    r = h * sum(y);
end 
