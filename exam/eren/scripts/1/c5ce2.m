% clean figure and load signal package (only for Octave)
clf
pkg load signal

% simulation parameters:
%  - nr of symbols (must be divisible by 4)
%  - nr of samples per symbol
%  - filter cutoff values (normalized bandwidth)
nsym = 1000;
nsamp = 50;
bw = [0.4 0.6 1 2];

% for each filter cutoff value..
for k = 1:length(bw)
  % generate filter coefficients using one of the cutoff values
  lambda = bw(k);
  [b,a] = butter(3,2*lambda/nsamp);

  % allocate space for total bit sequence
  l = nsym*nsamp;
  y = zeros(1,l-nsamp+1);

  % initalize random output vector with +1 and -1
  x = 2*round(rand(1,nsym))-1;

  % for each overlap..
  for i = 1:nsym
    % place one symbol into vector y, leaving nsamp samples of spacing
    kk = (i-1)*nsamp+1;
    y(kk) = x(i);
  end
  % zero-order hold
  datavector = conv(y,ones(1,nsamp));

  % apply filter to the total sequence
  filtout = filter(b, a, datavector);

  % splice sequence into sub-sequences of 4 symbols
  datamatrix = reshape(filtout, 4*nsamp, nsym/4);

  % discart the first 5 sub-sequences
  datamatrix1 = datamatrix(:, 6:(nsym/4));

  % plot eye diagram
  subplot(length(bw),1,k)
  plot(datamatrix1, 'k')
  
  % format: print axis labels, legend, and set plot range
  ylabel('Amplitude')
  axis([0 4*nsamp -1.4 1.4])
  legend(['Bn = ', num2str(lambda)])
  if k == 4
    xlabel('t/Tsamp')
  end
end
