%---FILES---%
filename = 'plot_data_nl-e-cl.txt';
delimiterIn = ' ';
headerlinesIn = 0;
cldataeuler=importdata(filename,delimiterIn,headerlinesIn);

filename = 'plot_data_nl-i-cl.txt';
delimiterIn = ' ';
headerlinesIn = 0;
cldataieuler=importdata(filename,delimiterIn,headerlinesIn);

%---x(t) and dotx(t)---%
figure(1);

subplot(2,2,1);
plot(cldataeuler(:,1),cldataeuler(:,2),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$x(t)$$', 'Interpreter', 'Latex');

subplot(2,2,2);
plot(cldataeuler(:,1),cldataeuler(:,3),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{x}(t)$$', 'Interpreter', 'Latex');

subplot(2,2,3);
plot(cldataieuler(:,1),cldataieuler(:,2),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$x(t)$$', 'Interpreter', 'Latex');
hold on;
plot(cldataeuler(:,1),cldataeuler(:,2),'Color',[33/255 79/255 255/255],'LineWidth',2);

 subplot(2,2,4);
plot(cldataieuler(:,1),cldataieuler(:,3),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{x}(t)$$', 'Interpreter', 'Latex');
hold on;
plot(cldataeuler(:,1),cldataeuler(:,3),'Color',[33/255 79/255 255/255],'LineWidth',2);

%---y(t) and doty(t)---%
figure(2);

subplot(2,2,1);
plot(cldataeuler(:,1),cldataeuler(:,4),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$y(t)$$', 'Interpreter', 'Latex');

subplot(2,2,2);
plot(cldataeuler(:,1),cldataeuler(:,5),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{y}(t)$$', 'Interpreter', 'Latex');

subplot(2,2,3);
plot(cldataieuler(:,1),cldataieuler(:,4),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$y(t)$$', 'Interpreter', 'Latex');
hold on;
plot(cldataeuler(:,1),cldataeuler(:,4),'Color',[33/255 79/255 255/255],'LineWidth',2);

subplot(2,2,4);
plot(cldataieuler(:,1),cldataieuler(:,5),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{y}(t)$$', 'Interpreter', 'Latex');
hold on;
plot(cldataeuler(:,1),cldataeuler(:,5),'Color',[33/255 79/255 255/255],'LineWidth',2);

%---psi(t) and dotpsi(t)---%
figure(3);

subplot(2,2,1);
plot(cldataeuler(:,1),cldataeuler(:,6),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\psi(t)$$', 'Interpreter', 'Latex');

subplot(2,2,2);
plot(cldataeuler(:,1),cldataeuler(:,7),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{\psi}(t)$$', 'Interpreter', 'Latex');

subplot(2,2,3);
plot(cldataieuler(:,1),cldataieuler(:,6),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\psi(t)$$', 'Interpreter', 'Latex');
hold on;
plot(cldataeuler(:,1),cldataeuler(:,6),'Color',[33/255 79/255 255/255],'LineWidth',2);

subplot(2,2,4);
plot(cldataieuler(:,1),cldataieuler(:,7),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for the non-linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{\psi}(t)$$', 'Interpreter', 'Latex');
hold on;
plot(cldataeuler(:,1),cldataeuler(:,7),'Color',[33/255 79/255 255/255],'LineWidth',2);