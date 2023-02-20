function p
xv = linspace(-5,5,500);
yv = linspace(-5,5,500);
[x,y] = meshgrid(xv,yv);
z = x+i*y;
t2 = 1+z+1/2.*z.^2; % 2-Order
t3 = 1+z+1/2.*z.^2+1/6.*z.^3; % 3-Order
t4 = 1+z+1/2.*z.^2+1/6.*z.^3+1/24.*z.^4; % 4-Order
ap = (1/2+3/4.*z)+sqrt(1/4-1/4.*z+9/16.*z.^2);
an = (1/2+3/4.*z)-sqrt(1/4-1/4.*z+9/16.*z.^2);

s = abs(an); % choose one of order
contour(x,y,s,[1,1],'Fill','on')
hold on

