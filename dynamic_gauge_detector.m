% Clear workspace variables, console and existing inputs
clc, clear all, clear vars


% Track characteristics variables

% Minimum track curvature radius
radius = 20
% Loading gauge width
load_gauge = 0.8

% Locomotive dimensions variables

% Locomotive length
loco_length = 2.7
% Locomotive width
loco_width = 0.6
% Distance between bogies (pivot)
bogie_dist = 1.6


% Calculate track
x_track = linspace(0, radius, 500);
x_outer = linspace(-load_gauge/2, radius, 120);
x_inner = linspace(load_gauge/2, radius, 80);

y_track = sqrt(radius^2 - (x_track-radius).^2);
y_outer = sqrt((radius+(load_gauge/2))^2 - (x_outer-radius).^2);
y_inner = sqrt((radius-(load_gauge/2))^2 - (x_inner-radius).^2);


% Calculate locomotive position

alpha = acos(-(bogie_dist^2/(2*radius^2)) + 1)
pivot_back = [0, 0];
pivot_front = [radius - radius*cos(alpha), radius*sin(alpha)];
% Locomotive "roll" - angle relative to track tagent
theta = atan(pivot_front(2)/pivot_front(1))

% Calculate rotation matrix (clockwise)
rotation_mat = [cos(-theta), sin(-theta); -sin(-theta), cos(-theta)];

% Locomotive position matrix (each corner corresponds to a column)
% Locomotive corners are mentioned counter-clockwise with the first one
% being the bottom left corner (locomotive end)
locomotive_pos = [-(loco_length-bogie_dist)/2, -(loco_length-bogie_dist)/2, bogie_dist+(loco_length-bogie_dist)/2, bogie_dist+(loco_length-bogie_dist)/2;
                  -loco_width/2, loco_width/2, loco_width/2, -loco_width/2];

% Rotate local coordinates to global coordinates
locomotive_pos = rotation_mat*locomotive_pos;


% Giving the locomotive an "advance" for better visualisation of the results
% Since the slope of the intial portion is high its resolution is bad
gamma = pi/8;
advance = [radius*(1-cos(gamma)); radius*sin(gamma)];
advance_rotation = [cos(gamma), sin(gamma); -sin(gamma), cos(gamma)];

locomotive_pos = advance_rotation*locomotive_pos;
locomotive_pos(1, :) = locomotive_pos(1, :) + advance(1);
locomotive_pos(2, :) = locomotive_pos(2, :) + advance(2);


% Plot track loading gauge position and locomotive ocupation

% Plot settings: grid lines and constant ratio between x-axis and y-axis
grid on
hold on
axis equal
hold on

% Track
plot(x_track, y_track, 'black', 'DisplayName', 'Track centerline');
hold on
plot(x_outer, y_outer, 'red', 'DisplayName', 'Loading gauge limit');
hold on
plot(x_inner, y_inner, 'red', 'HandleVisibility', 'off');
hold on

% Locomotive corners and walls
plot([locomotive_pos(1,1), locomotive_pos(1,2)], [locomotive_pos(2,1), locomotive_pos(2,2)], 'b-s', 'DisplayName', 'Locomotive');
hold on
plot([locomotive_pos(1,2), locomotive_pos(1,3)], [locomotive_pos(2,2), locomotive_pos(2,3)], 'b-s', 'HandleVisibility', 'off');
hold on
plot([locomotive_pos(1,3), locomotive_pos(1,4)], [locomotive_pos(2,3), locomotive_pos(2,4)], 'b-s', 'HandleVisibility', 'off');
hold on
plot([locomotive_pos(1,4), locomotive_pos(1,1)], [locomotive_pos(2,4), locomotive_pos(2,1)], 'b-s', 'HandleVisibility', 'off');
hold on

% Show legend
legend();