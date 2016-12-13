% file: c9ce1
% Bit error probability for binary signaling;
% vector of correlation coefficients allowed
%
clf
R12 = input('Enter vector of desired R 1 2 values; <= 8 values '); 
A = char('-','-.',':','--','.','o','*','x');
LR = length(R12);
z_dB = 0:.3:15;
z = db2pow(z_dB);
for k = 1:LR
    P_E=qfn(sqrt(z*(1-R12(k)))); % Probability of error for vector of z-values
                                % Plot probability of error versus Eb/N0 in dB
    semilogy(z_dB,P_E,A(k,:)),axis([0 15 10^(-6) 1]),xlabel('Eb/N 0,dB'),ylabel('P_E'),... 
    if k==1
    hold on; grid % Hold plot for plots for other values of R12 end
    end
end
if LR == 1 % Plot legends for R12 values
legend(['R 1 2 = ',num2str(R12(1))]) 
elseif LR == 2
legend(['R 1 2 = ',num2str(R12(1))],['R 1 2 = ',num2str(R12(2))]) 
elseif LR == 3
legend(['R 1 2 = ',num2str(R12(1))],['R 1 2 = ',num2str(R12(2))],['R 1 2 = ',num2str(R12(3))])
elseif LR == 4
legend(['R 1 2 = ',num2str(R12(1))],['R 1 2 = ',num2str(R12(2))],['R 1 2 = ',num2str(R12(3))],['R 1 2 = ',num2str(R12(4))])
elseif LR == 5
legend(['R 1 2 = ',num2str(R12(1))],['R 1 2 = ',num2str(R12(2))],['R 1 2 = ',num2str(R12(3))],['R 1 2 = ',num2str(R12(4))],['R 1 2 = ',num2str(R12(5))])
elseif LR == 6
legend(['R 1 2 = ',num2str(R12(1))],['R 1 2 = ',num2str(R12(2))],['R 1 2 = ',num2str(R12(3))],['R 1 2 = ',num2str(R12(4))],['R 1 2 = ',num2str(R12(5))],['R 1 2 = ',num2str(R12(6))])
elseif LR == 7
legend(['R 1 2 = ',num2str(R12(1))],['R 1 2 = ',num2str(R12(2))],['R 1 2 = ',num2str(R12(3))],['R 1 2 = ',num2str(R12(4))],['R 1 2 = ',num2str(R12(5))],['R 1 2 = ',num2str(R12(6))],['R 1 2 = ',num2str(R12(7))])
elseif LR == 8
legend(['R 1 2 = ',num2str(R12(1))],['R 1 2 = ',num2str(R12(2))],['R 1 2 = ',num2str(R12(3))],['R 1 2 = ',num2str(R12(4))],['R 1 2 = ',num2str(R12(5))],['R 1 2 = ',num2str(R12(6))],['R 1 2 = ',num2str(R12(7))],['R 1 2 = ',num2str(R12(8))])
    
end
