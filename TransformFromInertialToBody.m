function wind_body = TransformFromInertialToBody(wind_inertial, aircraft_state)

phi = aircraft_state(1); % Roll angle
theta = aircraft_state(2); % Pitch angle
psi = aircraft_state(3); % Yaw angle

% Rotation matrices for 321 Euler angles
R_phi = [1, 0, 0;
          0, cos(phi), -sin(phi);
          0, sin(phi), cos(phi)];

R_theta = [cos(theta), 0, sin(theta);
           0, 1, 0;
           -sin(theta), 0, cos(theta)];

R_psi = [cos(psi), -sin(psi), 0;
          sin(psi), cos(psi), 0;
          0, 0, 1];

% Combined rotation matrix from inertial to body frame
R_BI = R_psi * R_theta * R_phi;
R_IB =  R_BI';

% Transform wind vector from inertial to body frame
wind_body = R_IB * wind_inertial; % Transpose to rotate from inertial to body frame


end
