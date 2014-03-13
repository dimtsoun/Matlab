a = input('Please enter the coefficient of x^2: ');

b = input('Please enter the coefficient of x: ');

c = input('Please enter the coefficient of x^0: ');

D = b^(2)-(4*a*c);

if D>0
    r1 = ((-b)+sqrt(D))/(2*a);
    r2 = ((-b)-sqrt(D))/(2*a);
    disp(['The roots of the equation are r1=' num2str(r1) ' and r2=' num2str(r2)])
elseif D == 0
        r3 = -b/(2*a);
        disp(['The root of the equation is r=' num2str(r3)])
else
    r4= ((-b)+sqrt(-D)*1i)/(2*a);
    r5 =((-b)-sqrt(-D)*1i)/(2*a);
    disp(['The roots of the equation are r1=' num2str(r4) ' and r2=' num2str(r5)])
end
 
    
        