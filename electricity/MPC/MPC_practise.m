clear;
close all;
clc;

A=[1 0.1 ; 0 2];
n = size(A,1);

B=[0 ; 0.5];
P = size(B,2);


Q=[1 0 ; 0 1];
F=[1 0 ; 0 1];
R=0.1;

k_steps = 100;
X_K = zeros(n , k_steps);%×´Ì¬¾ØÕó
X_K(:,1)=[20 ; -20];%×´Ì¬µÄ³õÊ¼Öµ

U_K=zeros(P,k_steps);%ÊäÈë¾ØÕó

N=5;

[E,H]=MPC_Matrices(A,B,Q,R,F,N);



for k= 1:k_steps
    U_K(:,k)=Prediction(X_K(:,k),E,H,N,P);
    X_K(:,k+1)=(A*X_K(:,k)+B*U_K(:,k));
end

subplot(2,1,1);
hold;
for i=1:size(X_K,1)
    plot(X_K(i,:));
end

legend("x1","x2");
hold off;

subplot(2,1,2);
hold;
for i=1:size(U_K:1)
    plot(U_K(i,:));
end
legend("u1");
lgd=legend;










