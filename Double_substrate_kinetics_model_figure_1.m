%Double substrate kinetics model. Dependence of reaction rate on the maximal reaction rate permass of enzyme.
Vm = 1.529; %maximal reaction rate permass of enzyme (U mg–1)
%C_ldopa = 3.5; %concentration of L-DOPA (mmol dm–3)
C_ldopa = [0:0.2:7]; %concentration of L-DOPA (mmol dm–3)
C_o2 = 0.241; %concentration of dissolved oxygen (mmol dm–3)
Y_laccase = 0.033; %concentration of laccase (mg cm–3)
Y_tyrosinase = 0.125; %concentration of tyrosinase (mg cm–3)
Km_ldopa = 0.469; %Michaelis-Menten constant for L-DOPA(mmol dm–3) 
Km_o2 = 0.099; %Michaelis-Menten constant dissolved oxygen (mmol dm–3)
r1 = (Vm * C_ldopa * C_o2 * Y_laccase)./((Km_ldopa + C_ldopa)*(Km_o2 + C_o2));
r2 = (Vm * C_ldopa * C_o2 * Y_tyrosinase)./((Km_ldopa + C_ldopa)*(Km_o2 + C_o2));
figure;
plot(C_ldopa, r1, C_ldopa, r2);
title('Double substrate kinetics model');
legend('Laccase', 'Tyrosinase');
xlabel('C_ldopa, concentration of L-DOPA (mmol dm–3)');
ylabel('r, reaction rate')



