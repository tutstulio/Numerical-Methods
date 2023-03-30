close all; clear; clc; format short;
syms x y f(x,y)

RK = input('Método Runge-Kutta: (1)Euler (2)EulerFoda (3)Ordem3 (4)Ordem4Pirocuda: ');
h = input('Passo: ');
xn = input('X desconhecido: ');
xo = input('Valor de X inicial: ');
yo = input('Valor de Y inicial: ');
f(x,y) = input('Equacao: ');

X = xo : h : xn;
Y(1) = yo;

switch(RK)
    case 1
        for i = 1:length(X)-1
            k1 = h * double(f(X(i), Y(i)));
            Y(i+1) = Y(i) + k1;
        end
    case 2
        for i = 1:length(X)-1
            k1 = h * double(f(X(i), Y(i)));
            k2 = h * double(f(X(i+1), Y(i)+k1));
            Y(i+1) = Y(i) + (k1+k2)/2;
        end
    case 3
        for i = 1:length(X)-1
            k1 = h * double(f(X(i), Y(i)));
            k2 = h * double(f(X(i) + h/2, Y(i) + k1/2));
            k3 = h * double(f(X(i) + 3*h/4, Y(i) + 3*k2/4));
            Y(i+1) = Y(i) + (2*k1 + 3*k2 + 4*k3)/9;
        end
    case 4
        for i = 1:length(X)-1
            k1 = h * double(f(X(i), Y(i)));
            k2 = h * double(f(X(i) + h/2, Y(i) + k1/2));
            k3 = h * double(f(X(i) + h/2, Y(i) + k2/2));
            k4 = h * double(f(X(i) + h, Y(i) + k3));
            Y(i+1) = Y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
        end
end

disp('Valores de X: ');
disp(X');
disp('Valores de Y: ');
disp(Y');

plot(X, Y, 'm-'); grid on;
line([-xo xn], [0 0], 'color', 'k');
