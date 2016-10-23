clear;
hold off;
clf;
pkg load signal

title({'Autocorrelation of noisy sinusoidal signals'})
figure(1)

% simulation parameters
fs = 44100;
f = 1000;
ph = [0 pi/2 pi];
pwr = [0 .001 .01 .1 1];

% create a time vector
n = 0:100-1;

% generate and normalize 3 sine signals
sig = zeros(length(n), 3);
for i = 1:3
  sig(:,i) = sin(2*pi*f*n/fs + ph(i));
  sig_norm(:,i) = sig(:,i) / std(sig(:,i)) * sqrt(1e-3);
end

for i = 1:length(pwr)
  % generate noise signal
  noise = randn(1, length(n))';
  % normalize signal
  noise_norm = noise / std(noise) * sqrt(pwr(i));
  
  % sum sines and noise
  sig_noise = sig_norm + noise_norm;
  
  % generate autocorrelation of noisy signals
  for j = 1:3
    [acor_tmp, lag_tmp] = xcorr(sig_noise(:,j));
    acor(:,j) = acor_tmp;
    lag(:,j) = lag_tmp;
  end
  
  % plot autocorrelation
  subplot(5,1,i)
  plot(lag, acor)
end