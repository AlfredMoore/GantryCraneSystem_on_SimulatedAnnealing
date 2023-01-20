%Draw
clc

load_system('longmendiao_3');
inner=sim('longmendiao_3');                             %input from simulink
x1=inner.data_x.time;
y1=inner.data_x.signals.values;
x2=inner.data_theta.time;
y2=inner.data_theta.signals.values*180/pi;
figure(1)
subplot(2,1,1)
plot(x1,y1)
title('1¡¢x')
xlabel('t/s')
ylabel('x/m')
subplot(2,1,2)
plot(x2,y2)
title('2¡¢angle')
xlabel('t/s')
ylabel('angle/¡ã')