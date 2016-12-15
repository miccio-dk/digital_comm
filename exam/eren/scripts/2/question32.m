% File: c8ce1.m
t = 1:6400; % time interval that given between 1 to 6400
fs = 1/32;  % Sampling Frequency that has been specified for this assignment
x = 2*sin(2*pi*fs*t); % Reference signal that consists of a sine wave
y = 10*sin(2*pi*fs*t+pi)+0.1*sin(2*pi*fs*10*t); % Measurement signal that has been specified for this argument. One has a sligthly higher frequency component.
[gain,delay,px,py,rxymax,rho,snrdb] = snrest(x,y); % This snrest estimates the given output arguments
snr=db2pow(snrdb); % Convert signal to noise ratio from decibels to a ratio
format long e % it will set the output format to the long fixed-decimal format and display value of e
a = ['The gain estimate is ',num2str(gain),'.']; % it will convert gain estimate number into a string
b = ['The delay estimate is ',num2str(delay),' samples.'];% it will conver delay estimate number  into a string
c = ['The estimate of px is ',num2str(px),'.']; % it will convert power in reference vector number estimate into a string
d = ['The estimate of py is ',num2str(py),'.']; % it will convert gain estimate number into a string
e = ['The snr estimate is ',num2str(snr),'.']; % it will convert signal to noise ratio number convert into a string
f = ['The snr estimate is ',num2str(snrdb),' db.']; % it will convert snr estimate in db into a string
disp(a); disp(b); disp(c); disp(d); disp(e); disp(f) % it will display the values a,b,c,d in a string at output
%px= determines power in reference vector
%py=determine power in measurement vector
%rxymax= finds the max of the cross-correlation matrix
%rho=estimate of the correlation coefficient
%snr= estimate of signal to noise ratio
%snrdb= snr estimate in db