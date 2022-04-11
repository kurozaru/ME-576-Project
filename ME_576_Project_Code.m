clear all;
close all;
clc
%% Open and Sim
% Baseline @ 25C
%open power_battery_aging_sim.slx
%sim power_battery_aging_sim.slx

% Arizona @ 29.67C
%open power_battery_aging_sim_Arizona.slx
%sim power_battery_aging_sim_Arizona.slx

% Florida @ 22.3C
%open power_battery_aging_sim_Florida.slx
%sim power_battery_aging_sim_Florida.slx

% Michigan @ 15C
%open power_battery_aging_sim_Michigan.slx
%sim power_battery_aging_sim_Michigan.slx

% Alaska @ 7C
%open power_battery_aging_sim_Alaska.slx
%sim power_battery_aging_sim_Alaska.slx

% Tesla - baseline
%open power_battery_aging_sim_TeslaBaseline.slx
sim power_battery_aging_sim_TeslaBaseline.slx

% Tesla - Arizona
%open power_battery_aging_sim_TeslaArizona.slx
sim power_battery_aging_sim_TeslaArizona.slx

% Tesla - Alaska
%open power_battery_aging_sim_TeslaAlaska.slx
sim power_battery_aging_sim_TeslaAlaska.slx

% Tesla - Michigan
%open power_battery_aging_sim_TeslaMichigan.slx
sim power_battery_aging_sim_TeslaMichigan.slx

% Tesla - Florida
%open power_battery_aging_sim_TeslaFlorida.slx
sim power_battery_aging_sim_TeslaFlorida.slx

% Samsung - baseline
sim power_battery_aging_sim_SamsungBaseline.slx

% Samsung - Arizona
sim power_battery_aging_sim_SamsungArizona.slx

% Samsung - Alaska
sim power_battery_aging_sim_SamsungAlaska.slx

% Samsung - Michigan
sim power_battery_aging_sim_SamsungMichigan.slx

% Samsung - Florida
sim power_battery_aging_sim_SamsungFlorida.slx

% SK - baseline
sim power_battery_aging_sim_SKBaseline.slx

% SK - Arizona
sim power_battery_aging_sim_SKArizona.slx

% SK - Alaska
sim power_battery_aging_sim_SKAlaska.slx

% SK - Michigan
sim power_battery_aging_sim_SKMichigan.slx

% SK - Florida
sim power_battery_aging_sim_SKFlorida.slx

%% Initiate Variables from Sim - initial battery 12.8v, 40Ah, Li-ion
%{
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
%}
%% Initialize Variables for Telsa Battery Cell Sim
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

%% Initialize Variables for Samsung Cells
% Baseline
SamBaseT = timeseries2timetable(SamsungBaseline.Cell_Temperature__oC_);
SamAge = timeseries2timetable(SamsungBaseline.Age__Equivalent_Full_Cycles_);
SamCap = timeseries2timetable(SamsungBaseline.Maximum_Capacity___Ah_);
SamTTime = SamBaseT.Time;
SamTT = SamAge.Time;

% Arizona
SamAZT = timeseries2timetable(SamsungArizona.Cell_Temperature__oC_);
SamAZAge = timeseries2timetable(SamsungArizona.Age__Equivalent_Full_Cycles_);
SamAZCap = timeseries2timetable(SamsungArizona.Maximum_Capacity___Ah_);
SamAZTime = SamAZT.Time;
SamAZTT = SamAZAge.Time;

% Alaska
SamAT = timeseries2timetable(SamsungAlaska.Cell_Temperature__oC_);
SamAAge = timeseries2timetable(SamsungAlaska.Age__Equivalent_Full_Cycles_);
SamACap = timeseries2timetable(SamsungAlaska.Maximum_Capacity___Ah_);
SamATime = SamAT.Time;
SamATT = SamAAge.Time;

