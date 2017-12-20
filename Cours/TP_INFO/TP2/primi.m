function r = primi(f, a, b, n)
    r = zeros(n,1);
    h = (b-a) / (n-1);
    for i=1:n-1
        r(i+1) = r(i) + h * f(a + i*h); 
end		
