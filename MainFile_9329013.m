%% Main File for Inverted Pendulum on Cart
% Parameter Values for Inverted Pendulum
m=0.15;
Mc=0.4;
l=0.2;
g=9.81;

sim('Cart_Pendulum_9329013');

figure();
subplot(2,2,1)
plot(tout,x1)
title('Plot of x1 with time')
xlabel('Time/s')
ylabel('Position / m')
subplot(2,2,2)
plot(tout,x2)
title('Plot of x2 with time')
xlabel('Time/s')
ylabel('Velocity / ms-1')
subplot(2,2,3)
plot(tout,x3)
title('Plot of x3 with time')
xlabel('Time/s')
ylabel('Angle/ rad')
subplot(2,2,4)
plot(tout,x4)
title('Plot of x4 with time')
xlabel('Time/s')
ylabel('Angular Velocity/ rads-1')
figure()
plot(tout,F)
title('Plot of F with time')
xlabel('Time/s')
ylabel('Input Force / N')

Cart_Pendulum_Animation(tout,x1,x2,0,0);