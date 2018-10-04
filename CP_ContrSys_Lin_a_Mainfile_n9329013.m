%% EGH 445 Main File for Linearised Inverted Pendulum on Cart
clc; clear all;close all;
% Initialise the Params
m=0.15; Mc=0.4; l=0.2;g=9.81;

% Build the vectors

% At equilibrium point A 
A=[0,0,1,0;0,0,0,1;0,((-m*g)/(Mc)),0,0;0,((g*(Mc+m))/(l*Mc)),0,0];
B=[0,0,(1/Mc),-((1)/(l*Mc))]';

% Calculate the controlability of the system
ctrb_ans=ctrb(A,B);
rank_ctrb_ans=rank(ctrb_ans);
bool_rank=rank_ctrb_ans==4;

% Compute the controller, u -Ka*x_tilde_a
p=[-3;-4;-5;-6];
[Ka,prec_a]=place(A,B,p);
C=eye(4);
CObs=[1,0,0,0;0,1,0,0];
D=zeros(4,1);
observer_error_dynamics=[-63;-64;-65;-66];
La=place(A',CObs',observer_error_dynamics)';
initial_cond=[0.2,20*pi/180, 0,0]';
K_SF=Ka;
L_NL=La;
A_NL=A;
B_NL=B;
C_NL=CObs;
x1_bar=0;
x2_bar=0;
x3_bar=0;
x4_bar=0;

% Simulate
sim('CP_ContrSys_Lin_a_n9329013')
sim('CP_ContrSys_NLin_n9329013')



% Plot the States
figure();
subplot(5,1,1)
plot(touta_tilde,x1a_tilde,t,x1,'r--',t,x1aNhat,'g-',t,x1ahat,'k--')
title('Design Using Linearisation About EPa')
xlabel('Time/s')
ylabel('Cart Position / m')
legend('x_1 Linear','x_1 Non-linear','x_1 hat Non-linear','x_1 hat Linear')
subplot(5,1,2)
plot(touta_tilde,x2a_tilde/(pi/180),t,x2/(pi/180),'r--',t,x2aNhat/(pi/180),'g-',t,x2ahat/(pi/180),'k--')
legend('Linearised Model','Non-Linear Model')
xlabel('Time/s')
ylabel('Pendulum Angle / deg')
legend('x_2 Linear','x_2 Non-linear','x_2 hat Non-Linear','x_2 hat Linear')
subplot(5,1,3)
plot(touta_tilde,x3a_tilde,t,x3,'r--',t,x3aNhat,'g-',t,x3ahat,'k--')
xlabel('Time/s')
ylabel('Cart Velocity/ ms-1')
legend('x_3 Linear','x_3 Non-linear','x_3 hat Non-Linear','x_3 hat Linear')
subplot(5,1,4)
plot(touta_tilde,x4a_tilde/(pi/180),t,x4/(pi/180),'r--',t,x4aNhat/(pi/180),'g-',t,x4ahat/(pi/180),'k--')
ylim([-600,200])
xlabel('Time/s')
ylabel('Pendulum rate/ degs-1')
legend('x_4 Linear','x_4 Non-linear','x_4 hat Non-Linear','x_4 hat Linear')
% Plot the Input
subplot(5,1,5)
plot(touta_tilde,Fa,t,F,'r-')
xlabel('Time/s')
ylabel('Control Force / N')
legend('Force Linearised','F Non-Linearised')
% Animation
% Cart_Pendulum_Animation(touta_tilde,x1a_tilde,x2a_tilde,0,0);