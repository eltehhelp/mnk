%% ������ ���������
n=20
beta_true=[5.48; -0.019];
k = length(beta_true);

%% ������� ��� ���������� �������
b1 = -2000:100:2000;
b2 = -500:50:500;
len1=length(b1);
len2=length(b2);
%% ����� ������������ ������� Q
q=10;
Q=zeros(k);
for i=1:k
    Q(i,i)=q;
end
%% ����� ������������ ������� R
R=zeros(10);
for i=1:n
    R(i,i)=1;
end
%% ������� ������ ��� ����������

x=1:n
[Y, X] = data_init(beta_true, x);
%% ������ ������� ������� ���
for i = 1: len1
    for j = 1:len2
         mnk_out(i,j)=func1(X,Y,[b1(i); b2(j)],zeros(k,1),ones(n),zeros(k));
         b00_M(i,j)=b1(i);
         b11_M(i,j)=b2(j);
    end    
end
Y_opt_MNK=func1(X,Y,b_const(X,Y,eye(n),zeros(k),[0; 0]),zeros(k,1),ones(n),zeros(k));
figure
% ������ 1
plot3(b00_M,b11_M,mnk_out)
xlabel('beta_1'); ylabel('beta_2'); zlabel('Q(beta)');
title('��� ');
grid on;
hold on

%% ������ ������� ������� ����
for i = 1: len1
    for j = 1:len2
         omnk_out(i,j)=func1(X,Y,[b1(i); b2(j)],zeros(k,1),R,zeros(k));
         b00_O(i,j)=b1(i);
         b11_O(i,j)=b2(j);
    end    
end
Y_opt_OMNK=func1(X,Y,b_const(X,Y,R,zeros(k),[0; 0]),zeros(k,1),R,zeros(k));
figure
% ������ 2
plot3(b00_O,b11_O,omnk_out)
xlabel('beta_1'); ylabel('beta_2'); zlabel('Q(beta)');
title('����');
grid on;
hold on
%% ������ ������� ������� ����
for i = 1: len1
    for j = 1:len2
         mmnk_out(i,j)=func1(X,Y,[b1(i); b2(j)],beta_true,R,Q);
         b00(i,j)=b1(i);
         b11(i,j)=b2(j);
    end    
end
Y_opt_MMNK=func1(X,Y,b_const(X,Y,R,Q,beta_true),beta_true,R,Q)
figure
% ������ 3
plot3(b00,b11,mmnk_out)
xlabel('beta_1'); ylabel('beta_2'); zlabel('Q(beta)');
title('����');
grid on;
hold on
%% ���������� ��������
figure
% ������ 4
surf(b00,b11,mmnk_out)
xlabel('beta_1'); ylabel('beta_2'); zlabel('Q(beta)');
title('���������� �������� Q(beta) ','FontSize',14');
grid on;
hold on