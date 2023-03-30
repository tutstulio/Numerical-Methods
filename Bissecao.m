close all; clear; clc; format short;
syms x f(x)

E = input('Tolerancia: ');
I = input('Intervalo[a b]: ');
f(x) = input('Equacao f(x): ');

i = 1;
a = I(1);
b = I(2);
X(i) = (a + b)/2;
Y(i) = double(f(X(i)));

while abs(Y(i)) > E
    
    if Y(i) > 0
        a = X(i);
    else
        b = X(i);
    end
    
    i = i + 1;
    X(i) = (a + b)/2;
    Y(i) = double(f(X(i)));
    
end

disp('Valores de X: ');
disp(X');
disp('Valores de Y: ');
disp(Y');