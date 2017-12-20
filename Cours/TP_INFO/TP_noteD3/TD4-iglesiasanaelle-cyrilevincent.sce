//Iglesias Anaelle
//Cyrile Vincent


//Exercice 1//
clear
//VO
v0= zeros(1:50)
//V1
v1 =10*ones (1, 50)
//V2
v2= 0:0.3:10
//V5
v5= linspace(-3,7,50)
//V6
v6= (2).^(1:25)


//Exercice B//
function r = f(x)
r = (1 + x) .* sin(%pi.* x);
endfunction
x=linspace(-2,2,100)
y= f(x)
fenetre = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre.background = color("aliceblue");
set("current_figure", fenetre);
plot2d(x, y, style=[color("forestgreen")]);
function p=P1(x)
    p= %pi.*x
endfunction
plot2d(x, P1(x), style=[color("blue")]);
function m=P2(x)
    m=%pi.*x + %pi*x.^2
endfunction
plot2d(x, P2(x), style=[color("red")]);



//Exercice C//
fenetre2 = figure("Figure_name", "Equations", "position", [100 50 1000 600]);
fenetre2.background = color("aliceblue");
set("current_figure", fenetre2);
function b=G(t,y)
    b= (y./t)+t.*log(t)
endfunction
u=1
a=1
t=linspace(1,4,100)
y=ode("rk",u,a,t,G)
subplot(2,2,1);
plot2d(t',y', style = [color("black")]);

u=-2
a=1
t=linspace(1,4,100)
y=ode("rk",u,a,t,G)
subplot(2,2,1);
plot2d(t',y', style = [color("pink")]);

u=2
a=1
t=linspace(1,4,100)
y=ode("rk",u,a,t,G)
subplot(2,2,1);
plot2d(t',y', style = [color("green")]);




