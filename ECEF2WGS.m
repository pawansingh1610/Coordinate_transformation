function cord = ECEF2WGS(X,Y,Z)
a=6378137;
b=6356752.314;
e=sqrt(1-(b^2/a^2));
lambda=atand(Y/X);
R=sqrt(X^2+Y^2+Z^2);
P=sqrt(X^2+Y^2);
phio=atand(Z/(P*(1-e^2)));
Rn=(a^2)/sqrt((a*cosd(phio))^2+(b*sind(phio))^2);
h=(P/cosd(phio))-Rn;
phi=atand((Z/P)*(1-(e^2*(Rn/(Rn+h))))^-1);
Rn=(a^2)/sqrt((a*cosd(phi))^2+(b*sind(phi))^2);
count=1;
error=abs(phi-phio);
while 1
    if error>10^-10 && count<1000
        phio=phi;
        Rn=(a^2)/sqrt((a*cosd(phio))^2+(b*sind(phio))^2);
        h=(P/cosd(phio))-Rn;
        phi=atand((Z/P)*(1-(e^2*(Rn/(Rn+h))))^-1);
        count=count+1;
        error=abs(phi-phio);
    else
        h=P/cosd(phi)-Rn;
        count=count+1;
        break
    end
end
count
long=lambda;
lat=phi;
h
return 
    