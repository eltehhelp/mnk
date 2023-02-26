function J=func1(X,Y,B,beta_true,R,Q) 
J=(Y-X*B)'*R*(Y-X*B)+(B-beta_true)'*Q*(B-beta_true);
end