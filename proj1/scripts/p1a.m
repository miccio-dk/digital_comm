title({'';''})
figure(1)

% first plot: mean = 0, stddev = 1
subplot(2,1,1)
% generate random sequence of normally-distributed numbers
a = randn(1e6, 1);
% generate and plot histogram of it
[nn, xx] = hist(a, 100);
plot(xx, nn)
% generate and plot probability density function
x = linspace(-10, 10, 100);
px = 1/sqrt(2*pi)*exp(-1/2*x.^2);
hold on; 
plot(x, px)

% second plot: mean = 20, stddev = 5
subplot(2,1,2)
sigma = 5;
avg = 20;
% generate random sequence of normally-distributed numbers
a = randn(1e6, 1) * sigma + avg;
% generate and plot histogram of it
[nn, xx] = hist(a, 100);
plot(xx, nn)
% generate and plot probability density function
x = linspace(-10, 10, 100);
px = 1/(sqrt(2*pi)*sigma)*exp(-1/2*((x-avg)/sigma).^2);
hold on; 
plot(x, px)



figure(2)
% sinewaves with phase differences
subplot(2,2,3)
fs = 44100;
f = 1000;
ph = [0 pi/2 pi];
% create a time vector of 100 samples
n = 0:100-1;
% generate a vector for storing 3 signals
sig = zeros(3, length(t));
sig(1,:) = sin(2*pi*f*n/fs + ph(1));
sig(2,:) = sin(2*pi*f*n/fs + ph(2));
sig(3,:) = sin(2*pi*f*n/fs + ph(3));
plot(n, sig)

