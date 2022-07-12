function Integral = mid_rectangle(x, fun)
    Integral = 0;
    for i = 1:length(x)-1
        Integral = Integral + (x(i+1)-x(i))*fun((x(i)+x(i+1))/2);
    end
end