close all; clear; clc; format short;

syms x f(x) P(x);

f(x) = input('Entre com a função: ');
x0 = input('Entre com o ponto de contorno: ');
k = input('Entre com o grau do polinomio: ');

soma = 0;
for n = 0:k
    df = diff(f, n);
    %disp(df);
    soma = soma + (df(x0)*(x-x0)^n)/factorial(n);
    %disp(soma);
end

P(x) = soma;
disp(P);

x = linspace(0, 2*pi);
y = eval(f);
p = eval(P);

plot(x, y, 'b-'); hold on; grid on;
plot(x, p, 'r-');