function [X,Y,Z]=WGS2ECEF(phi,lambda,h)
format long
a=6378137;
b=6356752.314;
Rn=(a^2)/sqrt((a*cosd(phi))^2+(b*sind(phi))^2);
e=sqrt(1-(b^2/a^2));
X=(Rn+h)*cosd(phi)*cosd(lambda);
Y=(Rn+h)*cosd(phi)*sind(lambda);
Z=((1-e^2)*Rn+h)*sind(phi);
return 