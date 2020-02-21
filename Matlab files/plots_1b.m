%---CASE 1 FILES---%
filename = 'plot_data_nl-e-ox.txt';
delimiterIn = ' ';
headerlinesIn = 0;
fxdataeuler=importdata(filename,delimiterIn,headerlinesIn);

filename = 'plot_data_nl-i-ox.txt';
delimiterIn = ' ';
headerlinesIn = 0;
fxdataieuler=importdata(filename,delimiterIn,headerlinesIn);

%---CASE 2 FILES---%
filename = 'plot_data_nl-e-oy.txt';
delimiterIn = ' ';
headerlinesIn = 0;
fydataeuler=importdata(filename,delimiterIn,headerlinesIn);

filename = 'plot_data_nl-i-oy.txt';
delimiterIn = ' ';
headerlinesIn = 0;
fydataieuler=importdata(filename,delimiterIn,headerlinesIn);

%---CASE 3 FILES---%
filename = 'plot_data_nl-e-oz.txt';
delimiterIn = ' ';
headerlinesIn = 0;
nzdataeuler=importdata(filename,delimiterIn,headerlinesIn);

filename = 'plot_data_nl-i-oz.txt';
delimiterIn = ' ';
headerlinesIn = 0;
nzdataieuler=importdata(filename,delimiterIn,headerlinesIn);

% data(:,1) is time
% data(:,2) is x
% data(:,3) is dx/dt
% data(:,4) is y
% data(:,5) is dy/dt
% data(:,6) is ø
% data(:,7) is dø/dt

%---CASE 1 PLOTS---%
figure(1);

subplot(2,2,1);
plot(fxdataeuler(:,1),fxdataeuler(:,2),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for $$[f_x, f_y, n_z] = [3496, 0, 0]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$x(t)$$', 'Interpreter', 'Latex');

subplot(2,2,2);
plot(fxdataeuler(:,1),fxdataeuler(:,3),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for $$[f_x, f_y, n_z] = [3496, 0, 0]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{x}(t)$$', 'Interpreter', 'Latex');

subplot(2,2,3);
plot(fxdataieuler(:,1),fxdataieuler(:,2),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for $$[f_x, f_y, n_z] = [3496, 0, 0]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$x(t)$$', 'Interpreter', 'Latex');
hold on;
plot(fxdataeuler(:,1),fxdataeuler(:,2),'Color',[33/255 79/255 255/255],'LineWidth',2);

subplot(2,2,4);
plot(fxdataieuler(:,1),fxdataieuler(:,3),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for $$[f_x, f_y, n_z] = [3496, 0, 0]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{x}(t)$$', 'Interpreter', 'Latex');
hold on;
plot(fxdataeuler(:,1),fxdataeuler(:,3),'Color',[33/255 79/255 255/255],'LineWidth',2);

%---CASE 2 PLOTS---%
figure(2);

subplot(2,2,1);
plot(fydataeuler(:,1),fydataeuler(:,4),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for $$[f_x, f_y, n_z] = [0, -3496, 0]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$y(t)$$', 'Interpreter', 'Latex');

subplot(2,2,2);
plot(fydataeuler(:,1),fydataeuler(:,5),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for $$[f_x, f_y, n_z] = [0, -3496, 0]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{y}(t)$$', 'Interpreter', 'Latex');

subplot(2,2,3);
plot(fydataieuler(:,1),fydataieuler(:,4),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for $$[f_x, f_y, n_z] = [0, -3496, 0]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$y(t)$$', 'Interpreter', 'Latex');
hold on;
plot(fydataeuler(:,1),fydataeuler(:,4),'Color',[33/255 79/255 255/255],'LineWidth',2);

subplot(2,2,4);
plot(fydataieuler(:,1),fydataieuler(:,5),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for $$[f_x, f_y, n_z] = [0, -3496, 0]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{y}(t)$$', 'Interpreter', 'Latex');
hold on;
plot(fydataeuler(:,1),fydataeuler(:,5),'Color',[33/255 79/255 255/255],'LineWidth',2);

%---CASE 3 PLOTS---%
figure(3);

subplot(2,2,1);
plot(nzdataeuler(:,1),nzdataeuler(:,6),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for $$[f_x, f_y, n_z] = [0, 0, -3496]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\psi(t)$$', 'Interpreter', 'Latex');

subplot(2,2,2);
plot(nzdataeuler(:,1),nzdataeuler(:,7),'Color',[33/255 79/255 255/255],'LineWidth',2);
grid;
title('Euler method for $$[f_x, f_y, n_z] = [0, 0, -3496]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{\psi}(t)$$', 'Interpreter', 'Latex');

subplot(2,2,3);
plot(nzdataieuler(:,1),nzdataieuler(:,6),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for $$[f_x, f_y, n_z] = [0, 0, -3496]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\psi(t)$$', 'Interpreter', 'Latex');
hold on;
plot(nzdataeuler(:,1),nzdataeuler(:,6),'Color',[33/255 79/255 255/255],'LineWidth',2);

subplot(2,2,4);
plot(nzdataieuler(:,1),nzdataieuler(:,7),'Color',[255/255 79/255 33/255],'LineWidth',2);
grid;
title('Improved Euler(Red) vs. Euler(Blue) method for $$[f_x, f_y, n_z] = [0, 0, -3496]$$', 'Interpreter', 'Latex');
xlabel('$$t$$', 'Interpreter', 'Latex');
ylabel('$$\dot{\psi}(t)$$', 'Interpreter', 'Latex');
hold on;
plot(nzdataeuler(:,1),nzdataeuler(:,7),'Color',[33/255 79/255 255/255],'LineWidth',2);
