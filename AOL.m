clc
clear
a = 1.2;
b = 0.6;
c = 0.8;
d = 0.3;
t0 = 0;
tf = input('Last Time (day) : ');
h = input('Step Size : ');
x0 = input('Input initial condition for prey : ');
y0 = input('Input initial condition for predator : ');
kh = input('Input the value of K high (carrying capacity) : ');
kr = input('Input the value of K realistic (carrying capacity) : ');
tspan = zeros (1, (tf / h));
for i = 1 : (tf / h)
    tspan(i) = t0 + i * h;
end
f1 = @(t,y) [a * (1 - (2 * y(1) / kh)) * y(1) - b * y(1) * y(2);
    -c * y(2) + d * y(1) * y(2)];
[t, xy1] = ode45(f1, tspan, [x0, y0]);
f2 = @(t,y) [a * (1 - (2 * y(1) / kr)) * y(1) - b * y(1) * y(2);
    -c * y(2)+ d * y(1) * y(2)];
[t, xy2] = ode45(f2, tspan, [x0, y0]);
subplot(1, 2, 1);
p1 = plot(t, xy1(:,1), t, xy1(:,2), '--');
xlabel('Time');
ylabel('Population');
legend ('Prey','Predator');
title('Population of Predator & Prey in Ecosystem (K high)');
subplot(1, 2, 2);
p3 = plot(t, xy2(:,1), t, xy2(:,2), '--');
xlabel('Time');
ylabel('Population');
legend ('Prey','Predator');
title('Population of Predator & Prey in Ecosystem (K real)');
