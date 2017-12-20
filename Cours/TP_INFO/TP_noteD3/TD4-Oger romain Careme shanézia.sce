//Oger romain Careme Shanézia
//A)
clc
xdel(winsid())
v0=zeros(1,50)
v1= 10.*ones(1,50)
v2= 0:0.3:10
v5=-3:0.2:7
v6= 25.*(2,2,2).^(2.2.2)
//B.1)
function r = f(x)
    r=(1+x).*sin(%pi.*x)
endfunction
x=linspace(-2,2,100)
y= f(x)
fenetre = figure("Figure_name", "fonction f", "position", [100 50 1000 600])
fenetre.background = color("white")
set("current_figure", fenetre)
subplot(2, 2, 1)
plot2d(x' ,y' , style=[color("black")])
//B.2)
function r2 =p1(x)
       r2 = %pi.*x
endfunction
plot2d(x,p1(x), style=[color("blue")])
function r3 =p2(x)
    r3=%pi.*x+%pi.*x^2
    endfunction
plot2d(x,p2(x), style=[color("green")])

//C.1)
function r4=G(t,y)
    r4=y/t+t.*log(t)
endfunction
a=1
t=linspace(1,4,100)
u=1
y = ode("rk", u, a, t, G)
subplot(2, 2, 2)
plot2d(t', y', style=[color("black")])

//C.2)
for u = [-2 2]
y = ode("rk", u, a, t, G)
plot2d(t', y', style=[color("black")])
end;
