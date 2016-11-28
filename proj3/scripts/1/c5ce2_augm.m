clf
pkg load signal
% simulation parameters:
%  - nr of symbols (must be divisible by 4)
%  - nr of samples per symbol
%  - filter cutoff values
nsym = 100;
nsamp = 50;
bw = [0.4 0.6 1 2];
bw2 = [0.15 0.3 0.7 1.2 4];
%bw = [0.4 0.6 1 2  0.15 0.3 0.7 1.2 4];

% for each filter..
for k = 1:length(bw)
  % generate filter coefficients
  lambda = bw(k);
  [b,a] = butter(3,2*lambda/nsamp);

  l = nsym*nsamp;

  % Total sequence length
  y = zeros(1,l-nsamp+1);

  % Initalize output vector with +1 and -1
  x = 2*round(rand(1,nsym))-1;

  % for each overlap..
  for i = 1:nsym
    % place symbols into vector y
    kk = (i-1)*nsamp+1;
    y(kk) = x(i);
  end
  % zero-order hold
  datavector = conv(y,ones(1,nsamp));

  % apply filter to complite sequence
  filtout = filter(b, a, datavector);

  % splice sequence into sub-sequences of 4 symbols
  datamatrix = reshape(filtout, 4*nsamp, nsym/4);

  % discart the first 6 sub-sequences
  datamatrix1 = datamatrix(:, 6:(nsym/4));

  % plot and format
  subplot(length(bw),1,k)
  plot(datamatrix1, 'k')
  ylabel('Amplitude')
  axis([0 200 -1.4 1.4])
  legend(['Bn = ', num2str(lambda)])
  if k == 4
    xlabel('t/Tsamp')
  end
end
