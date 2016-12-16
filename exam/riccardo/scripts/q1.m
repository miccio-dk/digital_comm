clf
clear all
pkg load signal

x = linspace(-4, 4, 1000);
val = -1.5;
[~,val_pos] = min(abs(x - val));

pdf = normpdf(x);
q = qfunc(x);


figure(1)
hold on;

area(x(val_pos:end), pdf(val_pos:end), 'LineStyle', ':')
plot(val, normpdf(val), 'ro')
plot(val, qfunc(val), 'ro')
plot([val val], [0 1], '-.r')
plot(x, pdf)
plot(x, q, '-k');

title('Q function and standard normal distribution');
xlabel('x');
ylabel('{\phi(x); Q(x)}');



