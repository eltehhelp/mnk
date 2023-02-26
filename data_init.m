function [Y, X] = data_init(beta_true, x)
    n = length(x);
    k = length(beta_true);
    e = randn(n, 1) * sqrt(0.02);
    X = zeros(n, k);
    for j = 1:k
        X(:, j) = x.^(j-1);
    end
    Y = X*beta_true + e;
end