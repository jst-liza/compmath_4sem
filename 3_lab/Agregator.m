function [I, I_l, II, II_l, IV] = Agregator(x,y)
    n = length(x);
    
%     for i = 1:n-1
%         h(i) = x(i+1) - x(i);
%     end

    h = x(2)-x(1);

    for i = 1:n-1
        I(i) = (y(i+1)-y(i))/h;
    end
    for i = 2:n
        I_l(i-1) = (y(i)-y(i-1))/h;
    end
    for i = 1:n-2
        II(i) = (4*y(i+1)-3*y(i)-y(i+2))/(2*h);
    end
    for i = 2:n-1
        II_l(i-1) = (y(i+1)-y(i-1))/(2*h);
    end
    for i = 3:n-2
        IV(i-2) = (y(i-2)-8*y(i-1)+8*y(i+1)-y(i+2))/(12*h);
    end

end