Point(1) = {0, 0, 0, 0.01};
Point(2) = {1, 0, 0, 0.01};
Point(3) = {1, 1, 0, 0.01};
Point(4) = {0, 1, 0, 0.01};
Point(5) = {0.3, 0.5, 0, 0.01};
Point(6) = {0.7, 0.5, 0, 0.01};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line Loop(6) = {4, 1, 2, 3};

Plane Surface(7) = {6};
Line{5} In Surface{7};

Physical Surface(1) = {7};


