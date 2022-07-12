%cos(narccosx)
function T = Chebyshev(n)
    T_prev = [0,1];
    T_cur = [1,0];
    T_2xcur = 0;
    T_next = [0,0];
    for i = 1:1:n-1
        T_2xcur = conv(T_cur,[2,0]);
        if i > 1
            T_prev = conv(T_prev,[0,1]);
        end
        T_prev = conv(T_prev,[0,1]);
        T_next = T_2xcur-T_prev;
        T_prev = T_cur;
        T_cur = T_next;
    end
    T_norm = 1/(2^(n-1))*T_next;
    T = T_norm;
end
