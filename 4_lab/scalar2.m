function scal = scalar2(f,g)
    fun = conv(f,g);
    scal = integration(fun);
    scal = polyval(scal, 1) - polyval(scal, -1);
end