% Michigan
SamMiT = timeseries2timetable(SamsungMichigan.Cell_Temperature__oC_);
SamMiAge = timeseries2timetable(SamsungMichigan.Age__Equivalent_Full_Cycles_);
SamMiCap = timeseries2timetable(SamsungMichigan.Maximum_Capacity___Ah_);
SamMiTime = SamMiT.Time;
SamMiTT = SamMiAge.Time;

% Florida
SamFloT = timeseries2timetable(SamsungFlorida.Cell_Temperature__oC_);
SamFloAge = timeseries2timetable(SamsungFlorida.Age__Equivalent_Full_Cycles_);
SamFloCap = timeseries2timetable(SamsungFlorida.Maximum_Capacity___Ah_);
SamFloTime = SamFloT.Time;
SamFloTT = SamFloAge.Time;

%% Initialize Variables for SK Cells
% Baseline
SKBaseT = timeseries2timetable(SKBaseline.Cell_Temperature__oC_);
SKAge = timeseries2timetable(SKBaseline.Age__Equivalent_Full_Cycles_);
SKCap = timeseries2timetable(SKBaseline.Maximum_Capacity___Ah_);
SKTTime = SKBaseT.Time;
SKTT = SKAge.Time;

% Arizona
SKAZT = timeseries2timetable(SKArizona.Cell_Temperature__oC_);
SKAZAge = timeseries2timetable(SKArizona.Age__Equivalent_Full_Cycles_);
SKAZCap = timeseries2timetable(SKArizona.Maximum_Capacity___Ah_);
SKAZTime = SKAZT.Time;
SKAZTT = SKAZAge.Time;

% Alaska
SKAT = timeseries2timetable(SKAlaska.Cell_Temperature__oC_);
SKAAge = timeseries2timetable(SKAlaska.Age__Equivalent_Full_Cycles_);
SKACap = timeseries2timetable(SKAlaska.Maximum_Capacity___Ah_);
SKATime = SKAT.Time;
SKATT = SKAAge.Time;

% Michigan
SKMiT = timeseries2timetable(SKMichigan.Cell_Temperature__oC_);
SKMiAge = timeseries2timetable(SKMichigan.Age__Equivalent_Full_Cycles_);
SKMiCap = timeseries2timetable(SKMichigan.Maximum_Capacity___Ah_);
SKMiTime = SKMiT.Time;
SKMiTT = SKMiAge.Time;

% Florida
SKFloT = timeseries2timetable(SKFlorida.Cell_Temperature__oC_);
SKFloAge = timeseries2timetable(SKFlorida.Age__Equivalent_Full_Cycles_);
SKFloCap = timeseries2timetable(SKFlorida.Maximum_Capacity___Ah_);
SKFloTime = SKFloT.Time;
SKFloTT = SKFloAge.Time;

%% Plot initial battery 12.8v, 40Ah, Li-ion
%{
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
%}
%% Plot Samsung 3.6v, 94Ah, Li-ion

figure('Name','Samsung Cell Temp.(C)');
plot(SamTTime,SamBaseT.Cell_Temperature__oC_(:,1),'k',SamAZTime,SamAZT.Cell_Temperature__oC_(:,1),'r',...
    SamFloTime,SamFloT.Cell_Temperature__oC_(:,1),'b',SamMiTime,SamMiT.Cell_Temperature__oC_(:,1),'g',...
    SamATime,SamAT.Cell_Temperature__oC_(:,1),'c');
xlabel('Time (sec)');
ylabel('Temp (C)');
legend('Base','Arizona','Florida','Michigan','Alaska',Location='northwest');
title('Samsung Cell Temp(C)');

figure('Name','Samsung Capacity(Ah)');
plot(SamCap.Time,SamCap.Maximum_Capacity___Ah_(:,1),'k',SamAZCap.Time,SamAZCap.Maximum_Capacity___Ah_(:,1),'r',...
    SamFloCap.Time,SamFloCap.Maximum_Capacity___Ah_(:,1),'b',SamMiCap.Time,SamMiCap.Maximum_Capacity___Ah_(:,1),'g',...
    SamACap.Time,SamACap.Maximum_Capacity___Ah_(:,1),'c');
