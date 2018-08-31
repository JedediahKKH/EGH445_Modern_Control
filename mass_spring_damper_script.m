m=1;
k=1;
b=1;
stept=1;
stepi=2;
stepf=0; % Input Force Value
z1_0=0.8;
z2_0=0.7;
sim('mass_spring_damper_model')
damperforce=b*velocity;
springforce=k*position;
figure()
subplot(3,2,1)
plot(tout,position)
title('Plot of Position vs Time in Mass-Spring-Damper System')
xlabel('Time [s]')
ylabel('Position [m]')
subplot(3,2,2)
plot(tout,velocity)
title('Plot of Velocity vs Time in Mass-Spring-Damper System')
xlabel('Time [s]')
ylabel('Velocity [m/s]')
subplot(3,2,3)
plot(tout,acceleration)
title('Plot of Acceleration vs Time in Mass-Spring-Damper System')
xlabel('Time [s]')
ylabel('Acceleration [m/s^2]')
subplot(3,2,4)
plot(tout,damperforce)
title('Plot of Damper Force vs Time in Mass-Spring-Damper System')
xlabel('Time [s]')
ylabel('Damper Force [N]')
subplot(3,2,5)
plot(tout,springforce)
title('Plot of Spring Force vs Time in Mass-Spring-Damper System')
xlabel('Time [s]')
ylabel('Spring Force [N]')