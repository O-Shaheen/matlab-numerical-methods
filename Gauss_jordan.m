function [Coeff]=Gauss_jordan(A)
s=size(A);
a=min(s);
for i=1:a
   %partial pivoting
   [t,r]=max(abs(A(i:end,i))); 
   t=A(r+i-1,:);
   A(r+i-1,:)=A(i,:);
   A(i,:)=t;
   %Elimination 
   A(i,[1:i-1 i+1:end])= A(i,[1:i-1 i+1:end])/A(i,i);
   A(i,i)=1;
   ss=A(i,[i+1:end]);
   for jj=[1:i-1 i+1:a]
      A(jj,[i+1:end])= A(jj,[i+1:end])-A(jj,i).*ss;
   end 
   A([1:i-1 i+1:end],i)=0; 
end
Coeff=A(:,max(s));
end