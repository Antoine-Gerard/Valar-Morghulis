//Dubernet Camille
//Gabrielli Tiphaine
zeros(1,50)
10.*ones(1, 50)
z = 0:0.3:10
linspace (-3,7,50)
v = (2.*ones(1, 25)).^linspace(1, 25, 25)
function r = f(x)
    r =(1+x).*(sin(%pi.*x))
endfunction
x = linspace(-2,2,100)
fenetre = figure("Figure_name", "Equations", "Position", [100 50 1000 600]);
fenetre.background =color("white");
set("current_figure", fenetre);
subplot(2, 2, 1);
plot2d(x', f(x)', style=[color("black")]);
function r = P1(x)
    r = %pi.*x
endfunction
fenetre.background =color("white");
set("current_figure", fenetre);
plot2d(x', P1(x)', style=[color("blue")]);
function r = P2(x)
    r = %pi.*x+%pi.*x.^2
endfunction
fenetre.background =color("white");
set("current_figure", fenetre);
plot2d(x', P2(x)', style=[color("red")]);
function r =G(t, y)
    r = (y./t)+t.*log(t)
endfunction
t = linspace (1, 4, 100)
u = 1
a = 1
y = ode("rk", u, a, t, G)
fenetre = figure("Figure_name", "Equations", "Position", [100 50 1000 600]);
fenetre.background =color("white");
set("current_figure", fenetre);
subplot(2, 2, 1);
plot2d(t', y', style=[color("black")]);
function r = G2(t,y)
    r =(y./t)+t.*log(t)
endfunction
t = linspace (1, 4, 100)
u = -2
a = 1
y = ode("rk", u, a, t, G)
set("current_figure", fenetre);
plot2d(t', y', style=[color("purple")]);
function r = G3(t,y)
    r =(y./t)+t.*log(t)
endfunction
t = linspace (1, 4, 100)
u = 2
a = 1
y = ode("rk", u, a, t, G)
set("current_figure", fenetre);
plot2d(t', y', style=[color("pink")]);
