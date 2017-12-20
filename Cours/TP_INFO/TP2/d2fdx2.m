function result = d2fdx2(t)
    result = -8 * (1 - t.^2)./ (1 + t.^2).^3;
end
