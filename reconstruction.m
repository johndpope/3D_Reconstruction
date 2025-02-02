%% Clean up
clear all
close all

%% Take in the first image and select a point on that image
% input_dir = ['/Users/minhtrangvy/Documents/MATLAB/Computational_Photography/3D_Reconstruction/horse/set1/'];
% input_file_ext = 'JPG';
% files = dir([input_dir '*.' input_file_ext]);
% set1_back_left_image = imread([input_dir files(1).name]);
% set1_back_right_image = imread([input_dir files(2).name]);
% set1_front_left_image = imread([input_dir files(3).name]);
% set1_left_image = imread([input_dir files(4).name]);
% set1_right_image = imread([input_dir files(5).name]);

% imshow(set1_back_left_image)
% [set1_back_left_x, set1__back_left_y] = ginput(1);
% save('set1_x1_point')
% load('all_camera_matrices')

% x1 = set1_epipolar_x;
% y1 = set1_epipolar_y;
% x2 = floor(set1_epipolar_x);
% y2 = set1_front_left_line_y(x2);
% point1 = [x1, y2];
% point2 = [x2, y2];

%%
load('reconstruction')
X_set1_pair1 = [];
x1 = set1_pair1_back_left(:,1);
y1 = set1_pair1_back_left(:,2);
x2 = set1_pair1_left(:,1);
y2 = set1_pair1_left(:,2);
for point = 1:length(set1_pair1_back_left)
    point1 = [x1(point), y1(point)];
    point2 = [x2(point), y2(point)];
    X_set1_pair1 = [X_set1_pair1; triangulation_mtv(point1', P_set1_back_left, point2', P_set1_left)];
end

X_set1_pair2 = [];
x1 = set1_pair2_back_right(:,1);
y1 = set1_pair2_back_right(:,2);
x2 = set1_pair2_right(:,1);
y2 = set1_pair2_right(:,2);
for point = 1:length(set1_pair2_back_right)
    point1 = [x1(point), y1(point)];
    point2 = [x2(point), y2(point)];
    X_set1_pair2 = [X_set1_pair2; triangulation_mtv(point1', P_set1_back_right, point2', P_set1_right)];
end

X_set2_pair1 = [];
x1 = set2_pair1_front_right(:,1);
y1 = set2_pair1_front_right(:,2);
x2 = set2_pair1_right(:,1);
y2 = set2_pair1_right(:,2);
for point = 1:length(set2_pair1_front_right)
    point1 = [x1(point), y1(point)];
    point2 = [x2(point), y2(point)];
    X_set2_pair1 = [X_set2_pair1; triangulation_mtv(point1', P_set2_front_right, point2', P_set2_right)];
end

X_set2_pair2 = [];
x1 = set2_pair2_back(:,1);
y1 = set2_pair2_back(:,2);
x2 = set2_pair2_front_right(:,1);
y2 = set2_pair2_front_right(:,2);
for point = 1:length(set2_pair2_front_right)
    point1 = [x1(point), y1(point)];
    point2 = [x2(point), y2(point)];
    X_set2_pair2 = [X_set2_pair2; triangulation_mtv(point1', P_set2_back, point2', P_set2_front_right)];
end

X1_x = X_set1_pair1(:,1);
X1_y = X_set1_pair1(:,2);
X1_z = X_set1_pair1(:,3);
X2_x = X_set1_pair2(:,1);
X2_y = X_set1_pair2(:,2);
X2_z = X_set1_pair2(:,3);
set1_X_x = [X1_x; X2_x];
set1_X_y = [X1_y; X2_y];
set1_X_z = [X1_z; X2_z];

X3_x = X_set2_pair1(:,1);
X3_y = X_set2_pair1(:,2);
X3_z = X_set2_pair1(:,3);
X4_x = X_set2_pair2(:,1);
X4_y = X_set2_pair2(:,2);
X4_z = X_set2_pair2(:,3);
set2_X_x = [X3_x; X4_x];
set2_X_y = [X3_y; X4_y];
set2_X_z = [X3_z; X4_z];

figure
scatter3(set1_X_x,set1_X_y,set1_X_z);
title('Set 1')
hold on;
scatter3(set2_X_x,set2_X_y,set2_X_z);
title('Set 2')