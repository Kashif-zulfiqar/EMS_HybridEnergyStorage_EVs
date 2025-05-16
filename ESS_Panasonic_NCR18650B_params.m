% ADVISOR data file:  ESS_Panasonic_NCR18650B_temp.m
%
% Data source: Panasonic leaflets & Journal articles
%
% Data confirmation: Null
%
% Notes:
% File created by batmodel using mat files: ;
% 

%
% Revision history at end of file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FILE ID INFO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess_description='3.2 Ah Panasonic_NCR18650B Lithium Ion battery cell'; 
ess_version=2003; % version of ADVISOR for which the file was generated
ess_proprietary=0; % 0=> non-proprietary, 1=> proprietary, do not distribute
ess_validation=1; % 0=> no validation, 1=> data agrees with source data, 
% 2=> data matches source data and data collection methods have been verified
disp(['Data loaded: ESS_Panasonic_NCR18650B_temp.m - ',ess_description])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOC RANGE over which data is defined
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess_soc=[0 10 20 40 60 80 90 100]/100;  % (--)	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Temperature range over which data is defined
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess_tmp=[-10 0 10 25 45];  % (C)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOSS AND EFFICIENCY parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters vary by SOC horizontally, and temperature vertically
ess_max_ah_cap=[2.78 2.92 3.09 3.27 3.31]*74;
	% (A*h), max. capacity at C/3 rate, indexed by ess_tmp

% average coulombic (a.k.a. amp-hour) efficiency below, indexed by ess_tmp
ess_coulombic_eff=[0.863 0.957 0.959 0.967 0.994];  % (0.863,0.959 estimated)
% module's resistance to being discharged, indexed by ess_soc and ess_tmp
ess_r_dis=[0.0470 0.0457 0.0448 0.0435 0.0429 0.0427 0.0429 0.0462;
0.0428 0.0419 0.0411 0.0398 0.0391 0.0388 0.0389 0.0410;
0.0418 0.0404 0.0396 0.0385 0.0378 0.0372 0.0373 0.0382;
0.0381 0.0370 0.0364 0.0356 0.0347 0.0342 0.0341 0.0351;
0.0374 0.0367 0.0361 0.0350 0.0342 0.0338 0.0337 0.0346]*6/74; % (ohm)
% module's resistance to being charged, indexed by ess_soc and ess_tmp
ess_r_chg=[0.0470 0.0457 0.0448 0.0435 0.0429 0.0427 0.0429 0.0462;
0.0428 0.0419 0.0411 0.0398 0.0391 0.0388 0.0389 0.0410;
0.0418 0.0404 0.0396 0.0385 0.0378 0.0372 0.0373 0.0382;
0.0381 0.0370 0.0364 0.0356 0.0347 0.0342 0.0341 0.0351;
0.0374 0.0367 0.0361 0.0350 0.0342 0.0338 0.0337 0.0346]*6/74; % (ohm)
% module's open-circuit (a.k.a. no-load) voltage, indexed by ess_soc and ess_tmp
ess_voc=[2.5 2.74 2.93 3.17 3.36 3.5 3.49 3.34;
2.5 2.85 3.03 3.24 3.43 3.58 3.62 3.62;
2.5 2.92 3.1 3.3 3.47 3.64 3.71 3.78;
2.5 3.02 3.16 3.34 3.52 3.71 3.81 3.97;
2.5 3.12 3.23 3.38 3.55 3.74 3.86 4.01]*6; % (V)
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LIMITS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess_min_volts=2.5*6; 
ess_max_volts=4.2*6; 

ess_module_num=16;  %a default value for number of modules

% nominal capacity of ess (Ah)  
ess_nominal_cap=3.25*74; 

% nominal voltage of ess (V)
ess_nominal_vol=3.6*6*ess_module_num;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OTHER DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess_on=1;
mc_min_volts=0;
ess_init_soc=1;
ess_mod_init_tmp=20;
ess_module_mass=33.75;  % (kg), mass of single module

ess_cap_scale=1; % scale factor for module max ah capacity

% user definable mass scaling relationship 
ess_mass_scale_fun=inline('(x(1)*ess_module_num+x(2))*(x(3)*ess_cap_scale+x(4))*(ess_module_mass)','x','ess_module_num','ess_cap_scale','ess_module_mass');
ess_mass_scale_coef=[1 0 1 0]; % coefficients in ess_mass_scale_fun

% user definable resistance scaling relationship
ess_res_scale_fun=inline('(x(1)*ess_module_num+x(2))/(x(3)*ess_cap_scale+x(4))','x','ess_module_num','ess_cap_scale');
ess_res_scale_coef=[1 0 1 0]; % coefficients in ess_res_scale_fun

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

