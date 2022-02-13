function out = Simpson (x, y, index1, index)
    n = index - index1;
    if rem((n+1),2)~=1
        disp(n+1);
        disp('Enter valid n!!!');
    end
    h = x(index) -x(index1);
    h = h/(3*n);
    ynew = y(index1: index);
    sumE = 0;
    sumO = 0;
    for i = 2: n
        if rem(i,2)==1
           sumO=sumO+ynew(i);%sum of odd terms
         else
           sumE=sumE+ynew(i); %sum of even terms
        end
    end
    out = h * (ynew(1)+ y((n+1))+ 2* sumO + 4*sumE);
end