function N = Newton(n, h, x_1, y)
    x = x_1:h:(x_1)+(n-1)*h;
    N = y(1);
    tmp = 1;
    for i = 2:n
        for j = n:-1:i
            y(j) = y(j)-y(j-1);
        end
        N = conv(N,[0,1]);
        tmp = conv(tmp, [1,-x(i-1)]);
        N = N + (y(i)/(factorial(i-1)*h^(i-1)))*tmp;
    end
end
