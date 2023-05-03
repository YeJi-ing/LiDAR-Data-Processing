%% 2D LiDAR

%% Data load 
% 데이터 길이 : 1200, Field of View (FOV) : 300, Angular Resolution : 0.25

clc; clear; % 작업 공간 및 명령 창 모두 초기화

lidar_data = readmatrix("R300_Data.csv"); % N(row) x 1200(column) double
lidar_data_1 = lidar_data(1,:); % 1(row) x 1200(column) double

angle_start = 0; % 0 ~ 299.75
angle_res1 = 0.25;
angle1 = angle_start : angle_res1 : angle_start + angle_res1 * 1199;

%% make ptClouds
x1 = cosd(angle1).*(lidar_data_1);
y1 = sind(angle1).*(lidar_data_1);
z1 = zeros(1, length(x1));

%% print ptClouds
figure; 
axis([0 20 -10 10]); 
plot3(x1, y1, z1, 'r.'); xlabel('x(m)'); ylabel('y(m)');

%% make MATLAB's ptClouds
xyz = [x1; y1; z1;];
xyz = xyz.';

ptClouds{1, 1} = pointCloud(xyz,Color=[255 255 255]);

save('ptClouds.mat','ptClouds');
