clf
clear all
pkg load signal

n = 1e6;
x = randn(1, n);

ft = abs(fft(x));
ft = [ft(1) (ft(2:n/2).*2)];
ft = mag2db(ft);

[nn, xx] = hist(x, 20);



figure(1)

subplot(1, 3, 1);
plot(x(1:500))
xlabel('sample number');

subplot(1, 3, 2);
plot(linspace(0, 1, n/2), ft)
xlabel('normalized frequency');

subplot(1, 3, 3);
bar(xx, nn)
xlabel('amplitude value');
