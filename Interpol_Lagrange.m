%% Interpolação por Método de Lagrange
% Gera um polinomio interpolador
%
% x = vetor domínio;
% y = vetor imagem;

%%
syms X;
x = [-1 0 2];

% Grau do polinomio;
n = length(x);
L = 1;

for j = 1:n
    for i = 1:n
        if i ~= j
            L = (X - x(i)) / (x(j) - x(i));
            disp(L);
        end
    end
    %P = P + y(j) * L(j);
end

%P = poly2sym(coef);