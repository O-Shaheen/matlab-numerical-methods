function integration1=int_integration(coeff,x)
    length= max(size(x)-1); %number of equations/intervals needed
    for i=1:1:length
        t=linspace(x(i),x(i+1));
        %coef((i-1)*3+1 is the index of the coeffiecient needed for each
        %interval
        fx= sqrt( (2*coeff(i,1).*t + coeff(i,2)).^2 + 1 );
        %out is an array of the values of each interval integration 
        out1(i) = Simpson (t, fx, 1, 99);

        out2(i) = Trapezoidal (t, fx, 1, 100);
    end
    
    integration1= sum(out1);
    
%     disp("Integration with Simpson: ")
%     disp(integration1);
%     integration2= sum(out2);
%     disp("Integration with Trapz: ")
%     disp(integration2);
end