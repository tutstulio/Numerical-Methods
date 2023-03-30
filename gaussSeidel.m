function x = gaussSeidel(A, b)
tic
    n = size(A, 2);     % dimensao do problema
    x = zeros(n, 1);    % vetor solucao (aproximada)
    
    tol = 10^(-8);      % precisao ou tolerancia para o teste de parada
    maxIter = 1000;     % numero maximo de iteracoes
    conv = false;       % indicador de convergencia
    
    % Realiza a iteracao de Gauss Seidel sobre o vetor x
    for iter = 1:maxIter
        for i = 1:n
            S = 0;
            for j = 1:n
                if j ~= i
                    S = S + A(i,j)*x(j);
                end
            end
            x(i) = (b(i) - S) / A(i,i);
        end
        if abs(A*x-b) < tol
            conv = true;
            break;
        end
    end
    
    if conv == true
        disp('O método convergiu!');
        disp(iter);
    else
        disp('O metodo nao convergiu');
    end
toc
end

