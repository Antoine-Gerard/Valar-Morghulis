function r = trapeze(f, a, b, n)
    h = (b - a) / (n - 1);
    x = linspace(a, b, n);
    y = 0.5 * ( f(x(1:n-1)) + f(x(2:n)) );
    r = h * sum(y);
end 

