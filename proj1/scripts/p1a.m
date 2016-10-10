clear;
hold off;
clf;

title({'';''})
figure(1)

avg = [0, 2, -5, .5];
sigma = [1, 5, .1, .01];
sigma2 = sigma.^2;
bins = 1000;

for i = 1:4
  % generate random sequence of normally-distributed numbers
  a = avg(i) + randn(1e6, 1) * sigma(i);
  % generate and plot histogram of it
  [hh, xx] = hist(a, bins);
  
  % generate and plot probability density function
  x = linspace(min(a), max(a), bins);
  px = 1/sqrt(2*sigma2(i)*pi) * exp(-(x-avg(i)).^2 / (2*sigma2(i)));
  
  % plot histogram and probability density function
  subplot(1,4,i)
  hold on;
  binwidth = xx(2)-xx(1);
  plot(xx, hh/(sum(hh)*binwidth), ":g")
  plot(x, px, ":b")
  legend({})
  
  hold off;
end
