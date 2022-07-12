function int = integration(x)
    newSize = length(x)+1;
    int = zeros(1,newSize);
    for i = 1:newSize-1
        int(i) = x(i)/(newSize-i);
    end
end