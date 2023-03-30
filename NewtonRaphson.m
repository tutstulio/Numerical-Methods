close all; clear; clc; format short;
syms x f(x)

E = input('Tolerancia: ');
xo = input('Ponto estimado: ');
f(x) = input('Equacao: ');

i = 1;
X(i) = xo;
Y(i) = double(f(X(i)));
Df(x) = diff(f);
DY(i) = double(Df(X(i)));
X(i+1) = X(i) - (Y(i)/DY(i));
Y(i+1) = double(f(X(i+1)));

while abs(Y(i+1)) > E
    
    i = i + 1;
    DY(i) = double(Df(X(i)));
    X(i+1) = X(i) - (Y(i)/DY(i));
    Y(i+1) = double(f(X(i+1)));

end

disp('Valores de X: ');
disp(X');
disp('Valores de Y: ');
disp(Y');
disp('Valores de DY: ');
disp(DY');

x = linspace(0, 5);
y = eval(f);

plot(x, y, 'b-'); grid; hold;
line([-3 5], [0 0], 'color', 'k', 'LineWidth', 1);
line([0 0], [-20 9], 'color', 'k', 'LineWidth', 1);


