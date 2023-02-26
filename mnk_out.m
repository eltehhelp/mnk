function J = mnk_out(X,Y,B,H,f,c)
J=0.5*B'*H*B+f'*B+c;
end