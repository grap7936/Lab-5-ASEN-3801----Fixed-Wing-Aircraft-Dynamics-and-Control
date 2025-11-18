%{
Author(s): Maria Christina Sarno, Lucas Nussbaumer, Graeme Appel, Benjamin Edwards
Course: ASEN 3801 -- Fixed Wing Aircraft Simulation and Control
Goal: Complete Applications Regarding Fixed wing Dynamical Systems

%}

%% Housekeeping
clc
clear
close all


%% Calls the ttwistor function to set up parameters
aircraft_parameters = ttwistor;

%% Figure setup
fig_case1 = [1, 2, 3, 4, 5, 6];
fig_case2 = [7, 8, 9, 10, 11, 12];
fig_case3 = [13, 14, 15, 16, 17, 18];

% Plot colors and options
PlotOptions = {'b-', 'r-', 'g-'};
col_case1 = PlotOptions{1};
col_case2 = PlotOptions{2};
col_case3 = PlotOptions{3};

% Toggle Plots
graph_AC_sim = 1;

%% User input to select the part to run
part_to_run = input('Enter the part number to run ( 1, 2, 3): ');
switch part_to_run

case 1
%% Case 2: Initial Conditions = 0 Except for u

% Time span
tspan = linspace(0, 100, 1000);

% initial condition vector
% Units: x0_3 = [m; m; m; deg; deg; deg; m/s; m/s; m/s; deg/s; deg/s; deg/s]
initial_conditions1 = [0; 0; 1609.34; 0; 0; 0; 21; 0; 0; 0; 0; 0];

% Control surface input vector
u0_1 = [0; 0; 0; 0];
w0_1 = [0; 0; 0];


[t_1, states_1] = ode45(@(time, aircraft_state) AircraftEOM(time, aircraft_state, u0_1, w0_1, aircraft_parameters), tspan, initial_conditions1);
states_1 = states_1'; % transpose for poltting conventions

control1 = u0_1(1)*ones(1,length(t_1));
control2 = u0_1(2)*ones(1,length(t_1));
control3 = u0_1(3)*ones(1,length(t_1));
control4 = u0_1(4)*ones(1,length(t_1));

control_input_array = [control1; control2; control3; control4];

% Calls the plot function and creates the plots
PlotAircraftSim(t_1, states_1, control_input_array, fig_case1, col_case1, graph_AC_sim)


case 2
%% Case 2: Aircraft initial state and control input trim values

% Time span
tspan = linspace(0, 100, 1000);

% initial condition vector
% Units: x0_2 = [m; m; m; deg; rad; deg; m/s; m/s; m/s; deg/s; deg/s; deg/s]
initial_conditions2 = [0, 0, -1800, 0, 0.02780, 0, 20.99, 0, 0.5837, 0, 0, 0]';

% Control surface input vector
u0_2 = [0.1079; 0; 0; 0.3182];
w0_2 = [0; 0; 0];

[t_2, states_2] = ode45(@(time, aircraft_state) AircraftEOM(time, aircraft_state, u0_2, w0_2, aircraft_parameters), tspan, initial_conditions2);
states_2 = states_2';

control1_2 = u0_2(1)*ones(1,length(t_2));
control2_2 = u0_2(2)*ones(1,length(t_2));
control3_2 = u0_2(3)*ones(1,length(t_2));
control4_2 = u0_2(4)*ones(1,length(t_2));

control_input_array2 = [control1_2; control2_2; control3_2; control4_2];

% Calls the plot function and creates the plots
PlotAircraftSim(t_2, states_2, control_input_array2, fig_case2, col_case2, graph_AC_sim)


case 3
%% Case 3: Aircraft initial state and control surface input values

% Time span
tspan = linspace(0, 100, 1000);

% initial condition vector
% Units: x0_3 = [m; m; m; deg; deg; deg; m/s; m/s; m/s; deg/s; deg/s; deg/s]
initial_conditions3 = [0; 0; -1800; 15; -12; 270; 19; 3; -2; 0.08; -0.2; 0];

% Converts from degrees to radians
initial_conditions3(4) = deg2rad(initial_conditions3(4));
initial_conditions3(5) = deg2rad(initial_conditions3(5));
initial_conditions3(6) = deg2rad(initial_conditions3(6));
initial_conditions3(10) = deg2rad(initial_conditions3(10));
initial_conditions3(11) = deg2rad(initial_conditions3(11));

% Control Surface input vector
% Units: u0_3 = [deg; deg; deg; none]
u0_3 = [5; 2; -14; 0.3];

% Converts from degrees to radians
u0_3(1) = deg2rad(u0_3(1));
u0_3(2) = deg2rad(u0_3(2));
u0_3(3) = deg2rad(u0_3(3));

w0_3 = [0; 0; 0];

[t_3, states_3] = ode45(@(time, aircraft_state) AircraftEOM(time, aircraft_state, u0_3, w0_3, aircraft_parameters), tspan, initial_conditions3);
states_3 = states_3';

control1_3 = u0_3(1)*ones(1,length(t_3));
control2_3 = u0_3(2)*ones(1,length(t_3));
control3_3 = u0_3(3)*ones(1,length(t_3));
control4_3 = u0_3(4)*ones(1,length(t_3));

control_input_array3 = [control1_3; control2_3; control3_3; control4_3];

% Calls the plot function and creates the plots
PlotAircraftSim(t_3, states_3, control_input_array3, fig_case3, col_case3, graph_AC_sim)


end



