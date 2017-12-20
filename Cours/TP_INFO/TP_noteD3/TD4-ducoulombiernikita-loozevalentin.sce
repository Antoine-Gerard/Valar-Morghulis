//Ducoulombier Nikita
//Looze Valentin

//clear

v0 = zeros(1, 50);

v1 = 10 .* ones(1, 50);

v2 = 0:0.3:10;

v5 = linspace(-3, 7, 50);

r = 2 .* ones(1, 25)

v = linspace(1, 25, 25)

v6 = r .^ v

x = linspace(-2, 2, 100);

function f= truc(x)
    truc = (1+x) .* sin(%pi .* x)
endfunction

y = ((1+x) .* sin(%pi .* x));

xdel(winsid()); // détruit les fenêtres graphiques entre deux exécutions
fenetre = figure("Figure_name", "Mon premier tracé", "position", [100 50 1000 600])
fenetre.background = color("aliceblue")
set("current_figure", fenetre)

plot2d(x', y', style=[color("forestgreen")])

function P1= truc1(x)
    P1 = %pi .* x
endfunction

y1 =  (%pi .* x);

function P2= truc2(x)
    P2 = (%pi .* x) + (%pi .* (x .^ 2))
endfunction

y2 = (%pi .* x) + (%pi .* (x .^ 2));

plot2d(x, y1, style=[color("blue")]);
plot2d(x, y2, style=[color("red")]);

function  P3 = truc3(t, y)
    P3 = ((y ./ t) + t) .* log(t)
endfunction

t = linspace(1, 4, 100);
a = 1

coor = get("current_axes");
coor.y_location = "origin";

for u = [-2 1 2]
y3 = ode("rk", u, a, t, truc3);
plot2d(t, y3, style=[color("black")]);
end;
