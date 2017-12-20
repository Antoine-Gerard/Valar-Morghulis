//ROUHAUD Maïlys
//PENAUD Chloé
//vo= zeros (1,50)
//v1= 10*ones (1, 50)
//v2= z= 0:0.3:9.9
//v5= linspace (-3, 7, 50)

function r = truc(x)
r = (1 + x) .* sin(%pi .* x);
endfunction
x = linspace(-2, 2, 100);
y = truc(x);

plot2d(x,y,style=[color("pink")]);

function r=P1(x)
r=%pi.*x
endfunction
y1 = P1(x)


function r=P2(x)
r= %pi.*x+%pi.*x.^2
endfunction
y2 = P2(x)

plot2d(x,y2,style=[color("green")]);
plot2d(x,y1,style=[color("blue")]);

function f = G(t,y)
f=y./t+t.*log(t)
endfunction

x1 = linspace(1, 4, 100);
yn = ode("rk", 1, 1, x1, G)

fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);
plot2d(x1,yn,style=[color("purple")])

function f = G(t,y)
f=y./t+t.*log(t)
endfunction

x1 = linspace(1, 4, 100);
yn = ode("rk", -2, 1, x1, G)


plot2d(x1,yn,style=[color("red")])

function f = G(t,y)
f=y./t+t.*log(t)
endfunction

x1 = linspace(1, 4, 100);
yn = ode("rk", 2, 1, x1, G)


plot2d(x1,yn,style=[color("black")])


