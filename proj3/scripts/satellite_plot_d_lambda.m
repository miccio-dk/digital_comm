% script setup
clear all
pkg load communications

%%% constants
% standard temperature
t_0 = 290;
% boltzmann constant
k = 1.38064852e-23;
% speed of light
c = 299792458;
% B * T_b
bt_b_db = 3;

%%% input parameters
% distance: logaritmically spaced values between 1km and 10km
d = logspace(3, 8, 50);
% frequency: logaritmically spaced values between 300MHz and 300GHz (RF range)
f = 3*logspace(8, 11, 50);
bw = 50e3;
p_t = 100;
g_t_db = 30;
a_r = 0;
g_r_db = 0;
l_0_db = 3;
t_r = 700;

% calculate free-space loss
fsl_db = mag2db(c ./ (4 * pi * f .* d'));

% calculate received signal power (A.70)
p_r_db = fsl_db + pow2db(p_t) + g_t_db + g_r_db - l_0_db;

% calculate noise level power 
p_int_db = pow2db(k * t_r * bw);  % (A.72)

% calculate SNR at receiver output
snr_0_db = p_r_db - p_int_db;


% calculate energy-per-bit-to-noise spectral density ratio
eb_n0_db = snr_0_db + bt_b_db;

% calculate bit error probability
p_e = qfunc(sqrt(2 * db2pow(eb_n0_db)));

subplot(1, 2, 1);
surfc(d/1000, f, snr_0_db);
title('Signal-to-noise ratio (dB)');
xlabel('d (km)');
ylabel('f (Hz)');

subplot(1, 2, 2);
surfc(d/1000, f, p_e);
title('Bit error probability');
xlabel('d (km)');
ylabel('f (Hz)');


