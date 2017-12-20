// Dréan Alexandre 
// Kuncik Victor 

//A
//V0
50*zeros(5,10)

//V1
10*ones(5,10)

//V2
0:0.3:10

//V5
linspace(-3, 7, 50)

//V6
//Va
Va=2*ones(1,25)
//Vb
Vb=1:1:25
//V6
Va.^Vb


//B
//1
function y=f(x)
    y=(1+x).*sin(x.*(%pi))
endfunction

x = linspace(-2, 2, 100)
y = f(x)

xdel(winsid()); // détruit les fenêtres graphiques entre deux exécutions
fenetre = figure("Figure_name", "Mon premier tracé", "position", [100 50 1000 600]);
fenetre.background = color("aliceblue");
set("current_figure", fenetre);

plot2d(x , y , style=[color("forestgreen")])
//2
function z=P1(x)
    z = %pi.*x
endfunction

function r=P2(x)
    r = %pi.*x + %pi.*x^2
endfunction

plot2d(x , P1(x), style=[color("blue")])
plot2d(x , P2(x) , style=[color("pink")])

//C
//1

function p = G(t, y)
    p = y./t + t.*log(t)
endfunction
u=1
a=1
t= linspace(1, 4, 100)
y= ode("rk",u, a, t, G)

fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

plot2d(t, y, style=[color("black")]);

//2
y1= ode("rk",-2, a, t, G)
plot2d(t, y1, style=[color("blue")]);

y2= ode("rk",2, a, t, G)
plot2d(t, y2, style=[color("red")]);



