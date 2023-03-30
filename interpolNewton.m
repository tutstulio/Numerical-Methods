%% Interpolação por Método de Newton
% Gera um polinomio interpolador
%
% x = vetor domínio;
% y = vetor imagem ou symbolic;

%%
function P = interpolNewton(x, y)

    % Grau do polinomio;
    n = length(x) - 1;

    % Operador diferenca dividida
    dd = zeros(n+1);
    dd(:,1) = y;
    
    for j = 1:n
        for i = 0:n-j
            dd(i+1,j+1) = (dd(i+2, j) - dd(i+1, j)) / (x(i+j+1) - x(i+1));
        end
    end
    
    coef = dd(1,:);
    disp(coef);
    P = poly2sym(coef);

end