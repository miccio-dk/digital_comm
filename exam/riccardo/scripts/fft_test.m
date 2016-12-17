clf
clear all
pkg load signal

n = 5e3;
x = randn(1, n);

ft = abs(fft(x));
ft = ft(1:n/2) .* 2;
ft = mag2db(ft);


subplot(1, 3, 1);
plot(x)
xlabel('sample n.');

subplot(1, 3, 2);
plot(ft)
xlabel('normalized frequency');


