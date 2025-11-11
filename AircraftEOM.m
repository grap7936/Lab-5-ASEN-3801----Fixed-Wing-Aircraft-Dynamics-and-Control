% Author: Lucas Nussbamer
% 
% File name: AircraftEOM.m
%
% AircraftEOM uses the equations of motion for an aircraft to compute its 
% state derivatives and input them at each time step with ODE45.
% 
% Inputs:
%   time              - Current time (scalar)
%   aircraft_state    - State vector of the aircraft [x_E; y_E; z_E; phi; theta; psi; u_E; v_E; w_E; p; q; r]
%   aircraft_surfaces - Control surface deflections [delta_elevator; delta_aileron; delta_rudder]
%   wind_inertial     - Wind components in inertial frame [wind_u; wind_v; wind_w]
%   aircraft_parameters- Aircraft parameters [mass; I_xx; I_yy; I_zz; I_xy; I_xz; I_yz; g]
%
% Outputs:
%   xdot              - Time derivative of the state vector (6x1 vector)
function xdot = AircraftEOM(time, aircraft_state, aircraft_surfaces, wind_inertial, aircraft_parameters)

%% Upacking 
% Unpack the state vector
x_E = aircraft_state(1);
y_E = aircraft_state(2);
z_E = aircraft_state(3);
phi = aircraft_state(4);
theta = aircraft_state(5);
psi = aircraft_state(6);
u_E = aircraft_state(7);
v_E = aircraft_state(8);
w_E = aircraft_state(9);
p = aircraft_state(10);
q = aircraft_state(11);
r = aircraft_state(12);

% Unpack the control surfaces
delta_elevator = aircraft_surfaces(1);
delta_aileron = aircraft_surfaces(2);
delta_rudder = aircraft_surfaces(3);
delta_thrust = aircraft_surfaces(4);


% Unpack the wind components
wind_u = wind_inertial(1);
wind_v = wind_inertial(2);
wind_w = wind_inertial(3);


% Unpack the aircraft parameters
mass = aircraft_parameters(1);
I_xx = aircraft_parameters(2);
I_yy = aircraft_parameters(3);
I_zz = aircraft_parameters(4);
I_xy = aircraft_parameters(5);
I_xz = aircraft_parameters(6);
I_yz = aircraft_parameters(7);
g = aircraft_parameters(8);

%% Additional set up

% Rotation matrix from interial to body
R_BI = [ cos(theta)*cos(psi),  sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi),  cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi);
         cos(theta)*sin(psi),  sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi),  cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi);
        -sin(theta),           sin(phi)*cos(theta),                             cos(phi)*cos(theta)                          ];

%% Calculate the vector derivative

% Position changes (xdot_E, ydot_E, zdot_E)
xdot(1:3) = R_BI * [u_E; v_E; w_E]; 

% Euler Angle changes (phidot, thetadot, psidot)
xdot(4:6) = [1,     sin(phi)*tan(theta),        cos(phi)*tan(theta);
             0,     cos(phi),                   -sin(phi);
             0,     sin(phi)*sec(theta),        cos(phi)*sec(theta)] * [p; q; r];

% Velocity changes (udot_E, vdot_E, wdot_E)
X
Y
Z





















end