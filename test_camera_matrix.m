load('all_camera_matrices')
current_camera_matrix = P_set2_right;
input_dir = ['/Users/minhtrangvy/Documents/MATLAB/Computational_Photography/3D_Reconstruction/horse/set2/'];
input_file_ext = 'JPG';
files = dir([input_dir '*.' input_file_ext]);
file = files(5).name;
current_image = imread([input_dir file]);

x  = [0, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200];
y  = [0, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200];

real_vectors = [];
for row = 1:length(x)
    for col = 1:length(y)
        real_vectors = [real_vectors; [x(row), y(col), 0, 1]];
    end
end

image_vectors = [];
for point = 1:length(real_vectors)
    current_ideal_vector = real_vectors(point,:);
    new_vector = current_camera_matrix * current_ideal_vector';
    x2 = new_vector(1,:) ./ new_vector(3,:);
    y2 = new_vector(2,:) ./ new_vector(3,:);

    image_vectors(point,:) = [x2, y2];
end

figure
imagesc(current_image)
hold on;

new_x = image_vectors(:,1);
new_y = image_vectors(:,2);
for point = 1:(length(new_x)-1)
    plot(new_x(point), new_y(point),'.', 'MarkerSize',10);
    hold on;
end
plot(new_x(121), new_y(121),'.', 'MarkerSize',10);
title('Set 2, Right')