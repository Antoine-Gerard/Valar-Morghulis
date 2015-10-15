Point(1) = {0, 0, 0, 0.01};
Point(2) = {1, 0, 0, 0.01};
Point(3) = {1, 1, 0, 0.01};
Point(4) = {0, 1, 0, 0.01};
Point(5) = {0.3, 0.5, 0, 0.01};
Point(6) = {0.7, 0.5, 0, 0.01};
Point(7) = {1.4, 1, 0.5, 0.01};
Point(8) = {1, 1, 0.5, 0.01};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};

Line Loop(6) = {4, 1, 2, 3};
Line Loop(7) = {5, 6, 7, 8};

Plane Surface(7) = {6};
Plane Surface(8) = {7};


Physical Surface(1) = {7};
Physical Surface(2) = {8};