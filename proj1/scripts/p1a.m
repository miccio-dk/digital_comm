clear;
hold off;
clf;

title({'Histogram and probability density'})
figure(1)

% simulation parameters
avg = [0, 2, -5, .5];
sigma = [1, 5, .5, .1];
sigma2 = sigma.^2;
bins = 1000;

for i = 1:length(avg)
  % generate random sequence of normally-distributed numbers
  a = avg(i) + randn(1e6, 1) * sigma(i);
  % generate its histogram
  [hh, xx] = hist(a, bins);
  
  % generate probability density function
  x = linspace(min(a), max(a), bins);
  px = 1/sqrt(2*sigma2(i)*pi) * exp(-(x-avg(i)).^2 / (2*sigma2(i)));
  
  % plot histogram and probability density function
  subplot(1,length(avg),i)
  hold on;
  binwidth = xx(2)-xx(1);
  plot(xx, hh/(sum(hh)*binwidth), ":g")
  plot(x, px, ":b")
  txt = sprintf('{ \\sl N(%.2f, %.2f)}', avg(i), sigma2(i));
  legend({"hist()", txt})
  
  hold off;
end
