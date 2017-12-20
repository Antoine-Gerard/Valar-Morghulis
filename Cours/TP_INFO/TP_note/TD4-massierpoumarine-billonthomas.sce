// A
v0 = zeros(1, 50)
v1 = 10*ones(1, 50)
v2 = 0:0.3:9.9
v5 = linspace(-3, 7, 50)
v7 = 2.*ones(1, 25)
v8 = linspace(1, 25, 25)
v6 = v7.^v8

// B
function r = truc(x)
    r = (1+x).*sin(%pi.*x)
endfunction
x = linspace(-2, 2, 100)
y = truc(x)

fenetre = figure("figure_name", "courbe", "position", [100 50 1000 600])
fenetre.background = color("white")
plot2d(x, y, style=[color("black")])

function p1 = p1(x) 
    p1 = %pi.*x
endfunction

function p2 = p2(x)
    p2 = %pi.*x + %pi.*x.^2
endfunction

t = p1(x)
z = p2(x)

plot2d(x, t, style=[color("blue")])
plot2d(x, z, style=[color("pink")])


xdel(winsid())

// C

function n = G(t,y)
    n = y./t + t.*log(t)
endfunction

u = 1;
a = 1;
t = linspace(1, 4, 100);
y = ode("rk", u, a, t, G);
fenetre = figure("figure_name", "courbegdthd", "position", [100 50 1000 600])
fenetre.background = color("white")
plot2d(t, y', style=[color("yellow")])

u = -2;
a = 1;
t = linspace(1, 4, 100);
y = ode("rk", u, a, t, G);
plot2d(t, y', style=[color("purple")])

u = 2;
a = 1;
t = linspace(1, 4, 100);
y = ode("rk", u, a, t, G);
plot2d(t, y', style=[color("grey")])


