function x = gaussJacobi(A, b)
tic
    n = size(A, 2);     % dimensao do problema
    x = zeros(n, 1);    % vetor solucao (aproximada)
    
    tol = 10^(-8);      % precisao ou tolerancia para o teste de parada
    maxIter = 1000;     % numero maximo de iteracoes
    conv = false;       % indicador de convergencia
    
    % Realiza a iteracao de Gauss-Jacobi sobre o vetor x
    for iter = 1:maxIter
        x0 = x;
        for i = 1:n
            S = 0;
            for j = 1:n
                if j ~= i
                    S = S + A(i,j)*x(j);
                end
            end
            x0(i) = (b(i) - S) / A(i,i);
        end
        x = x0;
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

