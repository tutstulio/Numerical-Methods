function erro = criterioParada(x0, x1, tolerancia)
    
    n = numel(x0);

    d = zeros(1, n);
    for i = 1:n
        d(i) = abs(x1(i) - x0(i));
    end
    erro = max(d)/max(abs(x1));
    
    if (erro > tolerancia)
        disp('Continuar metodo');
    else
        disp('O metodo convergiu!');
    end

end

