function b=b_const(X,Y,R,Q,beta_true)
k=((Q+X'*R*X)^(-1))*X'*R;
b=beta_true+k*(Y-X*beta_true);
end