tau=0.5;
x0=0;
stept=1;
stepi=0;
stepf=10;
sim('mymodel')
plot(mytime,x)
title('First Order differential equation')
xlabel('Time [s]')
ylabel('Variable x')
