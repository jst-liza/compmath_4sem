function P = cubicsplines(x,y)
      
    n = length(x);
    
    h = zeros(n-1,1);
    for j = 1:n-1
        h(j) = x(j+1) - x(j);
    end
    
    H = zeros(n);
    H(1,1)= 1;
    H(n,n) = 1;
    
    for i = 2:n-1
        H(i,i-1) = h(i-1);
        H(i,i) = 2*(h(i-1)+h(i));
        H(i,i+1) = h(i);
    end
    
    b = zeros(n,1);
    for i = 2:n-1
        b(i) = (3/h(i))*(y(i+1)-y(i)) - (3/h(i-1))*(y(i)-y(i-1));
    end
    b_i = H\b;
    
    c_i = zeros(n-1,1);
    for i = 1:n-1
        c_i(i) = (1/h(i))*(y(i+1)-y(i)) - (1/3*h(i))*(2*b_i(i)+b_i(i+1));
    end
    
    a_i = zeros(n-1,1);
    for i = 1:n-1
        a_i(i) = (1/(3*h(i))) * (b_i(i+1)-b_i(i));
    end
    
    P = zeros(n-1,4);
    for i = 1:n-1
        P(i,1) = a_i(i);
        P(i,2) = b_i(i);
        P(i,3) = c_i(i);
        P(i,4) = y(i);
    end
    
end