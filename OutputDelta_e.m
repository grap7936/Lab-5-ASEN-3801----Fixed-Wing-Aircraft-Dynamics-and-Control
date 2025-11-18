function delta_e = OutputDelta_e(time, aircraft_surfaces, doublet_time, doublet_size)
%% Purpose:
% Output the same delta_e varying control values as calculated in AircraftEOMDoublet. We need a
% separate function to output the control value because we cannot output any variable except for
% derivative of the state vector for the AircraftEOMDoublet simulation

%% Inputs:
% 1.) time == time vector from ode45 with AircraftEOMDoublet
% 2.) aircraft_surfaces ==  vector of four aircraft surfaces including [delta_e, delta_a, delta_r, delta_t]^T
% 3.) doublet_time == time the doublet is activated


delta_e_trim = aircraft_surfaces(1);

% Preallocate delta_e
delta_e = zeros(1, length(time));

for i = 1:length(time)
if 0 <= time(i) && time(i) <= doublet_time
    
    delta_e(i) = delta_e_trim + doublet_size;
    
elseif doublet_time < time(i) && time(i) <= 2*doublet_time
    
    delta_e(i) = delta_e_trim - doublet_size;
    
elseif time(i) >= 2*doublet_time
    
    delta_e(i) = delta_e_trim;
    
end
end

end