function arc(radius,pnt_start,pnt_end)

     x = pnt_start:0.01:pnt_end;
     y = sqrt(radius^2 - x.^2);
     
     plot(x,y,'k');
     plot(x,-y,'k');
     
end