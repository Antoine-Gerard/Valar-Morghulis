function r = simpson(f, a, b, n)
    h = (b - a) / (n - 1);
    x = linspace(a, b, n);
    m = 0.5 * ( x(1:n-1) + x(2:n) );
    y = ( f(x(2:n-1)) + 2*f(m(2:end)) ) ;
    r = h * ( 1/6 * f(a) + 1/3 * (2*f(m(1)) + sum(y)) + 1/6 * f(b) );
end 
