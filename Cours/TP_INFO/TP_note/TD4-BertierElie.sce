//TD4 BERTIER CASSANDRA

//A)

v0 =zeros(1,50)
v1 =10*ones(1,50)
v2 = 0:0.3:10
v5 = linspace(-3,7,50)
v6 =2.^(1:25)

//B)
//1)

function r = f(t)
    r = (1+t).*(sin(%pi*t))
endfunction

x = linspace(-2, 2, 100);
y = f(x);
xdel(winsid());
fenetre = figure("Figure_name", "Mon premier tracé", "position",[-2 2 1000 600]);
fenetre.background = color("aliceblue");
set("current_figure", fenetre);

plot2d(x',y', style=[color("forestgreen")])

coor = get("current_axes");
coor.title.text = "Quelques courbes";
coor.title.font_size = 3;
coor.filled = "on";
coor.background = color("seashell1");
coor.x_label.text= "Axe des abscisses";
coor.x_label.font_size = 2;
coor.x_label.font_color = color("dark violet");
coor.y_label.text= "Axe des ordonnées";
coor.y_label.font_size = 2;
coor.y_label.font_color = color("dark violet");
coor.x_location = "origin";
coor.x_label.position = [4, -0.5];
coor.grid = [-1, color("blue"), -1];

//2)

function z = P1(t)
    z = (%pi.*t)
endfunction

a = linspace(-2, 2, 100);
b = P1(a)
plot2d(a',b', style=[color("blue")])

coor = get("current_axes");
coor.title.text = "Quelques courbes";
coor.title.font_size = 3;
coor.filled = "on";
coor.background = color("seashell1");
coor.x_label.text= "Axe des abscisses";
coor.x_label.font_size = 2;
coor.x_label.font_color = color("dark violet");
coor.y_label.text= "Axe des ordonnées";
coor.y_label.font_size = 2;
coor.y_label.font_color = color("dark violet");
coor.x_location = "origin";
coor.x_label.position = [4, -0.5];
coor.grid = [-1, color("blue"), -1];

function h = P2(t)
    h = (%pi.*t)+(%pi.*t^2)
endfunction

u = linspace(-2,2,100);
v = P2(u)
plot2d(u',v', style=[color("red")])

coor = get("current_axes");
coor.title.text = "Quelques courbes";
coor.title.font_size = 3;
coor.filled = "on";
coor.background = color("seashell1");
coor.x_label.text= "Axe des abscisses";
coor.x_label.font_size = 2;
coor.x_label.font_color = color("dark violet");
coor.y_label.text= "Axe des ordonnées";
coor.y_label.font_size = 2;
coor.y_label.font_color = color("dark violet");
coor.x_location = "origin";
coor.x_label.position = [4, -0.5];
coor.grid = [-1, color("blue"), -1];


//C)
//1)

function r = G(t,y)
    r=(y./t)+t.*log(t)
endfunction

y = ode("rk", u, a, t, G);

u = 1;
a = 1;
t = linspace(1, 4, 100);

fenetre = figure("Figure_name", "Mon premier tracé", "position",[-2 2 1000 600]);
fenetre.background = color("aliceblue");
set("current_figure", fenetre);

plot2d(x',y', style=[color("black")])

//2)


function r = G(t,y)
    r=(y./t)+t.*log(t)
endfunction

y = ode("rk", u, a, t, G);


u = -2;
a = 1;
t = linspace(1, 4, 100);

plot2d(x',y', style=[color("black")])