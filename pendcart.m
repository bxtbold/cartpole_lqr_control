function dx = pendcart(x,m,M,L,g,u)

sinx = sin(x(3));
cosx = cos(x(3));
D = m*L*L*(M+m*(1-cosx^2));

dx(1,1) = x(2);
dx(2,1) = (1/D)*(-m^2*L^2*g*cosx*sinx + m*L^2*(m*L*x(4)^2*sinx)) + m*L*L*(1/D)*u;
dx(3,1) = x(4);
dx(4,1) = (1/D)*((m+M)*m*g*L*sinx - m*L*cosx*(m*L*x(4)^2*sinx)) - m*L*cosx*(1/D)*u;