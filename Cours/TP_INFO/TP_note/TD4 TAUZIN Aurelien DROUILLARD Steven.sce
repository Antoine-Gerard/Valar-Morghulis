//TD4
//Drouillard Steven
//Tauzin Aurelien

//A
[v0] = zeros(1,50)
[v1] = 10 *ones(1,50)
[v2] = 0:0.3:10
[v5] = linspace(-3, 7, 50)
[v61] = 2 *ones(1,25)
[v62] = 1:1:25
[v6] = [v61] .^[v62]

//B
function r = f(x)
    r = (1+x) .*sin(%pi .*x)
endfunction

x = linspace(-2, 2,100)

y = f(x)

fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

plot2d(x, y, style=[color("black")]);


function j = P1(x)
   j = %pi .*x
endfunction

z = P1(x)

plot2d(x, z, style=[color("blue")]);

function k = P2(X)
    k = %pi .*x +( %pi .*x .^2)
endfunction

o = P2(x)

plot2d(x, o, style=[color("red")]);


//C
function s = n(t, y)
    s = y ./t + t .*log(t)
endfunction

fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

u = 1
a = 1
t = linspace(1 ,4 ,100)

y = ode("rk", u, a, t, n)

plot2d(t, y, style=[color("pink")]);

u = -2
a = 1
t = linspace(1 ,4 ,100)

y = ode("rk", u, a, t, n)

plot2d(t, y, style=[color("brown")]);


u = 2
a = 1
t = linspace(1 ,4 ,100)

y = ode("rk", u, a, t, n)

plot2d(t, y, style=[color("purple")]);

