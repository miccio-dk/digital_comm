% clean figure and load signal package (only for Octave)
clf
pkg load signal

% simulation parameters:
%  - nr of symbols
%  - nr of samples per symbol
%  - amplitude
%  - carrier frequency
nsym = 16;
nsamp = 100;
a = 1;
fc = 4;

% allocate space for total bit sequence
l = nsym*nsamp;
y = zeros(1,l-nsamp+1);

% initalize random output vector with +1 and -1
x = round(rand(1,nsym));

% for each overlap..
for i = 1:nsym
  % place one symbol into vector y, leaving nsamp samples of spacing
  kk = (i-1)*nsamp+1;
  y(kk:kk+nsamp) = x(i) * a * sin(2 * pi * fc / nsamp * [0:nsamp]);
end

% plot eye diagram
plot([0:nsym*nsamp], y)

% format: print axis labels, legend, and set plot range
ylabel('Amplitude')
axis([0 nsym*nsamp -1.4 1.4])
xlabel('n')

% find indexes of zero-crossing
