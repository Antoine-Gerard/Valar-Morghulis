//Fichier TD4-BallionMarie-Charlotte-BrossonCéline.sce
//Ballion Marie-Charlotte
//Brosson Céline
clear


//EXERCICE A
v0 = zeros(1,50)
v1 = 10*ones(1,50)
v2 = 0:0.3:10
v5 = linspace(-3,7,50)
v6 = (2).^(1:25)


//EXERCICE B
function r= f(x)
    r=(1+x).*sin(%pi.*x)
endfunction
 x=linspace(-2,2)
 y=f(x)
 fenetre=figure("Figure_name", "Equations", "position", [100 50 1000 600]);
 fenetre.background=color("white");
 set("current_figure", fenetre);
 plot2d(x',y',style=[color("black")]);
 function truc = P1(x)
     truc = %pi.*x
endfunction
y=P1(x)
plot2d(x',y',style=[color("blue")]);
function machin=P2(x)
    machin=%pi.*x + %pi.*x.^2
endfunction
y=P2(x)
plot2d(x',y',style=[color("green")]);


//EXERCICE C
function chouette=G(t,y)
    chouette= (y./t)+ t.*log(t)
endfunction
u=1
a=1
t=linspace(1,4,100)
y=ode("rk",u,a,t,G)
subplot(2,2,1);
plot2d(t',y', style=[color("pink")]);
u=-2
y=ode("rk",u,a,t,G)
subplot(2,2,1);
plot2d(t',y', style=[color("grey")]);
u=2
y=ode("rk",u,a,t,G)
subplot(2,2,1);
plot2d(t',y', style=[color("red")]);

