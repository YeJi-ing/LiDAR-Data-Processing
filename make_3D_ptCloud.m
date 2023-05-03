%% 3D LiDAR
% LiDAR specification :
% Channels : 4Ch
% FOV : Horizontal 100° / Vertical 3.2°
% Angular Resolution : Horizontal 0.25° / Vertical 1.07°

%% Data load

clear; clc; % 작업 공간 및 명령 창 초기화

lidar_data = readmatrix("filename"); % N(row) x 400(column) double
lidar_data_1 = lidar_data(1,:); % <Ch1> 1(row) x 400(column) double
lidar_data_2 = lidar_data(2,:); % <Ch2> 1(row) x 400(column) double
lidar_data_3 = lidar_data(3,:); % <Ch3> 1(row) x 400(column) double
lidar_data_4 = lidar_data(4,:); % <Ch4> 1(row) x 400(column) double

% (H) 0° ~ 100°
angle_start = 0;
angle_res_H = 0.25;
angle_H = angle_start : angle_res_H : angle_start + angle_res_H * 399;

% (V) -1.07° ~ 2.14°
angle_1V = -1.07;
angle_2V =     0;
angle_3V =  1.07;
angle_4V =  2.14;

%% make ptClouds

% Ch1
x{1} = cosd(angle_1V)*sind(angle_H).*(lidar_data_1);
y{1} = cosd(angle_1V)*cosd(angle_H).*(lidar_data_1);
z{1} = sind(angle_1V).*(lidar_data_1);

% Ch2
x{2} = cosd(angle_2V)*sind(angle_H).*(lidar_data_2);
y{2} = cosd(angle_2V)*cosd(angle_H).*(lidar_data_2);
z{2} = sind(angle_2V).*(lidar_data_2);

% Ch3
x{3} = cosd(angle_3V)*sind(angle_H).*(lidar_data_3);
y{3} = cosd(angle_3V)*cosd(angle_H).*(lidar_data_3);
z{3} = sind(angle_3V).*(lidar_data_3);

% Ch4
x{4} = cosd(angle_4V)*sind(angle_H).*(lidar_data_4);
y{4} = cosd(angle_4V)*cosd(angle_H).*(lidar_data_4);
z{4} = sind(angle_4V).*(lidar_data_4);

%% print ptClouds
figure; hold on; grid on;
plot3(x{1}, y{1}, z{1}, 'r.'); plot3(x{2}, y{2}, z{2}, 'b.'); plot3(x{3}, y{3}, z{3}, 'k.'); plot3(x{4}, y{4}, z{4}, 'y.'); axis([0 20 -10 10]); xlabel('x(m)'); ylabel('y(m)');

%% make MATLAB's ptClouds
for i=1:length(x)
    
    xyz = [x{i}; y{i}; z{i};];
    xyz = xyz.';
    
    ptClouds{1, i} = pointCloud(xyz,Color=[255 255 255]);
end

save('ptClouds.mat','ptClouds'); % 1(row) x 4(column) cell
