clf
clear all
pkg load signal

x = linspace(-4, 4, 1000);
val = -1.5;

erfc = erfc(x);
q = qfunc(x);


figure(1)
hold on;

plot(x, [erfc; q])

title('Q function and standard normal distribution');
%legend('Complementary error function', 'Q function')
xlabel('x');
ylabel('{erfc(x); Q(x)}');



