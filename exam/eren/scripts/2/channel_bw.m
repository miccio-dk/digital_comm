clf
figure 1;
hold on;

nsamp = 50;
bw = [0.4 0.6 1 2];

for k = 1:length(bw)
  lambda = bw(k);
  [b, a] = butter(3,2*lambda/nsamp);
  [h, w] = freqz(b,a);
  
  % subplot(4, 1, k);
  plot(w/pi, mag2db(abs(h)))
end

hold off;
figure 2;
hold on;

ww = linspace(0, 1, 512);

for k = 1:length(bw)
  lambda = bw(k);
  [b, a] = butter(3,2*lambda/nsamp);
  %hh = filt(b,a);
  %[mag, phase] = bode(hh, ww);
  [mag, phase] = bode(tf(b,a,-1,'variable','z^-1'), ww);
  
  % subplot(4, 1, k);
  plot(ww,  mag2db(mag))
end

hold off;
