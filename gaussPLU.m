function x = gaussPLU(A, b)

    n = size(A, 2);
    x = zeros(n, 1);
    P = eye(n);
    L = P;
    U = A;
    
    for k = 1:(n-1)
        
        [pivo, id] = max(abs(U(k:n,k)));
        id = id + k-1;
        if pivo ~= abs(U(k,k))
            aux = U(k,:);
            U(k,:) = U(id,:);
            U(id,:) = aux;
            aux = P(k,:);
            P(k,:) = P(id,:);
            P(id,:) = aux;
            b = P * b;
        end
        
        for i = (k+1):n
            L(i,k) = U(i,k) / U(k,k);
            U(i,:) = U(i,:) - (U(k,:) .* L(i,k));
            b(i) = b(i) - L(i,k) * b(k);
            fprintf('--- Linha %d_%d ---\n', i, k);
            disp(['mult' poly2sym(L(i,k))]);
            for j = 1:n
                disp(poly2sym(U(i,j)));
            end
        end
    end
    
    for i = n:-1:1
        S = 0;
        for j = (i+1):n
            S = S + U(i,j) * x(j);
        end
        x(i) = (b(i)-S) / U(i,i);
    end
    
    disp('--- Matriz P ---');
    disp(P);
    disp('--- Matriz L ---');
    disp(L);
    disp('--- Matriz U ---');
    disp(U);
end