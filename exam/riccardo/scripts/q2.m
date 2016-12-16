clf
clear all
pkg load signal

x = linspace(0, 1, 1000);
val = 0.1;
[~,val_pos] = min(abs(x - val));

qinv = qfuncinv(x);


figure(1)
hold on;

%area(x(val_pos:end), pdf(val_pos:end), 'LineStyle', ':')
%plot(val, normpdf(val), 'ro')
plot(val, qfuncinv(val), 'ro')
plot([0 val val], [qfuncinv(val) qfuncinv(val) -4], '-.r')
plot(x, qinv, '-k');

title('Inverse Q function');
xlabel('x');
ylabel('{Q^{-1}(x)}');