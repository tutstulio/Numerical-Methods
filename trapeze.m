% Método de Integração por Trapézios
% Inserir função, limites de integração e número de divisões
function It = trapeze(f, a, b, n)

    X = linspace(a, b, n+1);
    Y = f(X);
    
    It = 0;
    for i = 1:n+1
        if i~=1 && i~=n+1
            It = It + 2*Y(i);
        else
            It = It + Y(i);
        end
    end
    
    disp(X);
    disp(Y);
    It = It*(b - a)/(2*n);
    %disp(It);
    It = double(It);
end