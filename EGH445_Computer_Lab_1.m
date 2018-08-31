%% EGH 445: Modern Control: Computer Lab 1
% Introduction to MATLAB
% 3.2 Matrices
clc; clear all; close all;
A=[0,2,-8;3,5,4;-1.5,-1,1];
B=[4,4,0;1,4,0;-1,-2,2];
v=A(:,randi([1,3]));
w=B(:,randi([1,3]));
a=randi([1,1e1]);
b=randi([1,1e1]);

% Compute av+ bw
compute1=a*v+b*w;
% Verify that a*b*(v+w)== a*b*(v+w)== abv+abw
verify1=eq(a*b*(v+w),a*b*v+a*b*w);
% Compute the dot product between v and w
dotty= dot(v,w);
% Compute norm(v) and norm(w)
norm(v)
norm(w)
% Verify that norm(a*v) == abs(a)*norm(v) and norm(v+w) <= norm(v)+norm(w)
eq(norm(a*v),abs(a)*norm(v))
le(norm(v+w),norm(v)+norm(w))
% use the dot product as inner product to compute the angle between the
% vectors v ans
theta=acosd(dotty/(norm(v)*norm(w)));

% Compute C=b*A+a*B and then v'*C*w
compute2=b*A+a*B;
compute3=v'*C*w;

% Compute inv(A)*B and A*inv(B) using the commands and \ and /
A\B
A/B
% Verify inv(A*B) == inv(A)*inv(B)
eq(inv(A*B),inv(A)*inv(B))

% Compute the determinant, rank , trace, eigenvalues, eigenvectors of B
determinant= det(B);
rank_B=rank(B);
trace_B=trace(B);
[eigenvectors_B,eigenvalues_B]=eig(B);

% Verify the properties of eigenvalues for the matrix B : trace(B) =
% sum(eigenvalues), det(B)= prodcut of eigenvalues
eq(trace(B),sum(nonzeros(eigenvalues_B)))
eq(det(B),prod(nonzeros(eigenvalues_B)))

% Use command length and size to check the dimension of the vector v and
% the matrix C
len(v)
size(C)

% Determine if the matrices A and B are similar to a diagonal matrix.
% Investigate the relation of V and ?? with the eigenvectors and
% eigenvalues
eigenvectors_B'*B*eigenvectors_B
[eigenvectors_A,eigenvalues_A]=eig(A);
eigenvectors_A'*A*eigenvectors_A
% Use the instruciton A.^2 to compute the square of each entry of A
squared_A= A.^2;
% Use the command cross to compute the cross product of vectors v and w
cross_vw=cross(v,w);

% 4: Polynomials
p=[3,6,-45];
roots(p)

% 5: Graphical Representation of Results

x=[-10:1:10];
y=x.^2;
plot(x,y)

% Exercise
x=[0:0.01:6*pi];
y=sin(x);
z=cos(x);
figure(2)
plot(x,y)
hold on
plot(x,z)
hold off
xlabel("degrees")
ylabel("value")
title("Matlab Plotting Exercise")
legend("sin(x)","cos(x)")

figure(3)
subplot(2,1,1)
plot(x,y)
subplot(2,1,2)
plot(x,z)