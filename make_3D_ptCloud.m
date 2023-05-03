%% 3D LiDAR

%% Data load
% 데이터 길이 : 400, 수직 분해능 : 1.07, 수평 분해능 : 0.25

clear; clc; % 작업 공간 및 명령 창 초기화

lidar_data = readmatrix("filename");
lidar_data_1 = lidar_data(1,:); % ch1
lidar_data_2 = lidar_data(2,:); % ch2
lidar_data_3 = lidar_data(3,:); % ch3
lidar_data_4 = lidar_data(4,:); % ch4

% (H) 0 ~ 99.75
angle_start = 0;
angle_res_H = 0.25;
angle_H = angle_start : angle_res_H : angle_start + angle_res_H * 399;

% (V) -1.6 ~ 1.6
angle_1V = -1.6;
angle_2V = -0.8;
angle_3V =  0.8;
angle_4V =  1.6;

%% make ptClouds

% ch1
x1 = cosd(angle_1V)*sind(angle_H).*(lidar_data_1);
y1 = cosd(angle_1V)*cosd(angle_H).*(lidar_data_1);
z1 = sind(angle_1V).*(lidar_data_1);

% ch2
x2 = cosd(angle_2V)*sind(angle_H).*(lidar_data_2);
y2 = cosd(angle_2V)*cosd(angle_H).*(lidar_data_2);
z2 = sind(angle_2V).*(lidar_data_2);

% ch3
x3 = cosd(angle_3V)*sind(angle_H).*(lidar_data_3);
y3 = cosd(angle_3V)*cosd(angle_H).*(lidar_data_3);
z3 = sind(angle_3V).*(lidar_data_3);

% ch4
x4 = cosd(angle_4V)*sind(angle_H).*(lidar_data_4);
y4 = cosd(angle_4V)*cosd(angle_H).*(lidar_data_4);
z4 = sind(angle_4V).*(lidar_data_4);

%% print ptClouds
figure; hold on; grid on;
plot3(x1, y1, z1, 'r.'); plot3(x2, y2, z2, 'b.'); plot3(x3, y3, z3, 'k.'); plot3(x4, y4, z4, 'y.'); axis([0 20 -10 10]); xlabel('x(m)'); ylabel('y(m)');
