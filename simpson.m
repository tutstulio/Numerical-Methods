% Método de Integração por Simpson
% Inserir função, limites de integração e número de divisões
function Is = simpson(f, a, b, n)

    X = linspace(a, b, n+1);
    Y = f(X);
    
    Is = 0;
    for i = 1:n+1
        if i==1 || i==n+1
            Is = Is + Y(i);
        elseif rem(i,2)==0
            Is = Is + 4*Y(i);
        else
            Is = Is + 2*Y(i);
        end 
    end
    
    %disp(X);
    %disp(Y);
    Is = Is*(b - a)/(3*n);
    %disp(Is);
    Is = double(Is);
end