clear all;
close all;
clc
%% Open and Sim
% Baseline @ 25C
open power_battery_aging_sim.slx
sim power_battery_aging_sim.slx
% Arizona @ 29.67C
open power_battery_aging_sim_Arizona.slx
sim power_battery_aging_sim_Arizona.slx
% Florida @ 22.3C
open power_battery_aging_sim_Florida.slx
sim power_battery_aging_sim_Florida.slx

% Michigan @ 15C
open power_battery_aging_sim_Michigan.slx
sim power_battery_aging_sim_Michigan.slx

% Alaska @ 7C
open power_battery_aging_sim_Alaska.slx
sim power_battery_aging_sim_Alaska.slx

%% Initiate Variables from Sim

% Baseline
BaseT = timeseries2timetable(Baseline.Cell_Temperature__oC_);
BaseAge = timeseries2timetable(Baseline.Age__Equivalent_Full_Cycles_);
BaseCap = timeseries2timetable(Baseline.Maximum_Capacity___Ah_);
BTime = BaseCap.Time;
BTT = BaseAge.Time;

% Arizona
AZT = timeseries2timetable(Arizona.Cell_Temperature__oC_);
AZAge = timeseries2timetable(Arizona.Age__Equivalent_Full_Cycles_);
AZCap = timeseries2timetable(Arizona.Maximum_Capacity___Ah_);
AZTime = AZT.Time;
AZTT = AZAge.Time;

% Florida
FloT = timeseries2timetable(Florida.Cell_Temperature__oC_);
FloAge = timeseries2timetable(Florida.Age__Equivalent_Full_Cycles_);
FloCap = timeseries2timetable(Florida.Maximum_Capacity___Ah_);
FloTime = FloT.Time;
FloTT = FloAge.Time;

% Michigan
MiT = timeseries2timetable(Michigan.Cell_Temperature__oC_);
MiAge = timeseries2timetable(Michigan.Age__Equivalent_Full_Cycles_);
MiCap = timeseries2timetable(Michigan.Maximum_Capacity___Ah_);
MiTime = MiT.Time;
MiTT = MiAge.Time;

% Alaska
AT = timeseries2timetable(Alaska.Cell_Temperature__oC_);
AAge = timeseries2timetable(Alaska.Age__Equivalent_Full_Cycles_);
ACap = timeseries2timetable(Alaska.Maximum_Capacity___Ah_);
ATime = AT.Time;
ATT = AAge.Time;

%% Plot

figure('Name','Cell Temp.(C)');
plot(BTime,BaseT.Cell_Temperature__oC_(:,1),'k',AZTime,AZT.Cell_Temperature__oC_(:,1),'r',...
    FloTime,FloT.Cell_Temperature__oC_(:,1),'b',MiTime,MiT.Cell_Temperature__oC_(:,1),'g',...
    ATime,AT.Cell_Temperature__oC_(:,1),'c');
xlabel('Time (sec)');
ylabel('Temp (C)');
legend('Base','Arizona','Florida','Michigan','Alaska');
title('Cell Temp(C)');

figure('Name','Capacity(Ah)');
plot(BTime,BaseCap.Maximum_Capacity___Ah_(:,1),'k',AZTime,AZCap.Maximum_Capacity___Ah_(:,1),'r',...
    FloTime,FloCap.Maximum_Capacity___Ah_(:,1),'b',MiTime,MiCap.Maximum_Capacity___Ah_(:,1),'g',...
    ATime,ACap.Maximum_Capacity___Ah_(:,1),'c');
xlabel('Time (sec)');
ylabel('Capacity (Ah)');
legend('Base','Arizona','Florida','Michigan','Alaska');
title('Battery Capacity (Ah)');

figure('Name','Age');
plot(BTT,BaseAge.Age__Equivalent_Full_Cycles_(:,1),'k',AZTT,AZAge.Age__Equivalent_Full_Cycles_(:,1),'r',...
    FloTT,FloAge.Age__Equivalent_Full_Cycles_(:,1),'b',MiTT,MiAge.Age__Equivalent_Full_Cycles_(:,1),'g',...
    ATT,AAge.Age__Equivalent_Full_Cycles_(:,1),'c');
xlabel('Time (sec)');
ylabel('Age');
legend('Base','Arizona','Florida','Michigan','Alaska');
title('Battery Age');
