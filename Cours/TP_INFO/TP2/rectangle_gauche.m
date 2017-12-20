function r = rectangle_gauche(f, a, b, n)
    h = (b - a) / (n - 1);
    x = linspace(a, b, n);
    y = f(x(1:n-1));
    r = h * sum(y);
end 

