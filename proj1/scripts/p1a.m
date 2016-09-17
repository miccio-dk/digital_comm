title({'';''})

a = randn(1e6, 1);
[nn, xx] = hist(a, 100);

plot(xx, nn)

