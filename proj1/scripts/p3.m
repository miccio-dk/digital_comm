clear;
hold off;
clf;
pkg load signal

title({'Detection of pulses through cross-correlation'})
figure(1)

% simulation parameters
pulse_len = 100;
pulse_num = 10;
pulse_dc = 0.5;
snrs = [10 .1 .05 .01];

%generate pulse reference
pulse_ref = zeros(1, pulse_len);
pulse_ref(1:(end*pulse_dc)) = 1;

for i = 1:length(snrs)
  % generate pulse-train signal
  pulses = zeros(1, pulse_num * pulse_len);
  pulses_pos = round(rand(1, pulse_num));
  for j = 1:pulse_num
    pulses((j-1)*pulse_len+1 : j*pulse_len) = pulse_ref * pulses_pos(j);
  end
  pulses(pulses==0) = -1;
  % calculate signal power
  pulses_pwr = var(pulses);

  % generate noise signal
  noise = randn(1, pulse_num * pulse_len);
  % normalize signal
  noise = noise / std(noise) * sqrt(pulses_pwr / snrs(i));
  
  % sum pulse-train and noise
  sig_noise = pulses + noise;
  
  % generate autocorrelation of noisy signals
  [rxx, lag] = xcorr(sig_noise, pulse_ref);
  % detect pulses: 
  % find cross-correlation values for possible pulses
  rxx_pulses = rxx(find(mod(lag, pulse_len) == 0)(pulse_num:end));
  pulses_res = rxx_pulses > 0;
  
  % plot pulses position
  subplot(length(snrs),4,(i-1)*4+1)
  stem(pulses_pos)
  % plot encoded noisy signal
  subplot(length(snrs),4,(i-1)*4+2)
  plot(sig_noise)
  % plot cross-correlation
  subplot(length(snrs),4,(i-1)*4+3)
  plot(lag(pulse_num*pulse_len:end), rxx(pulse_num*pulse_len:end))
  % plot detected pulses
  subplot(length(snrs),4,i*4)
  stem(pulses_res)
end