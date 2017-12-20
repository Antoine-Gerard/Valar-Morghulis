vo = zeros (1, 50)
v1 = 10*ones (1, 50)
v2 = 0:0.3:10
v5 = linspace (-3, 7, 50)
v6 = 1:1:25
    p = 2*ones (1, 25)
    p.^v6

function r = truc(x)
    r = (1+x) .* sin(%pi .* x)
endfunction
x = linspace (-2, 2, 100)
a = truc(x)
fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);
plot2d(x, a, style=[color("black")]);

function r = p1(x)
    r = %pi .* x
endfunction
b = p1(x)
function r = p2 (x)
    r = %pi .* x+ %pi .* x.^2
endfunction
c = p2(x)
plot2d(x, b, style=[color("blue")]);
plot2d(x, c, style=[color("pink")]);

function k =  G(t,y)
    k = y / t + t .* log(t)
endfunction
t = linspace (1, 4, 100)
y = ode("rk", 1, 1, t, G)
fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);
plot2d(t, y, style=[color("purple")]);

function k =  G(t,y)
    k = y / t + t .* log(t)
endfunction
t = linspace (1, 4, 100)
y = ode("rk", -2, 1, t, G)
plot2d(t, y, style=[color("red")]);


function k =  G(t,y)
    k = y / t + t .* log(t)
endfunction
t = linspace (1, 4, 100)
y = ode("rk", 2, 1, t, G)
plot2d(t, y, style=[color("green")]);
