%% EGH 445 Main File for Linearised Inverted Pendulum on Cart
clc; clear all;close all;
% Initialise the Params
m=0.15; Mc=0.4; l=0.2;g=9.81;

% Build the vectors

% At equilibrium point B
A=[0,0,1,0;0,0,0,1;0,((-m*g)/(Mc)),0,0;0,-((g*(Mc+m))/(l*Mc)),0,0];
B=[0,0,(1/Mc),((1)/(l*Mc))]';

% Calculate the controlability of the system
ctrb_ans=ctrb(A,B);
rank_ctrb_ans=rank(ctrb_ans);
bool_rank=rank_ctrb_ans==4;

% Compute the controller, u -Kb*x_tilde_b
p=[-3;-4;-5;-6];
[Kb,prec_b]=place(A,B,p);
C=eye(4);
% Compute the observer
CObs=[1,0,0,0;0,1,0,0];
D=zeros(4,1);
observer_error_dynamics=[-63;-64;-65;-66];
Lb=place(A',CObs',observer_error_dynamics)';
%initial_condNL=[0.2,20*pi/180, 0,0]';
%initial_condLin=[0.2,200*pi/180, 0,0]';
initial_cond=[0.2,200*pi/180, 0,0]';
K_SF=Kb;
L_NL=Lb;
A_NL=A;
B_NL=B;
C_NL=CObs;
% Reference Values
x1_bar=0;
x2_bar=pi;
x3_bar=0;
x4_bar=0;

% Simulate
sim('CP_ContrSys_Lin_b_n9329013')
sim('CP_ContrSys_NLin_b_n9329013')

% Plot the States
figure();
subplot(5,1,1)
grid on
plot(toutb_tilde,x1b_tilde,'r-',t,x1,'b-',t,x1bNhat,'g-',t,x1bhat,'k--')
title('Design Using Linearisation About EPb')
xlabel('Time/s')
ylabel('Estimated Position / m')
legend('x_1 Linearised','x_1 Non-linear','x_1 hat Non-linear','x_1 hat Linearised')
subplot(5,1,2)
plot(toutb_tilde,x2b_tilde/(pi/180)+180,'r-',t,x2/(pi/180),'b-',t,x2bNhat/(pi/180),'g-',t,x2bhat/(pi/180)+180,'k--')
xlabel('Time/s')
ylabel('Estimated Angular Displacement / deg')
legend('x_2 Linearised','x_2 Non-linear','x_2 hat Non-Linear','x_2 hat Linearised')
subplot(5,1,3)
plot(toutb_tilde,x3b_tilde,'r-',t,x3,'b-',t,x3bNhat,'g-',t,x3bhat,'k--')
xlabel('Time/s')
ylabel('Estimated Velocity/ ms-1')
legend('x_3 Linearised','x_3 Non-linear','x_3 hat Non-Linear','x_3 hat Linearised')
subplot(5,1,4)
plot(toutb_tilde,x4b_tilde/(pi/180),'r-',t,x4/(pi/180),'b-',t,x4bNhat/(pi/180),'g-',t,x4bhat/(pi/180),'k--')
ylim([-600,200])
xlabel('Time/s')
ylabel('Pendulum Rate/ degs-1')
legend('x_4 Linearised','x_4 Non-linear','x_4 hat Non-Linear','x_4 hat Linearised')
% Plot the Input
subplot(5,1,5)
plot(toutb_tilde,Fb,t,F,'r-')
xlabel('Time/s')
ylabel('Input Force / N')
legend('Force Linearised','F Non-Linearised')
% Animation
%Cart_Pendulum_Animation(toutb_tilde,x1b_tilde,x2b_tilde,0,pi);