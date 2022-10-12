%Double substrate kinetics model. Dependence of reaction rate on the maximal reaction rate permass of enzyme.
function sliderChanging
fig = uifigure('Position',[100 100 150 150]);
sld = uislider(fig,...
               'Position',[55 75 300 3],...
               'ValueChangingFcn',@(sld,event) sliderMoving(event));
sld.Limits = [0 1];
sld.Value = 0.241;
lbl = uilabel(fig);
lbl.Text = "O2 concentration parameter (mmol dm–3)";
size = lbl.Position(3:4);
lbl.Position(3:4) = [300 22];
lbl.FontSize = 14;
end

function sliderMoving(event)
Vm = 1.529; %maximal reaction rate permass of enzyme (U mg–1)
C_ldopa = [0:0.2:7]; %concentration of L-DOPA (mmol dm–3)
C_o2 = event.Value; %concentration of dissolvedoxygen (mmol dm–3)
Y_tyrosinase = 0.125; %concentration of laccase (mg cm–3)
Km_ldopa = 0.469; %Michaelis-Menten constant for L-DOPA(mmol dm–3) 
Km_o2 = 0.099; %Michaelis-Menten constant dissolved oxygen (mmol dm–3)
r = (Vm * C_ldopa * C_o2 * Y_tyrosinase)./((Km_ldopa + C_ldopa)*(Km_o2 + C_o2));
%figure;
plot(C_ldopa, r);
title('Double substrate kinetics model');
legend('Tyrosinase catalyzator');
xlabel('C_ldopa, concentration of L-DOPA (mmol dm–3)');
ylabel('r, reaction rate')
xlim([0 7])
ylim([0 0.18])
end