function L = Gram_Schmidt(n)
    a = -1; b = 1;
    n = n+1;
    poly = zeros(n);
    for i = 1:n
        poly(i,n-i+1) = 1; 
    end
    for i = 2:n
        ortog = zeros(1,n);
        for j = 1:i-1
            ortog = ortog + poly(j,(1:n)) * (scalar(poly(i,(1:n)),poly(j,(1:n)), a, b)/scalar(poly(j,(1:n)),poly(j,(1:n)), a, b));
%             ortog = ortog + poly(j,(1:n)) * (scalar2(poly(i,(1:n)),poly(j,(1:n)))/scalar2(poly(j,(1:n)),poly(j,(1:n))));
        end
        poly(i,(1:n)) = poly(i,(1:n)) - ortog;
    end
    L = poly(n,(1:n));
    roots_x = roots(L);
    z = a:0.01:b;
    hold on
    for i = 1:n
        plot(z, polyval(poly(i,(1:n)),z));
    end
end
