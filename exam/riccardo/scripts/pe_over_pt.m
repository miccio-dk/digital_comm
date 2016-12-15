% script setup
clear all
pkg load communications
addpath ("../../../proj3/scripts/")

%%% constants
% standard temperature
t_0 = 290;
% boltzmann constant
k = 1.38064852e-23;
% B * T_b
bt_b_db = 3;

%%% input parameters
d = 41e6;
lambda = 0.15;
bw = 50e3;
p_t = logspace(-1, 2, 100);
g_t_db = 30;
a_r = 0;
g_r_db = 0;
l_0_db = 3;
t_r = 700;

% mag2db: 20 * log(x)
% pow2db: 10 * log(x)

% calculate free-space loss
fsl_db = mag2db(lambda / (4 * pi * d));

% calculate received signal power (A.70)
p_r_db = fsl_db + pow2db(p_t) + g_t_db + g_r_db - l_0_db;

% calculate noise level power 
p_int_db = pow2db(k * t_r * bw);  % (A.72)
% p_int_db = pow2db(k * t_0) + pow2db(t_r / t_0) + pow2db(bw);  % (A.73)

% calculate SNR at receiver output
snr_0_db = p_r_db - p_int_db;


% calculate energy-per-bit-to-noise spectral density ratio
eb_n0_db = snr_0_db + bt_b_db;

% calculate bit error probability
p_e = qfunc(sqrt(2 * db2pow(eb_n0_db)));


loglog(p_t, p_e);
hold on
loglog([0.5 0.5], [1e-9 1e+0], '-.r')
loglog([5   5],   [1e-9 1e+0], '-.r')
loglog([50 50],   [1e-9 1e+0], '-.r')
loglog(0.5, p_e([~,idx] = min(abs(p_t - 0.5))), 'ro')
loglog(5,   p_e([~,idx] = min(abs(p_t - 5))),   'ro')
loglog(50,  p_e([~,idx] = min(abs(p_t - 50))),  'ro')
%axis([1e-1 1e+2 1e-9 1e+0])
title('Bit error probability');
xlabel({'P_T (W)'});
ylabel({'P_E'});
set(gca,'ygrid','on')
set(gca,'xgrid','off')


