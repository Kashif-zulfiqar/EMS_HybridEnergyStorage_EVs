% ADVISOR data file:  ESS2_UC_Maxwell.m
%
% Data source:
% Maxwell White Papers
%
% Data confirmation:
%
% Notes:
% These parameters describe the Maxwell BCAP 3400 2.7V Ultracapacitor.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Please be aware that this file is to define the WHOLE UC PACK, rather
% a serial module. 
% In this case, the UC pack is composed of 120 serial*2 parallel BCAP 3400 2.7V.
% For stand-alone UC cell, its typical Res is 0.22 mohm, and Capacitance is
% 3400 F.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

%
% Revision history at end of file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FILE ID INFO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess2_description='Maxwell BCAP 3400 2.7V Ultracapacitor';
ess2_version=2003; % version of ADVISOR for which the file was generated
ess2_proprietary=0; % 0=> non-proprietary, 1=> proprietary, do not distribute
ess2_validation=0; % 0=> no validation, 1=> data agrees with source data, 
% 2=> data matches source data and data collection methods have been verified
disp(['Data loaded: ESS2_UCPro_Maxwell - ',ess2_description])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOC RANGE over which data is defined
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess2_soc=[0:0.1:1];  % (--) % not used in model

ess2_init_soc=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Temperature range over which data is defined
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess2_tmp=[-20 -10 0 5 10 15 20 25 30 40 50 60 65];  % (C) % from White Papers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Current range over which data is defined

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess2_i=[-2600 -112.5 -56.3 56.3 112.5 2600];  % (C) actually not used in model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOSS AND EFFICIENCY parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% average coulombic (a.k.a. amp-hour) efficiency below, constant value
% indexed by ess_tmp (row) and ess_i (col)
ess2_coulombic_eff=[
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  0.9958  0.9958  0.9958  0.9958  0.9958  0.9958
  ];  % (--); from test data

% module's resistance, indexed by ess2_tmp
ess2_r=[
1.25 1.09 0.998 0.984 0.981 0.987 0.996 1 1 0.998 0.998 1 1
]*0.22*120/2/1000; % (ohm) from test data

 % module's capacitance, indexed by ess2_tmp
ess2_cap=[
0.989 1 1.01 1.01 1.01 1 1 1 0.998 0.994 0.991 0.987 0.987
]*3400/120*2; % (Farads) from test data

ess2_cell_nominal_cap=3400;  %(F)

%ess2_voc=[1.25:((2.5-1.25)/10):2.5;1.25:((2.5-1.25)/10):2.5;1.25:((2.5-1.25)/10):2.5];   %use eps instead of 1.25 so voltage range can be set by SOC range
ess2_voc=[eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;eps:((2.7*120-eps)/10):2.7*120;];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LIMITS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ess2_min_volts=0.01; % for comparison to test data
ess2_min_volts=0*2.7*120; % common practice is 50% of max through controls, but should be set to this by setting SOC range to 0.5 to 1.0 %UC/Battery practice can make it even lower
ess2_max_volts=2.7*120; % from manufacturer recommendations
%Vw=2.7; % working voltage from manufacturer recommendations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OTHER DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ess2_mod_init_tmp =20;
ess2_module_mass=0.513*120*2;  % (kg), mass of a the whole UC pack

% user definable mass scaling relationship 
ess2_mass_scale_fun=inline('(x(1)*ess2_module_num+x(2))*(x(3)*ess2_cap_scale+x(4))*(ess2_module_mass)','x','ess2_module_num','ess2_cap_scale','ess2_module_mass');
ess2_mass_scale_coef=[1 0 1 0]; % coefficients in ess2_mass_scale_fun

% user definable resistance scaling relationship
ess2_res_scale_fun=inline('(x(1)*ess2_module_num+x(2))/(x(3)*ess2_cap_scale+x(4))','x','ess2_module_num','ess2_cap_scale');
ess2_res_scale_coef=[1 0 1 0]; % coefficients in ess2_res_scale_fun

ess2_module_num=1;  % a default value for number of modules
ess2_parallel_mod_num=1; % a default value for number of modules placed in parallel, model treats ideally as a higher capacitance ultracap.
ess2_cap_scale=1; % scale factor for module max ah capacity

% for stand-alone debugging, normally defined elsewhere
%ess_on=1;
%mc_min_volts=0;
%ess_init_soc=0.001;
%ess_mod_init_tmp=20;
%cyc_mph=[0 35; 1 35];
%air_cp=1200;
%amb_tmp=20;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Caution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In the BD diagram of <uc>, some paras need extra assignment:
%Saturate I; Saturate T, calc Iout/limit power/Stturate

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
