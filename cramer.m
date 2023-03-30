function x = cramer(M, b)
    delta = det(M);
    for i = 1:numel(b)
        N = M;
        N(:,i) = b;
        x(i) = det(N)/delta;
    end
    disp(x');
end