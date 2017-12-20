// Ballarin Léa
// Mercier Marielle
// A


ones(1, 50)*0
ones(1, 50).*10
z = 0:0.3:10
linspace(-3, 7, 50)

(2 .* ones(0,25)) .^linspace(1, 25, 25)



// B
// 1

function r = f(x)
    r = (1 + x) .* sin(%pi .* x)
endfunction
x = linspace(-2, 2, 100)
y = f(x)

fenetre = figure("Figure_name", "Equation", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

subplot(2, 2, 1);
plot2d(x', y', style=[color("black")])


// 2

function r = g(x)
    r = %pi .* x + %pi .* x^2
endfunction
x = linspace(-2, 2, 100)
y = g(x)

function r = P1(x)
    r = %pi .* x
endfunction
x = linspace(-2, 2, 100)
y = P1(x)

subplot(2, 2, 1);
plot2d(x', y', style=[color("blue")])

function r = P2(x)
    r = %pi .* x + %pi .* x^2
endfunction
x = linspace(-2, 2, 100)
y = P2(x)

subplot(2, 2, 1);
plot2d(x', y', style=[color("pink")])

// C
// 1

function r = G(t, y)
    r = (y./t) + t .* log(t)
endfunction
u = 1
a = 1
t = linspace( 1, 4, 100)
y = ode("rk", u, a, t, G)

fenetre2 = figure ("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre2.background = color("white");
set("current_figure", fenetre2);

subplot(2, 2, 1);
plot2d(t, y, style=[color("black")])

// 2

function r = G(t, y)
    r = (y./t) + t .* log(t)
endfunction
u = -2
a = 1
t = linspace( 1, 4, 100)
y = ode("rk", u, a, t, G)

fenetre3 = figure ("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre3.background = color("white");
set("current_figure", fenetre3);

subplot(2, 2, 1);
plot2d(t, y, style=[color("black")])


function r = G(t, y)
    r = (y./t) + t .* log(t)
endfunction
u = 2
a = 1
t = linspace( 1, 4, 100)
y = ode("rk", u, a, t, G)

subplot(2, 2, 1);
plot2d(t, y, style=[color("black")])
