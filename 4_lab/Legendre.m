function L = Legendre(n)
    a = -5; b = 5;
    L = [1];
    x = [1,0,-1];
    for i = 1:n
        L = conv(L,x);
    end
    for i = 1:n
        L = derivative(L);
    end
    
    roots_t = roots(L);
    roots_x = (b-a)/2*roots(L)+(a+b)/2
    
    t = -1:0.01:1;
    x = a:0.01:b;
    
%     subplot(2,1,1);
    plot(t, polyval(L,t));
%     subplot(2,1,2);
%     plot(x, polyval(L,x));

end