%% modelmasterscript
%%  running the baseline simulations 
%cd main
addpath(horzcat(pwd,'\main'))
calibrate_model
multipliers_normal_times
%crisis_experiments

%% Save the variables

Consumption_quarterly= (par.chi)*exp(irf_store.nopol(strmatch('Cb', M_.endo_names, 'exact'),2:end))+(1-par.chi)*exp(irf_store.nopol(strmatch('Cs', M_.endo_names, 'exact'),2:end));
Consumption= repelem((par.chi)*exp(irf_store.nopol(strmatch('Cb', M_.endo_names, 'exact'),2:end))+(1-par.chi)*exp(irf_store.nopol(strmatch('Cs', M_.endo_names, 'exact'),2:end)),12)'; %convert to weekly from quarterly
Labour_quarterly = exp(irf_store.nopol(strmatch('N_a', M_.endo_names, 'exact'),2:end)) + exp(irf_store.nopol(strmatch('N_n', M_.endo_names, 'exact'),2:end)); 
Labour = repelem(exp(irf_store.nopol(strmatch('N_a', M_.endo_names, 'exact'),2:end)) + exp(irf_store.nopol(strmatch('N_n', M_.endo_names, 'exact'),2:end)),12)'; 
Output_quarterly = exp(irf_store.nopol(strmatch('GDP', M_.endo_names, 'exact'),2:end)); 
Output = repelem(exp(irf_store.nopol(strmatch('GDP', M_.endo_names, 'exact'),2:end)),12)'; 
Inflation_quarterly = exp(irf_store.nopol(strmatch('Pi', M_.endo_names, 'exact'),2:end)); 
Inflation = repelem(exp(irf_store.nopol(strmatch('Pi', M_.endo_names, 'exact'),2:end)),12)'; 
Interest_quarterly = exp(irf_store.nopol(strmatch('R', M_.endo_names, 'exact'),2:end)); 
Interest = repelem(exp(irf_store.nopol(strmatch('R', M_.endo_names, 'exact'),2:end)),12)'; 


Susceptibles = nan(size(Consumption));
Deaths = nan(size(Consumption));
Infected = nan(size(Consumption));
Recovered =  nan(size(Consumption));
Investment =  nan(size(Consumption));

Consumption_ss = par.chi*detss.Cb+(1-par.chi)*detss.Cs; 
Labour_ss = detss.N_a + detss.N_n; 
Output_ss= detss.GDP; 
Inflation_ss= detss.Pi; 
Interest_ss= detss.R; 
Investment_ss=nan; 
Deaths_ss = nan;
Infected_ss= nan;
Recovered_ss= nan;
Susceptibles_ss= nan;

%% as % deviation from Steady State %%
% Consumption_dev_ss=100*(Consumption/Consumption_ss -1); 
% Labour_dev_ss=100*(Labour/Labour_ss -1); 
% Output_dev_ss=100*(Output/Output_ss -1); 

save('simulated_results.mat','Consumption','Labour','Output','Deaths','Susceptibles','Infected','Recovered','Interest','Inflation','Investment');
save('simulated_results_ss.mat','Consumption_ss','Labour_ss','Output_ss','Deaths_ss','Susceptibles_ss','Infected_ss','Recovered_ss','Interest_ss','Inflation_ss','Investment_ss');




