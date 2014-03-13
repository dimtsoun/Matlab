% Data Input
gap = [0.25,0.5,0.75,1,1.25,1.5,1.75,2,2.25];
volt = [1,2.99,4.80,6.99,8.80,10.90,12.70,14.99,17.14];
% Data plotting
plot(gap,volt,'+');
xlabel('Gap');
ylabel('Voltage');
% Finding a first degree polynomial to fit the data
p = polyfit(gap,volt,1);
graph_points = polyval(p,gap);
hold on;
% Graphing the extrapolated polynomial
plot(gap,graph_points);
slope = num2str(p(1));
% Calculating the senesitivity
str1 = 'Sensitivity=Line Slope= ';
str = strcat(str1, slope);
disp(str);
annotation('textbox',[0.5,.14,.4,.1], 'String', str);
% Calculating the voltage at gap = 0mm
voltage_zero = polyval(p,0);
disp(['The voltage at zero gap is: ', num2str(voltage_zero)]);