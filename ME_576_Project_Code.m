clear all;
close all;
clc
%% Open and Sim
% Baseline @ 25C
%open power_battery_aging_sim.slx
sim power_battery_aging_sim.slx
% Arizona @ 29.67C
%open power_battery_aging_sim_Arizona.slx
sim power_battery_aging_sim_Arizona.slx
% Florida @ 22.3C
%open power_battery_aging_sim_Florida.slx
sim power_battery_aging_sim_Florida.slx

% Michigan @ 15C
%open power_battery_aging_sim_Michigan.slx
sim power_battery_aging_sim_Michigan.slx

% Alaska @ 7C
%open power_battery_aging_sim_Alaska.slx
sim power_battery_aging_sim_Alaska.slx

% Tesla - baseline
%open power_battery_aging_sim_TeslaBaseline.slx
sim power_battery_aging_sim_TeslaBaseline2.slx

% Tesla - Arizona
%open power_battery_aging_sim_TeslaArizona.slx
sim power_battery_aging_sim_TeslaArizona2.slx

% Tesla - Alaska
%open power_battery_aging_sim_TeslaAlaska.slx
sim power_battery_aging_sim_TeslaAlaska2.slx

% Tesla - Michigan
%open power_battery_aging_sim_TeslaMichigan.slx
sim power_battery_aging_sim_TeslaMichigan2.slx

% Tesla - Florida
%open power_battery_aging_sim_TeslaFlorida.slx
sim power_battery_aging_sim_TeslaFlorida2.slx

%% Initiate Variables from Sim - initial battery 12.8v, 40Ah, Li-ion
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

%% Initialize Variables for Telsa Battery Module Sim
% Baseline
TeslaBaseT = timeseries2timetable(TeslaBaseline.Cell_Temperature__oC_);
TeslaAge = timeseries2timetable(TeslaBaseline.Age__Equivalent_Full_Cycles_);
TeslaCap = timeseries2timetable(TeslaBaseline.Maximum_Capacity___Ah_);
TTime = TeslaBaseT.Time;
TT = TeslaAge.Time;

% Arizona
TeslaAZT = timeseries2timetable(TeslaArizona.Cell_Temperature__oC_);
TeslaAZAge = timeseries2timetable(TeslaArizona.Age__Equivalent_Full_Cycles_);
TeslaAZCap = timeseries2timetable(TeslaArizona.Maximum_Capacity___Ah_);
TeslaAZTime = TeslaAZT.Time;
TelsaAZTT = TeslaAZAge.Time;

% Alaska
TeslaAT = timeseries2timetable(TeslaAlaska.Cell_Temperature__oC_);
TeslaAAge = timeseries2timetable(TeslaAlaska.Age__Equivalent_Full_Cycles_);
TeslaACap = timeseries2timetable(TeslaAlaska.Maximum_Capacity___Ah_);
TeslaATime = TeslaAT.Time;
TeslaATT = TeslaAAge.Time;

% Michigan
TeslaMiT = timeseries2timetable(TeslaMichigan.Cell_Temperature__oC_);
TeslaMiAge = timeseries2timetable(TeslaMichigan.Age__Equivalent_Full_Cycles_);
TeslaMiCap = timeseries2timetable(TeslaMichigan.Maximum_Capacity___Ah_);
TeslaMiTime = TeslaMiT.Time;
TeslaMiTT = TeslaMiAge.Time;

% Florida
TeslaFloT = timeseries2timetable(TeslaFlorida.Cell_Temperature__oC_);
TeslaFloAge = timeseries2timetable(TeslaFlorida.Age__Equivalent_Full_Cycles_);
TeslaFloCap = timeseries2timetable(TeslaFlorida.Maximum_Capacity___Ah_);
TeslaFloTime = TeslaFloT.Time;
TeslaFloTT = TeslaFloAge.Time;

%% Plot initial battery 12.8v, 40Ah, Li-ion

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

%% Plot Tesla Module 22.8v, 232Ah, Li-ion

figure('Name','Tesla Cell Temp.(C)');
plot(TTime,TeslaBaseT.Cell_Temperature__oC_(:,1),'k',TeslaAZTime,TeslaAZT.Cell_Temperature__oC_(:,1),'r',...
    TeslaFloTime,TeslaFloT.Cell_Temperature__oC_(:,1),'b',TeslaMiTime,TeslaMiT.Cell_Temperature__oC_(:,1),'g',...
    TeslaATime,TeslaAT.Cell_Temperature__oC_(:,1),'c');
xlabel('Time (sec)');
ylabel('Temp (C)');
legend('Base','Arizona','Florida','Michigan','Alaska');
title('Tesla Cell Temp(C)');

figure('Name','Tesla Capacity(Ah)');
plot(TeslaCap.Time,TeslaCap.Maximum_Capacity___Ah_(:,1),'k',TeslaAZCap.Time,TeslaAZCap.Maximum_Capacity___Ah_(:,1),'r',...
    TeslaFloCap.Time,TeslaFloCap.Maximum_Capacity___Ah_(:,1),'b',TeslaMiCap.Time,TeslaMiCap.Maximum_Capacity___Ah_(:,1),'g',...
    TeslaACap.Time,TeslaACap.Maximum_Capacity___Ah_(:,1),'c');
xlabel('Time (sec)');
ylabel('Capacity (Ah)');
legend('Base','Arizona','Florida','Michigan','Alaska');
title('Tesla Battery Capacity (Ah)');

figure('Name','Tesla Age');
plot(TT,TeslaAge.Age__Equivalent_Full_Cycles_(:,1),'k',TeslaAZAge.Time,TeslaAZAge.Age__Equivalent_Full_Cycles_(:,1),'r',...
    TeslaFloTT,TeslaFloAge.Age__Equivalent_Full_Cycles_(:,1),'b',TeslaMiTT,TeslaMiAge.Age__Equivalent_Full_Cycles_(:,1),'g',...
    TeslaATT,TeslaAAge.Age__Equivalent_Full_Cycles_(:,1),'c');
xlabel('Time (sec)');
ylabel('Age');
legend('Base','Arizona','Florida','Michigan','Alaska');
title('Tesla Battery Age');
