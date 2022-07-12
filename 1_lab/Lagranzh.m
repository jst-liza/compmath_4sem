function L = Lagranzh(n, x, y)
    L = 0;
    for i = 1:(n-1)
        L = conv(L,[0,1]);
    end
    for i = 1:n
        tmp = 1;
        for j = 1:n
            if (j~=i)
                tmp = (conv(tmp,[1,-x(j)]))/(x(i)-x(j));
            end
        end
        L = L + tmp*y(i);
    end
end
