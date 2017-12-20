// SAGE Nathan
//Esquire Killian
//A
V0 = zeros(1, 50)
V1 = 10 .*ones (1, 50)
V2 = 0:0.3:10
V5 = linspace (-3, 7 , 50)
V6 = 2.^(1:25)

//B
//1

function r = f(t)
    r = ( 1 + t ) .* ( sin( %pi .* t))
endfunction
x = linspace(-2, 2, 100);
y = f(x);
fenetre = figure("Figure_name", "Equations", "position",[-2 2 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);
plot2d(x,y, style=[color("black")])

//2

function m = P1(t)
    m = (%pi.*t)
endfunction
a = linspace(-2, 2, 100);
b = P1(a)
plot2d(a',b', style=[color("red")])
function d = P2(t)
    d = %pi.*t + %pi.*(t.^2)
endfunction
u = linspace(-2, 2, 100);
v = P2(u)
plot2d(u',v', style=[color("green")])

//C
//1


function a = L(t, y)
    a = (y ./ t) + t .* log(t)
endfunction
a = 1
u = 1
t = linspace(1, 4, 100);
fenetre = figure("Figure_name", "Equations", "position",[-2 2 1000 600]);
fenetre.background = color("white");
y = ode("rk", u, a, t, L)
plot2d(t,y, style=[color("blue")])

//2

function a = L(t, y)
    a = (y ./ t) + t .* log(t)
endfunction
a = 1
u = -2
t = linspace(1, 4, 100);
y = ode("rk", u, a, t, L)
plot2d(t,y, style=[color("yellow")])

function a = L(t, y)
    a = (y ./ t) + t .* log(t)
endfunction
a = 1
u = 2
t = linspace(1, 4, 100);
y = ode("rk", u, a, t, L)
plot2d(t,y, style=[color("grey")])
