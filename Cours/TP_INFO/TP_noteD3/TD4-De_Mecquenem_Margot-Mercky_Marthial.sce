// De Mecquenem Margot
// Mercky Marthial

// A
vo = zeros(1, 50)
v1 = ones(1, 50)*10
v2 = 0:0.3:10
v5 = linspace(-3, 7, 50)
v6 = (2).^(1:25)

//B

// 1
function r = f(x)
    r = (1+x).*sin(%pi*x);
endfunction
x = linspace(-2, 2, 100)
u = 0.5
a = 0
y = f(x)
fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);
subplot(2, 2, 1);
plot2d(x, y, style=[color("black")]);

// 2
function r = P1(x)
    r = %pi*x;
endfunction
y = P1(x)
plot2d(x, y, style=[color("blue")])

function r = P2(x)
    r = %pi*x+%pi*x^2;
endfunction
y = P2(x)
plot2d(x, y, style=[color("red")])



// C

// 1
function r = G(t, y)
    r = (y/t)+t*log(t)
endfunction
t = linspace(1, 4, 100)
u = 1
a = 1
y = ode("rk", u, a, t, G)
fenetre2 = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre2.background = color("white");
set("current_figure", fenetre2);
subplot(2, 2, 1);
plot2d(t', y', style=[color("brown")]);

// 2
u = -2
a = 1
y = ode("rk", u, a, t, G)
plot2d(t', y', style=[color("red")]);

u = 2
a = 1
y = ode("rk", u, a, t, G)
plot2d(t', y', style=[color("aquamarine")])
