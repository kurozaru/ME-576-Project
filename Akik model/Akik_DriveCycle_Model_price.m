clc;
clear all;
close all;
%% Vehicle Dynamics Parameters
J = 1.7;
Mv = 1500;
fr = 0.015;
Cd = 0.3;
Af = 1.8;
r = 0.35;
delta = 1.097;
m_eq = delta*Mv;
B = 0.0001;
g = 9.81;
Rho = 1.2;
Gr = 9.7;
%% Motor Parameters
Ke = 0.33;
Kt = 0.33;
Ra = 0.55;
L = 9e-5;
%% Battery Parameters
%Vnom = 360;
Qmax = 150;
Initial_SOC = 1;
SOC = 0:0.1:1;
%normalized_voltage = [0;0.35;0.8;0.95;1;1.02;1.06;1.09;1.12;1.15;1.18];
%% Brake Parameters
max_brakeT = 3000;
Regen_eff = 0.6;
Conv_eff = 0.9;
%% PID Controller Parameters
Kp = 0.3;
Ki = 0.05;
Kd = 0;
Gain = 1;
%% Drive cycle parameters

% cyc_mph = xlsread('UDDS.xlsx');
% cyc_mph = save 'UDDS.mat';
% simtime = length(cyc_mph);
% drivecycle = input('UDDS');
% 
% switch (drivecycle)
%     case 1
%         load UDDS;
%         Gain = 1;
% end
% 
% 

%%% Readin CSV %%%

%%readin 
[file, path] = uigetfile('UDDS.csv', ' Please choose file');
filename = [path, file];

%save as table
Data_table = readtable(filename); 

%save as struct
Data_struct = table2struct(Data_table); 

%% rename
% Struct_x.Time = Data_table(:,1);
% Struct_x.Velocity = Data_table(:,2);
% Struct_x.Elevation = Data_table(:,3);


%% replace NAN
% function [Profile] = deletenans (Profile)
%   nanx = isnan(Profile);
%   t    = 1:numel(Profile);
%   Profile(nanx) = interp1(t(~nanx), Profile(~nanx), t(nanx));
% end

% clearvars file filename 

%% 
speed_table = Data_table(:,2);
speed = table2array(speed_table);
%speed1 = table2array(speed_table);
time_table = Data_table(:,1);
%time = table2array(time_table);

%cyc_mph = [time speed];

%% For look to generate more drive cycles
xx = 1;
LL = length(speed);
z = LL;
speed2 =  speed;

S = vertcat(speed,speed,speed,speed,speed); % puts 1 array at the end of the one before it.
%V = vertcat(S,S,S,speed);
%{
for p = 0:xx
    for s = 0:LL
        speed2(((z*xx)+LL),:) = speed(LL,:);
        Ltotal = length(speed2);
        if Ltotal == 360000
           break
        end
    end
       if Ltotal == 360000
           break
       end
end
%}
T = zeros();
b = length(S) - 2;
for c = 0:b
    T(end+1) = c;
end
time = transpose(T);
cyc_mph_2 = [time S];
Gain = 1;
% drivecycle = input('UDDS');
% 
% switch (drivecycle)
%     case 1
%         load UDDS;
%         Gain = 1;
% end
%simtime = length(cyc_mph);
% sim_cyc_mph = repmat(cyc_mph,simtime,1);
simtime = length(cyc_mph_2);

sim('Master2021b.slx');