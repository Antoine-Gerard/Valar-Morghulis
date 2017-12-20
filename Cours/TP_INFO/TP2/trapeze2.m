function r = trapeze2(f, a, b, n)
    rG = rectangle_gauche(f,a,b,n);
    rD =  rectangle_droite(f,a,b,n);
    r = 0.5 * ( rG + rD );
end 
