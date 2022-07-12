function der = derivative(x)
    newsize = length(x)-1;
    if newsize == 0
        der = [0];
        return;
    end
    der = zeros([1, newsize]);
    for i = 1:newsize
        degree = newsize-i+1;
        der(i) = x(i)*degree;
    end
end