//CARRETTE Kathlyn
//BREGERE Anastasia

v0=zeros(1, 50)
v1=10*ones(1, 50)
v2=[0:0.3:10]
v5=[-3:0.204:7]


function r=fnct(x)
    r= (1+x).*sin(%pi.*x)
endfunction
x=linspace(-2,2,100)
y=fnct(x)

plot2d(y, style=[color("pink")]);
plot2d(x, style=[color("green")]);

plot2d(%pi.*x+%pi.*x^2, style=[color("red")]);
plot2d(%pi.*x, style=[color("blue")]);

function r=funk(t,y)
    r=(y./t+t.*log(t))
endfunction
u=1
a=1
t=linspace(1,4,100)
ode("rk",u, a, t, funk)
plot2d(ode("rk",u, a, t, funk), style=[color("grey")]);

function r=truc(t,y)
    r=(y./t+t.*log(t))
endfunction
u=-2
a=1
t=linspace(1,4,100)
ode("rk",u, a, t, truc)
plot2d(ode("rk",u, a, t, truc)), style=[color("black")]);

function r=la(t,y)
    r=(y./t+t.*log(t))
endfunction
u=2
a=1
t=linspace(1,4,100)
ode("rk",u, a, t, la)
plot2d(ode("rk",u, a, t, la)), style=[color("brown")]);
