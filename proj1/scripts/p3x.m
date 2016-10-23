clear;
hold off;
clf;
pkg load signal

title({'Detection of pulses through cross-correlation'})
figure(1)

% simulation parameters
pulse_len = 50;
pulse_num = 25;
pulse_dc = 0.5;
snrs = logspace(-3, 1, 25);
tests_num = 1000;

%generate pulse reference
pulse_ref = zeros(1, pulse_len);
pulse_ref(1:(end*pulse_dc)) = 1;

tests_res = zeros(1, length(snrs));

for k = 1:tests_num
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
    
    % count correctly detected pulses
    tests_res(i) = tests_res(i) + sum(pulses_pos == pulses_res);
  end
end

tests_perc = tests_res / (tests_num * pulse_num)
semilogx(snrs, tests_perc)