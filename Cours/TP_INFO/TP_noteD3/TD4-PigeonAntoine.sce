//TD4-PigeonAntoine.sce

v0=zeros(1, 50)
v1=10.* ones(1, 50)
v2=0:0.3:10
v5=linspace(-3, 7, 50)
r= 2.* ones(1, 25)
v= linspace(1, 25, 25)
v6= r.^ v

x=linspace(-2,2,100)

function r=f(x)
    r=(1+x).* sin(%pi.* x)
endfunction
y=f(x)

fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

plot2d(x,y, style=[color("forestgreen")]);

function r=P1(x)
    r=%pi.* x
endfunction
y1=P1(x)

function r=P2(x)
    r=%pi.* x+%pi.* x.^ 2
endfunction
y2=P2(x)

plot2d(x,y1, style=[color("blue")]);

plot2d(x,y2, style=[color("red")]);


t=linspace(1, 4, 100)
function r=G(t,y)
    r=y ./ t+t .* log(t)
endfunction

u = 1
a = 1
y=ode("rk", u, a, t, G)

fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

subplot(2, 2, 1);
plot2d(t, y, style=[color("black")]);

coor = get("current_axes");
coor.y_location = "origin";

for u = [-2 1 2]
y = ode("rk", u, a, t, G)
plot2d(t, y, style=[color("black")]);
end;


