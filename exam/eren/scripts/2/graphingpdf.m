 %graphing PDF function with random variables
 mu=0; 
 sigma=10; 
 MAX = 50; 
 MIN = -50; 
 STEP = (MAX - MIN) / 1000; 
 PDF = normpdf(MIN:STEP:MAX, mu, sigma); 
 plot(MIN:STEP:MAX, PDF) 