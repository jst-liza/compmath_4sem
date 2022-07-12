function Integral = Simpson(x, fun)
    Integral = 0;
    for i = 1:length(x)-1
        Integral = Integral + (x(i+1)-x(i))*(fun(x(i))+4*fun((x(i+1)+x(i))/2)+fun(x(i+1)))/6;
    end
end