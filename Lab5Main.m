% Contributors: Ben Edwards, Lucas Nussbaumer, Graeme Appel, Maria Sarno
% Course number: ASEN 3801
% File name: Lab5Main
% Created: 11/11/25

clc;
clear;
close all;

% Calls the ttwistor function
aircraft_parameters = ttwistor;

% Simulation setup
fig_case1 = [1, 2, 3, 4, 5, 6];
fig_case2 = [7, 8, 9, 10, 11, 12];
fig_case3 = [13, 14, 15, 16, 17, 18];

% Plot colors and options
PlotOptions = {'k-', 'r--', 'b-'};
col_case1 = PlotOptions{1};
col_case2 = PlotOptions{2};
col_case3 = PlotOptions{3};

% User input to select the part to run
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

% Calls the plot function and creates the plots
PlotAircraftSim(t_1, states_1, u0_1, fig_case1, col_case1, graph_AC_sim)


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

% Calls the plot function and creates the plots
PlotAircraftSim(t_2, states_2, u0_2, fig_case2, col_case2, graph_AC_sim)


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

% Calls the plot function and creates the plots
PlotAircraftSim(t_3, states_3, u0_3, fig_case3, col_case3, graph_AC_sim)


end









