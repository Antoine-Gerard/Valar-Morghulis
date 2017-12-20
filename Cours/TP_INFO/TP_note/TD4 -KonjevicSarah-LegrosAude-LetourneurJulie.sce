//Konjevic Sarah
//Legros Aude
//Letourneur Julie

vo= zeros(5, 10)
v1= linspace(10, 10, 50)
v2= 0:0.3:10
v5= linspace(-3, 7, 50)
v6= 1:1:25
  p= 2.*ones(1, 25)
  p.^v6
  
function r= truc(x)
    r = (1+x).*sin(%pi.*x)
endfunction
x= linspace(-2, 2, 100)
y= truc(x)

fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

plot2d(x, y, style=[color("black")]);

function p2=Dl(x)
    p2 = %pi.*x+%pi.*x.^2
endfunction

plot2d(x, Dl(x), style=[color("red")]);

function p1=E(x)
    p1 = %pi.*x
endfunction

plot2d(x, E(x), style=[color("blue")]);

u = 1
a = 1
t = linspace(1, 4, 100)
function Y = machin(t,y)
    Y = ((y./t)+t.*log)
endfunction
Y = ode("rk", u, a, t, machin(t,y))

fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

plot2d(Y, y, style=[color("black")]);

u = -2
a = 1
t = linspace(1, 4, 100)
function Y = machin(t,y)
    Y = ((y./t)+t.*log)
endfunction
Y = ode("rk", u, a, t, machin(t,y))
plot2d(Y, y, style=[color("purple")]);

u = 2
a = 1
t = linspace(1, 4, 100)
function Y = machin(t,y)
    Y = ((y./t)+t.*log)
endfunction
Y = ode("rk", u, a, t, machin(t,y))
plot2d(Y, y, style=[color("pink")]);
