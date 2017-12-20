%%% 20 décimales
format long


%%% Utilisation de la fonction rectangle gauche

resG = rectangle_gauche(@f, 0, 1, 200000);

%%% Utilisation de la fonction rectangle droite
resD = rectangle_droite(@f, 0, 1, 20);

%%% Calcul de l'erreur avec n = 20, 500, 10000
for n=[20,500,10000]
res = rectangle_gauche(@f, 0, 1, n);
end

%%% Encadrement de M
M = [];
maj = [];
i = 1;
for n = [20, 500, 10000]
C = 1 / (2*(n-1));
x = linspace(0 , 1, n);
M = [M;max(abs(dfdx(x)))];
maj = [maj; M(i) * C];
i = i+1;
end

%%% Méthode des trapèzes. 
for n=[20,500,10000]
res = trapeze(@f, 0, 1, n);
res2 = trapeze2(@f, 0, 1, n);
end

%%% Encadrement de M
M = [];
maj = [];
i = 1;
for n = [20, 500, 10000]
C = 1 / (12*(n-1)^2);
x = linspace(0 , 1, n);
M = [M;max(abs(d2fdx2(x)))];
maj = [maj; M(i) * C];
i = i+1;
end

%%% Méthode de Simpson
err = []; h = [];
n = 20;
for i = 1:3
h = [h; 1./(n-1)];
res = simpson(@f, 0, 1, n);
k = abs(res - pi);
err = [err; k];
n = 2*n;
end

%% Exact au degré 3
P = @(t) 4*t.^3 - 3*t.^2 + 1;

res = simpson(P, 1, 2, 7); 


%% Boucle remplissage vecteur
n = 10;
a = zeros(n,1);
a(1) =  5;
for i=1:n-1
    a(i+1) = 3/4 * a(i) + i - 2;
end;


prim = primi(@f, 0, 1, 100);
