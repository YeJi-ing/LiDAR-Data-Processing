%% 2D LiDAR

%% Data load 
% 데이터 길이 : 1200, Field of View (FOV) : 300, Angular Resolution : 0.25

clc; clear;

lidar_data_1 = readmatrix("map\1.csv");
lidar_data_2 = readmatrix("map\2.csv");

%% make ptClouds
filelist = {lidar_data_1, lidar_data_2};

for i=1:length(filelist)
    lidar_data = filelist{i}(i,2:1201);

    angle_start = 0; % 0 ~ 299.75
    angle_res1 = 0.25;
    angle1 = angle_start : angle_res1 : angle_start + angle_res1 * 1199;
    
    x1 = cosd(angle1).*(lidar_data);
    y1 = sind(angle1).*(lidar_data);
    z1 = zeros(1, length(x1));
    
    xyz = [x1; y1; z1;];
    xyz = xyz.';
    % xyzs{1, i} = xyz;

    ptClouds{1, i} = pointCloud(xyz,Color=[255 255 255]);
end

save('ptClouds.mat','ptClouds');