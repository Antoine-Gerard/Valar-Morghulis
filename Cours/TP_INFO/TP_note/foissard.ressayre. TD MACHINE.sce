//Exercice A

V0 = zeros(50, 1)

V1 = 10* ones(50, 1)

V2 = 0:0.3:10

V5 = linspace(-3, 7, 50)


//Exercice B

function f = truc(x)
    f = (1 + x) .*sin(%pi .*x)
endfunction
x = linspace(-2, 2, 100)

xdel(winsid());
fenetre = figure("Figure_name", "Mon premier tracé", "position", [100 50 1000 600]);
fenetre.background = color("aliceblue");
set("current_figure", fenetre);
plot2d(x, truc(x), style=[color("forestgreen")]);

function P1 = P1(x)
    P1 = (%pi .*x)
endfunction
plot2d(x, P1(x), style=[color("red")]);

function P2 = P2(x)
    P2 = (%pi .*x) + (%pi .*x ^2)
endfunction
plot2d(x, P2(x), style=[color("lightblue")]);


//Exercice C
fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

function v = G(t, y)
    v = (y ./t) + t.*log(t)
endfunction
y = ode ("rk", u, a, t, G)
a = 1
t = linspace(1, 4, 100)
u = -2

plot2d(t, y, style=[color("pink")]);
