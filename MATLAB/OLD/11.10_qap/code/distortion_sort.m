clear;
clc;

M0 = read_off('tr_reg_000.off');
M1 = read_off('tr_reg_001.off');
M2 = read_off('tr_reg_002.off');
M3 = read_off('tr_reg_003.off');


IM0 = eye(M0.n);
IM1 = eye(M1.n);

%{
get_plot(M0)
get_plot(M1)
get_plot(M2)
get_plot(M3)
%}

% get farthest point sampling indices
fpsM0_ind = farthest_ps(M0.VERT, 100, 1);
fpsM1_ind = farthest_ps(M1.VERT, 100, 1);
fpsM2_ind = farthest_ps(M2.VERT, 100, 1);
fpsM3_ind = farthest_ps(M3.VERT, 100, 1);


% get vertices according to fps indices
fpsM0 = M0.VERT(fpsM0_ind, :);
fpsM1 = M1.VERT(fpsM1_ind, :);
fpsM2 = M2.VERT(fpsM2_ind, :);
fpsM3 = M3.VERT(fpsM3_ind, :);

% compute metric distortion for each fpsM0 - fpsMi pair
distortionM0_M1 = metric_distortion(fpsM0, fpsM1);
distortionM0_M2 = metric_distortion(fpsM0, fpsM2);
distortionM0_M3 = metric_distortion(fpsM0, fpsM3);

% prepare for plotting, insert shapes into an array so that it will be easy
% to extract them according to distortion sorts.
shapes = [M1, M2, M3];
distortions = [distortionM0_M1, distortionM0_M2, distortionM0_M3];
[sort_val, sort_ind] = sort(distortions);

figure;
subplot(141)
get_plot(M0)
title('original shape');

subplot(142)
get_plot(shapes(sort_ind(1)))

subplot(143)
get_plot(shapes(sort_ind(2)))

subplot(144)
get_plot(shapes(sort_ind(3)))



