function scal = scalar(f,g,a,b)
    fun = conv(f,g);
    t = [(b-a)/2,(a+b)/2];
    t_poly = zeros(length(fun),length(fun)+2);
    n = length(fun);
    t_poly(1,n+2) = 1;
    for i = 1:n-1
        tmp = [1];
        for j = 1:i
            tmp = conv(tmp,t);
        end
        t_poly(i+1,(n-i+2:n+2)) = tmp;
    end
    sum = zeros(1,n+2);
    for i = 1:n
        t_poly(i,(1:n+2)) = t_poly(i,(1:n+2)).*fun(n-i+1);
        sum = sum + t_poly(i,(1:n+2));
    end
    scal = integration(sum);
    scal = polyval(scal,a) - polyval(scal, b);
end