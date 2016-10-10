clear;
hold off;
clf;
pkg load signal

title({'';''})
figure(1)

fs = 44100;
f = 1000;
ph = [0 pi/2 pi];
pwr = [0 .001 .01 .1 1];

% create a time vector
n = 0:100-1;