// Fichier TD1 Herbouille
clear

// EXO 1 
// Déf du vecteur vo 
zeros(50, 1)
VO = ones (1, 50)

// Def du vecteur v1
V1 = 10*ones(50, 1)

// Def du vecteur v2
V2 = 0:0.3:10

//Def du vecteur v5
V5 = linspace(-3,7, 10)


// EXO 2
// Partie 1
function r = truc (x)
    r = (1 + x).*sin(%pi *x)
    endfunction
x = linspace ( -2 , 2, 100)
//fenetre = figure("Figure_name"), "Mon premier tracé", "position", [100 50 1000 600]);
//fenetre.background = color("aliceblue");
//set("current_figure", fenetre); 
plot2d(x, truc(x), style=[color("forestgreen")]);

// Partie 2
function P1 = P1 (x) 
    P1 = (%pi.*x)
endfunction
plot2d (x, P1 (x), style=[color("green")]);

function P2 = P2 (x)
    P2 = (%pi.*x) + (%pi.*x^2)
endfunction
plot2d (x, P2 (x), style=[color("blue")]);

//EXO 3
fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("white");
set("current_figure", fenetre);

function v = G(t, y)
    v = (y .∕t) + t.*log(t)
endfunction

 a = 1
 t = linspace (1, 4, 100)
 u = 1
y = ode ("rk", u, a, t, G)
plot2d(t, y, style=[color("black")]);

function v = G(t, y)
    v = (y .∕t) + t.*log(t)
endfunction

 a = 1
 t = linspace (1, 4, 100)
 u = -2
y = ode ("rk", u, a, t, G)
plot2d(t, y, style=[color("black")]);






