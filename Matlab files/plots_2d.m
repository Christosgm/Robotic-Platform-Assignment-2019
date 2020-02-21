%---FILES---%
filename = 'plot_data_l-e-cl.txt';
delimiterIn = ' ';
headerlinesIn = 0;
ldataeuler=importdata(filename,delimiterIn,headerlinesIn);

filename = 'plot_data_l-i-cl.txt';
delimiterIn = ' ';
headerlinesIn = 0;
ldataieuler=importdata(filename,delimiterIn,headerlinesIn);

filename = 'plot_data_l-analytic-cl.txt';
delimiterIn = ' ';
headerlinesIn = 0;
ldataanalytic=importdata(filename,delimiterIn,headerlinesIn);

%---psi(t) and dotpsi(t) ---%
figure(1);

subplot(2,2,1);
plot(ldataeuler(:,1),ldataeuler(:,2),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for the linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\psi(t)$$', 'Interpreter', 'Latex');

subplot(2,2,2);
plot(ldataeuler(:,1),ldataeuler(:,3),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for the linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{\psi}(t)$$', 'Interpreter', 'Latex');

subplot(2,2,3);
plot(ldataieuler(:,1),ldataieuler(:,2),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for the linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\psi(t)$$', 'Interpreter', 'Latex');
hold on;
plot(ldataeuler(:,1),ldataeuler(:,2),'Color',[33/255 79/255 255/255],'LineWidth',2);

subplot(2,2,4);
plot(ldataieuler(:,1),ldataieuler(:,3),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for the linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{psi}(t)$$', 'Interpreter', 'Latex');
hold on;
plot(ldataeuler(:,1),ldataeuler(:,3),'Color',[33/255 79/255 255/255],'LineWidth',2);

%---VERSUS---%
figure(2);

subplot(1,2,1);
plot(ldataieuler(:,1),ldataieuler(:,2),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) vs. Analytical Solution(Green) for the linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\psi(t)$$', 'Interpreter', 'Latex');
hold on;
plot(ldataeuler(:,1),ldataeuler(:,2),'Color',[33/255 79/255 255/255],'LineWidth',2);
hold on;
plot(ldataanalytic(:,1),ldataanalytic(:,2),'Color',[33/255 255/255 79/255],'LineWidth',2);


subplot(1,2,2);
plot(ldataieuler(:,1),ldataieuler(:,3),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) vs. Analytical Solution(Green) for the linear closed-loop system', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{\psi}(t)$$', 'Interpreter', 'Latex');
hold on;
plot(ldataeuler(:,1),ldataeuler(:,3),'Color',[33/255 79/255 255/255],'LineWidth',2);
hold on;
plot(ldataanalytic(:,1),ldataanalytic(:,3),'Color',[33/255 255/255 79/255],'LineWidth',2);