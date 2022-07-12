x = 1:0.1:5;
y = sin(x);
a = 0; b = 5;
coef = (b-a)/2;
n_min = 5; n_max = 80;
alphas = zeros(1,n_max);
otkl = zeros(1,n_max);
fun = @(x) sin(x);
rez = integral(fun,a,b);

for n = n_min:n_max
    poly = Legendre(n);
    t = roots(poly);
    t = sort(t,1,"ascend"); 
    for i=1:n
        t(i) = (t(i))*coef+(a+b)/2;
    end
    As = zeros(n);
    for i = 1:n
        tmp = 1;
        for j = 1:n
            if (j~=i)
                tmp = (conv(tmp,[1,-t(j)]))/(t(i)-t(j));
            end
        end
        As(i,(1:n)) = tmp;
    end
    As_rez = zeros(1,n);
    sum = 0;
    for i = 1:n
        tmp = polyint(As(i,(1:n)));
        As_rez(i) = diff(polyval(tmp,[t(1),t(length(t))]));
        sum = sum + As_rez(i)*sin(t(i));
    end
    otkl(n) = abs(sum - rez);
    alphas(n) = -log(otkl(n))/log(n); 
end
z = n_min:n_max;
subplot(2,1,1);
plot(z,otkl(n_min:n_max));
title('Отклонение');
subplot(2,1,2);
plot(z,alphas(n_min:n_max));
title('Альфы');