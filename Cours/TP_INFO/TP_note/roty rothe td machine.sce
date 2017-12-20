//A
v0 = zeros(1, 50)
v1 = 10*ones(1, 50)
v2 = 0:0.3:9.9
v5 = linspace(-3, 7, 50)

//B
function f = truc(x)
    f = (1+x).*sin(%pi*x)
endfunction
x = linspace(-2, 2, 100);
y = truc(x);

fenetre = figure("figure_name", "courbe", "position", [100 50 1000 600])
fenetre.background = color("white")
plot2d(x, y, style=[color("pink")])

function z = P1(x)
    z = %pi.*x
endfunction

function g = P2(x)
    g = %pi.*x + %pi.*x^2
endfunction

z = P1(x)
g = P2(x)

plot2d(x, z, style=[color("purple")])

plot2d(x, g, style=[color("blue")])

xdel(winsid())

//C
function h = G(t,y)
    h = y./t + t.*log(t)
endfunction

u = 1;
a = 1;
t = linspace(1, 4, 100);
y = ode("rk", u, a, t, G)

fenetre = figure("figure_name", "courbegdthd", "position", [100 50 1000 600])
fenetre.background = color("white")
plot2d(x, y', style=[color("black")])

u = -2;
a = 1;
t = linspace(1, 4, 100);
y = ode("rk", u, a, t, G)
plot2d(x, y', style=[color("purple")])

u = 2;
a = 1;
t = linspace(1, 4, 100);
y = ode("rk", u, a, t, G)
plot2d(x, y', style=[color("yellow")])
