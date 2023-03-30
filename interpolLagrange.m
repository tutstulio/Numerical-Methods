%% Interpolação por Método de Lagrange
% Gera um polinomio interpolador
%
% x = vetor domínio;
% y = vetor imagem;

%%
function P = interpolLagrange(x)

    syms X;

    % Grau do polinomio;
    n = length(x);
    L = 1;
    
    for j = 1:n
        for i = 1:n
            if i ~= j
                L = (X - x(i)) / (x(j) - x(i));
            end
        end
        %P = P + y(j) * L(j);
    end
    
    %P = poly2sym(coef);

end