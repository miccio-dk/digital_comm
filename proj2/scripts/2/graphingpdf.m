 %graphing PDF function with random variables
 mu=0; % This is a mean value. As we know that mean value will be zero for normal pdf.
 sigma=10; %This is a sensible standard deviation number
 MAX = 50; % Maximunm x value that x vector will get 
 MIN = -50; % Minimum x value that x vector will get 
 STEP = (MAX - MIN) / 1000; %This will give us the step values that we will obtain in each interval
 PDF = normpdf(MIN:STEP:MAX, mu, sigma); % This function will give us the calculated the pdf value
 plot(MIN:STEP:MAX, PDF) %This will plot the required PDF graph.