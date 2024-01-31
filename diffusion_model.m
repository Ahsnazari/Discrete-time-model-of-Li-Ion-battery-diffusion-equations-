clear
clc
close all

D = 0.01;
numx = 100;   %number of grid points in x
numt = 100;  %number of time steps to be iterated over 
dx = 1;
dt = 1;
t = 1:dt:numt;
x = 1:dx:numx;

mu = 1;      
sigma = 0.05;
c= ones(numx,numt);
c0=100;
c1=30;
x0=numx;
t(1) = 0;      %t=0
c(1,1) = 1;    %C=0 at x=0

c(numx,1) = 0; 

for i=1:numx
%    c(i,1) = exp(-(x(i)-mu)^2/(2*sigma^2)) / sqrt(2*pi*sigma^2);
   c(i,1)=-(c0-c1)/x0*(i-x0*c0/(c0-c1));
end

for j=2:numt-1
   for i=3:numx
          c(i,j) =1/(dt-D/dx^2)*(c(i,j-1)/dt - D*2*c(i-1,j)/dx^2 + D*c(i-2,j)/dx^2); 
       
   end
end

figure(1);
% hold on;
% for ff=1:numt
%      plot(x(2:(numx-1)),c((2:numx-1)));
% end
% xlabel('x');
% ylabel('c(x,t)');
hold on;
plot(x,c(:,1));
plot(x,c(:,50));
plot(x,c(:,numt-1));
xlabel('x');
ylabel('c(x,t)');



figure(2);
% hold on;
% for ff=1:numt
%      plot(x(2:(numx-1)),c((2:numx-1)));
% end
% xlabel('x');
% ylabel('c(x,t)');
hold on;
plot(t(1:numt-1),c(3,1:numt-1));
plot(t(1:numt-1),c(numx-3,1:numt-1));
plot(t(1:numt-1),c(50,1:numt-1));
xlabel('t');
ylabel('c(x,t)');