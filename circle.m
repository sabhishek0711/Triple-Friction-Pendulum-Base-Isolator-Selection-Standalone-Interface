function circle(center, radius, str)

  x = (center(1) - radius):0.01:(center(1) + radius);
  y = sqrt(radius^2 - (x - center(1)).^2) + center(2);
  plot(x,y,str);
  plot(x,-y,str);

end