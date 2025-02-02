%% Clean up
clear all
close all

%% Take in the first image and select a point on that image
input_dir = ['/Users/minhtrangvy/Documents/MATLAB/Computational_Photography/3D_Reconstruction/horse/set1/'];
input_dir2 = ['/Users/minhtrangvy/Documents/MATLAB/Computational_Photography/3D_Reconstruction/horse/set1/'];

input_file_ext = 'JPG';
files = dir([input_dir '*.' input_file_ext]);
files2 = dir([input_dir2 '*.' input_file_ext]);

% % file = files(1).name;
set1_back_left_image = imread([input_dir files(1).name]);
set1_back_right_image = imread([input_dir files(2).name]);
set1_front_left_image = imread([input_dir files(3).name]);
set1_left_image = imread([input_dir files(4).name]);
set1_right_image = imread([input_dir files(5).name]);

set2_back_image = imread([input_dir files2(1).name]);
set2_front_right_image = imread([input_dir files2(2).name]);
set2_front_image = imread([input_dir files2(3).name]);
set2_left_image = imread([input_dir files2(4).name]);
set2_right_image = imread([input_dir files2(5).name]);

% imshow(set1_back_left_image)
% [set1_epipolar_x, set1_epipolar_y] = ginput(1);
% save('set1_epipolar_point')
% load('set1_epipolar_point')

% load('set2_pair2')
% x1 = set2_pair2_back(:,1);
% y1 = set2_pair2_back(:,2);
% set2_epipolar_x = x1(30);
% set2_epipolar_y = y1(30);

load('set2_pair1')
x1 = set2_pair1_front_right(:,1);
y1 = set2_pair1_front_right(:,2);
set2_epipolar_x = x1(30);
set2_epipolar_y = y1(30);

%% Find epipolar lines in the remaining images in the set based on that points
load('all_camera_matrices')
% set1_back_right_line = epipolar_line_tool([set1_epipolar_x,set1_epipolar_y], P_set1_back_left, P_set1_back_right);
% set1_front_left_line = epipolar_line_tool([set1_epipolar_x,set1_epipolar_y], P_set1_back_left, P_set1_front_left);
% set1_left_line = epipolar_line_tool([set1_epipolar_x,set1_epipolar_y], P_set1_back_left, P_set1_left);
% set1_right_line = epipolar_line_tool([set1_epipolar_x,set1_epipolar_y], P_set1_back_left, P_set1_right);

set2_back_line = epipolar_line_tool([set2_epipolar_x,set2_epipolar_y], P_set2_front_right, P_set2_back);
% set2_front_right_line = epipolar_line_tool([set2_epipolar_x,set2_epipolar_y], P_set2_front_right, P_set2_front_right);
set2_front_line = epipolar_line_tool([set2_epipolar_x,set2_epipolar_y], P_set2_front_right, P_set2_front);
set2_left_line = epipolar_line_tool([set2_epipolar_x,set2_epipolar_y], P_set2_front_right, P_set2_left);
set2_right_line = epipolar_line_tool([set2_epipolar_x,set2_epipolar_y], P_set2_front_right, P_set2_right);

%% Find the x and y for each line
size_of_images = size(set1_back_left_image);
universal_x = 1:size_of_images(2);

% set1_back_right_line_y = calculate_y(set1_back_right_line(1), set1_back_right_line(2), set1_back_right_line(3), universal_x);
% set1_front_left_line_y = calculate_y(set1_front_left_line(1), set1_front_left_line(2), set1_front_left_line(3), universal_x);
% set1_left_line_y = calculate_y(set1_left_line(1), set1_left_line(2), set1_left_line(3), universal_x);
% set1_right_line_y = calculate_y(set1_right_line(1), set1_right_line(2), set1_right_line(3), universal_x);

set2_back_line_y = calculate_y(set2_back_line(1), set2_back_line(2), set2_back_line(3), universal_x);
% set2_front_right_line_y = calculate_y(set2_front_right_line(1), set2_front_right_line(2), set2_front_right_line(3), universal_x);
set2_front_line_y = calculate_y(set2_front_line(1), set2_front_line(2), set2_front_line(3), universal_x);
set2_left_line_y = calculate_y(set2_left_line(1), set2_left_line(2), set2_left_line(3), universal_x);
set2_right_line_y = calculate_y(set2_right_line(1), set2_right_line(2), set2_right_line(3), universal_x);

%% Plot base image
% figure
% % subplot(2,3,1)
% imshow(set1_back_left_image)
% hold on;
% plot(set1_epipolar_x, set1_epipolar_y, '.', 'MarkerSize', 20);

figure
% subplot(2,3,1)
imshow(set2_front_right_image)
hold on;
plot(set2_epipolar_x, set2_epipolar_y, '.', 'MarkerSize', 20);

%% Plot images with lines
% figure
% % subplot(2,3,2)
% imshow(set1_back_right_image)
% hold on;
% plot(universal_x, set1_back_right_line_y)
% 
% % THIS IS THE ONLY ONE THAT WORKS
% figure
% % subplot(2,3,3)
% imshow(set1_front_left_image)
% hold on;
% plot(universal_x, set1_front_left_line_y)
% 
% figure
% % subplot(2,3,4)
% imshow(set1_left_image)
% hold on;
% plot(universal_x, set1_left_line_y)
% 
% figure
% % subplot(2,3,5)
% imshow(set1_right_image)
% hold on;
% plot(universal_x, set1_right_line_y)

%% Plot images with lines 2
% set2_back_image = imread([input_dir files2(1).name]);
% set2_front_image = imread([input_dir files2(2).name]);
% set2_front_right_image = imread([input_dir files2(3).name]);
% set2_left_image = imread([input_dir files2(4).name]);
% set2_right_image 

figure
% subplot(2,3,2)
imshow(set2_back_image)
hold on;
plot(universal_x, set2_back_line_y)

% THIS IS THE ONLY ONE THAT WORKS
figure
% subplot(2,3,3)
imshow(set2_front_image)
hold on;
plot(universal_x, set2_front_line_y)

figure
% subplot(2,3,4)
imshow(set2_left_image)
hold on;
plot(universal_x, set2_left_line_y)

figure
% subplot(2,3,5)
imshow(set2_right_image)
hold on;
plot(universal_x, set2_right_line_y)