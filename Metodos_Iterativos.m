close all; clear; clc; format short;

% ========== CRITERIO DE PARADA ==========

tolerancia = 0.07;
    
x0 = [0.5, 0.5, 0.5];
x1 = [0.95, 0.945, 0.9945];
    
erro = max([abs(x1(1)-x0(1)), abs(x1(2)-x0(2)), abs(x1(3)-x0(3))])/ max([abs(x1(1)), abs(x1(2)), abs(x1(3))])

if (erro > tolerancia)
    disp('Continuar metodo');
else
    disp('O metodo convergiu!');
end

% ========== CRITERIO DAS LINHAS ==========

A = [10 2 1; 1 5 1; 2 3 10];
tamanhoA = size(A, 2);
somatorio = 0;
alfa = ones(1, tamanhoA);

for i = 1:tamanhoA
    for j = 1:tamanhoA
        if j ~= i
            somatorio = somatorio + abs(A(i,j));
        end
    end
    alfa(i) = somatorio / abs(A(i,i));
end

alfaMax = max(alfa);

if (alfaMax < 1)
    disp('Converge! A diagonal é dominante!');
else
    disp('Não converge');
end

% ========== CRITERIO DE SASSENFELD ==========

B = [4 -1 0 0; -1 4 -1 0; 0 -1 4 -1; 0 0 -1 4]
tamanhoB = size(B, 2);
beta = ones(1, tamanhoB);

for i = 1:tamanhoB
    somatorio = 0;
    for j = 1:tamanhoB
        if j ~= i
            somatorio = somatorio + beta(j)*abs(B(i,j));
        end
    end
    beta(i) = somatorio / abs(B(i,i));
end

betaMax = max(beta)

if (betaMax < 1)
    disp('Converge!');
else
    disp('Não converge');
end

