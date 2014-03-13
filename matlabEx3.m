clear;
clc;
length = input('Please enter the length of the beam: ');
loadsnumber = input('Please enter the number of loads exerted on the beam: ');

for i=1:loadsnumber
%     string manipulation for the prompt
    str1 = 'Please enter the position of load number';
    str2 = num2str(i);
    ns = [str1,' ',str2,':  '];
    str3= 'Please enter the force(in Newtons) of the load';
    ns2= [str3,' ',str2,':  '];
    position(i) = input(ns);
    loads(i) = input(ns2);
end
%iterator different from the one of the loop
jj=1;
xvalues = [0];
for j=1:loadsnumber
    shearforce(j) = sum(loads(find(position>=position(j)))); 
    
    %we use those variables for the plotting of the shear force diagram
    yvalues(jj)=shearforce(j);
    yvalues(jj+1)=shearforce(j);
    xvalues(jj+1)= position(j);
    xvalues(jj+2)= position(j);
    jj = jj+2;
end

xvalues = [xvalues length];
yvalues = [yvalues 0 0];

figure;
plot(xvalues, yvalues, 'LineWidth',3);
title('Shearforce');
ylabel('N');
xlabel('Meters');

%the shear force at the end of the cantilever is always zero
shearforce(j+1)=0;
%bending moment calculation

array = linspace(0,length,length*100);

d = length*100;

for i=1:d
    %setting the bending moment to zero for all positions on the beam
    bending_moment(i)=0;
end

for i=1:d
    %locating the loads that are positioned after the cut on the beam
    loads_list = find(position> array(i));

    x = abs(array(i)-position(loads_list));
    y = loads(loads_list);
    bending_moment(i) = -sum(y.*x);
end

figure;
plot(array,bending_moment, 'LineWidth',3);
title('Bending Moment');
ylabel('Nm');
xlabel('Meters');
