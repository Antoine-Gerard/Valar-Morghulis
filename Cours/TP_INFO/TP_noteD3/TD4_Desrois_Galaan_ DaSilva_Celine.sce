
//Da Silva Céline
//Desrois Galaan 
clear();
// Efface les variable entre deux exécutions
xdel(winsid()); // Détruit les fenêtres graphiques entre deux exécutions
format(20);
// Définit le format d’affichage des nombres réels

//PARTIE A 
v0= zeros(1,50) // v(0)
v1 = 10.*ones(1, 50) 
v2 = 0:0.3:9.9
v5= linspace(-3,7,50)




// PARTIE B
function r = truc(x)
    r = (1 + x).*sin(%pi.*x);
    
endfunction

function z = p1(x)
    z = x.*%pi;
endfunction

function s = p2(x)
    s = x.*%pi + %pi.*x.^2
endfunction
x = linspace(-2, 2, 100);


xdel(winsid()); // détruit les fenêtres graphiques entre deux exécutions
fenetre = figure("Figure_name", "Fonction", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);
coor = get("current_axes");
coor.y_location = "origin";
y= truc(x);
y2= p1(x);
y3= p2(x);
//subplot(2, 2, 1);
plot2d(x, y, style=[color("black")]);
plot2d(x, y2, style=[color("blue")]);
plot2d(x, y3, style=[color("red")]);


//PARTIE C
function v = final(t,y)
    v = (y/t)+t.*log(t);
endfunction
t = linspace(1,4,100)
y = ode("rk", 1, 1, t, final);

fenetre = figure("Figure_name", "Equation", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

coor = get("current_axes");
coor.y_location = "origin";
subplot(2, 2, 1);
plot2d(t, y, style=[color("black")])


yI = ode("rk", -2, 1, t, final);
plot2d(t, yI, style=[color("blue")])

yII = ode("rk", 2, 1, t, final);
plot2d(t, yII, style=[color("red")])


