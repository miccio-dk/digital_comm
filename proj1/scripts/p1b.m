clear;
hold off;
clf;

title({'';''})
figure(1)

fs = 44100;
f = 1000;
ph = [0 pi/2 pi];
pwr = [.001 .01 .1 1];

% create a time vector
n = 0:100-1;

% generate and normalize 3 sine signals
sig = zeros(length(n), 3);
for i = 1:3
  sig(:,i) = sin(2*pi*f*n/fs + ph(i));
  sig_norm(:,i) = sig(:,i) / std(sig(:,i)) * sqrt(1e-3);
end

% plot signals with legend
subplot(5,1,1)
plot(n, sig_norm)
legend({'{\sin(\hat{\omega}n)}', '{\sin(\hat{\omega}n + frac{\pi}{2})}', '{\sin(\hat{\omega}n + \pi)}'})

for i = 1:length(pwr)
  % generate noise signal
  noise = randn(1, length(n))';
  % normalize signal
  noise_norm = noise / std(noise) * sqrt(pwr(i));
  
  % sum sines and noise
  sig_noise = sig_norm + noise_norm;
  % calculate SNR
  snr(i,:) = var(sig_noise)/var(noise_norm);
  
  % plot noisy signals
  subplot(5,1,i+1)
  plot(n, sig_noise)  
end

% print SNRs
snr
