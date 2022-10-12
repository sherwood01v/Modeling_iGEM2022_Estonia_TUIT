m = sbiomodel('m');
%Tyrosine
S = addspecies(m,'tyrosine','InitialAmount',0.022);
%L-DOPA
ES = addspecies(m,'l_dopa','InitialAmount',0);
%Dopaquinone
P = addspecies(m,'dopaquinone','InitialAmount',0);
%Tyrosinase
E = addspecies(m,'tyrosinase','InitialAmount',4);

%reaction from tyrosine to L-DOPA
reaction1 = addreaction(m,'tyrosine + tyrosinase -> l_dopa');
kl1 = addkineticlaw(reaction1,'MassAction');
p1 = addparameter(kl1,'k1','Value',10);
kl1.ParameterVariableNames = 'k1';

%reaction from L-DOPA to dopaquinone
reaction2 = addreaction(m,'l_dopa -> tyrosinase + dopaquinone');
kl2 = addkineticlaw(reaction2,'MassAction');
p2 = addparameter(kl2,'k2','Value',0.9);
kl2.ParameterVariableNames = 'k2';

rmreactant(reaction1, 'tyrosinase');
rmproduct(reaction2, 'tyrosinase');
delete(m.species(4));

[t,sd,species] = sbiosimulate(m);
t = t*60;
plot(t,sd);
xlim([min(t(:)) 400]);
ylim([0 max(sd(:))]);
legend(species);
xlabel('Time, min');
ylabel('Species Amount');