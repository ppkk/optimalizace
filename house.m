positions = [3,2; 2,2; 1,2; 0,2;  3,1; 2,1; 1,1; 0,1; 1,0; 0,0];
incidence = [10,8; 10,7; 9,8; 9,7;  8,7; 7,6; 6,5;  8,4; 8,3; 7,4; 7,3; 7,2; 6,3; 6,2; 6,1; 5,2; 5,1;  4,3; 3,2; 2,1];
supports = 2;
m = 0.003;
F = [0,-m, 0,-m, 0,-m, 0,-m,   0,-1-m, 0,-m, 0,-m, 0,-m]';
changable = [1,2,3,4, 6,7,8];