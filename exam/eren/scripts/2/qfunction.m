
z_db = -10:.1:10;
r12 = [-1 0]; 
z = db2pow(z_db); 
p_e(1,:) = qfunc(sqrt((1 - r12(1))*z)); 
p_e(2,:) = qfunc(sqrt((1 - r12(2))*z)); 
semilogy(z_db, p_e(1,:)) 
hold on
semilogy(z_db, p_e(2,:)) 
xlabel('Eb/N_o')
ylabel('P_e')