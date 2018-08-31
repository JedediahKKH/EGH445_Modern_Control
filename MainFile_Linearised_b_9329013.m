%% EGH 445 Main File for Linearised Inverted Pendulum on Cart
% Initialise the Params
m=0.15; Mc=0.4; l=0.2;g=9.81;

% Build the vectors

% At equilibrium point B
A=[0,0,1,0;0,0,0,1;0,((-m*g)/(Mc)),0,0;0,-((g*(Mc+m))/(l*Mc)),0,0];
B=[0,0,(1/Mc),((1)/(l*Mc))]';

C=eye(4);
D=zeros(4,1);
% Simulate
sim('Cart_Pendulum_Linearised_b_9329013')
% Plot the Input
figure()
plot(toutb_tilde,F)
title('Plot of F with time')
xlabel('Time/s')
ylabel('Input Force / N')
% Plot the States
figure();
subplot(2,2,1)
plot(tout,x1b_tilde)
title('Plot of x1_btilde with time')
xlabel('Time/s')
ylabel('Estimated Position / m')
subplot(2,2,2)
plot(tout,x2b_tilde)
title('Plot of x2_btilde with time')
xlabel('Time/s')
ylabel('Estimated Velocity / ms-1')
subplot(2,2,3)
plot(tout,x3b_tilde)
title('Plot of x3_btilde with time')
xlabel('Time/s')
ylabel('Estimated Angle/ rad')
subplot(2,2,4)
plot(tout,x4b_tilde)
title('Plot of x4_btilde with time')
xlabel('Time/s')
ylabel('Estimated Angular Velocity/ rads-1')

Cart_Pendulum_Animation(touta_tilde,x1b_tilde,x2b_tilde,0,0);