xlabel('Time (sec)');
ylabel('Capacity (Ah)');
legend('Base','Arizona','Florida','Michigan','Alaska');
title('Samsung Battery Capacity (Ah)');

figure('Name','Samsung Age');
plot(SamTT,SamAge.Age__Equivalent_Full_Cycles_(:,1),'k',SamAZAge.Time,SamAZAge.Age__Equivalent_Full_Cycles_(:,1),'r',...
    SamFloTT,SamFloAge.Age__Equivalent_Full_Cycles_(:,1),'b',SamMiTT,SamMiAge.Age__Equivalent_Full_Cycles_(:,1),'g',...
    SamATT,SamAAge.Age__Equivalent_Full_Cycles_(:,1),'c');
xlabel('Time (sec)');
ylabel('Age');
legend('Base','Arizona','Florida','Michigan','Alaska',Location='northwest');
title('Samsung Battery Age');

%% Plot Tesla Module 3.8v, 38Ah, Li-ion

figure('Name','Tesla Cell Temp.(C)');
plot(TTime,TeslaBaseT.Cell_Temperature__oC_(:,1),'k',TeslaAZTime,TeslaAZT.Cell_Temperature__oC_(:,1),'r',...
    TeslaFloTime,TeslaFloT.Cell_Temperature__oC_(:,1),'b',TeslaMiTime,TeslaMiT.Cell_Temperature__oC_(:,1),'g',...
    TeslaATime,TeslaAT.Cell_Temperature__oC_(:,1),'c');
xlabel('Time (sec)');
ylabel('Temp (C)');
legend('Base','Arizona','Florida','Michigan','Alaska',Location='northwest');
legend(loc='upper left')
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
legend('Base','Arizona','Florida','Michigan','Alaska',Location='northwest');
title('Tesla Battery Age');

%% Plot SK 3.7v, 45Ah, Li-ion

figure('Name','SK Cell Temp.(C)');
plot(SKTTime,SKBaseT.Cell_Temperature__oC_(:,1),'k',SKAZTime,SKAZT.Cell_Temperature__oC_(:,1),'r',...
    SKFloTime,SKFloT.Cell_Temperature__oC_(:,1),'b',SKMiTime,SKMiT.Cell_Temperature__oC_(:,1),'g',...
    SKATime,SKAT.Cell_Temperature__oC_(:,1),'c');
xlabel('Time (sec)');
ylabel('Temp (C)');
legend('Base','Arizona','Florida','Michigan','Alaska',Location='northwest');
title('SK Cell Temp(C)');

figure('Name','SK Capacity(Ah)');
plot(SKCap.Time,SKCap.Maximum_Capacity___Ah_(:,1),'k',SKAZCap.Time,SKAZCap.Maximum_Capacity___Ah_(:,1),'r',...
    SKFloCap.Time,SKFloCap.Maximum_Capacity___Ah_(:,1),'b',SKMiCap.Time,SKMiCap.Maximum_Capacity___Ah_(:,1),'g',...
    SKACap.Time,SKACap.Maximum_Capacity___Ah_(:,1),'c');
xlabel('Time (sec)');
ylabel('Capacity (Ah)');
legend('Base','Arizona','Florida','Michigan','Alaska');
title('SK Battery Capacity (Ah)');

figure('Name','SK Age');
plot(SKTT,SKAge.Age__Equivalent_Full_Cycles_(:,1),'k',SKAZAge.Time,SKAZAge.Age__Equivalent_Full_Cycles_(:,1),'r',...
    SKFloTT,SKFloAge.Age__Equivalent_Full_Cycles_(:,1),'b',SKMiTT,SKMiAge.Age__Equivalent_Full_Cycles_(:,1),'g',...
    SKATT,SKAAge.Age__Equivalent_Full_Cycles_(:,1),'c');
xlabel('Time (sec)');
ylabel('Age');
legend('Base','Arizona','Florida','Michigan','Alaska',Location='northwest');
title('SK Battery Age');
