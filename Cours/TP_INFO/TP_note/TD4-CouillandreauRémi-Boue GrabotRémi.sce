//Boue-Grabot
//Couillandreau

//A)

//V0
zeros(5, 10)

//V1
10*ones(5, 10)

//V2
z = 0:0.3:10

//V5
linspace(-3, 7,50)

//V6
a = 2*ones(1, 25)
b = 1:1:25
a.^b

//B) 

//1.
function y=f(x)
    y=(1+x).*sin((%pi)*x)
endfunction
x = linspace(-2, 2, 100)
y = f(x)

xdel(winsid());
fenetre = figure("Figure_name", "Tracé de la fonction", "position", [100 50 1000 600]);
fenetre.background = color("aliceblue");
set("current_figure",fenetre);

plot2d(x , y, style=[color("forestgreen")]);

//2.
function r = P1(x)
    r=(%pi)*x
endfunction
function t = P2(x)
    t=[(%pi)*x]+[(%pi)*x.^2]
endfunction

plot2d(x , P1(x), style=[color("blue")]);
plot2d(x , P2(x), style=[color("red")]);

//C)

//1.
function p = G(t, y)
   p =  y./t+t.*log(t)
endfunction
u=1
a=1
t=linspace(1,4,100)
y = ode("rk", u, a, t, G)

fenetre = figure("Figure_name", "Equation", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

plot2d(t, y, style=[color("pink")]);

//2.
y1 = ode("rk", -2, a, t, G)
plot2d(t, y1, style=[color("blue")]);

y2 = ode("rk", 2, a, t, G)
plot2d(t, y2, style=[color("red")]);



