function [p,D,Shear,Teff,Damping,Keff]=DisplacementDemandCalc(p5, Rvec, dvec, Hvec, muvec, S, SiteSpectra)

      % S: changes depending on DBE or MCE    

      % An arbitary value
      Dispdemand=p5(6,1);
      
      % Acceleration due to gravity (in/sec^2)
      g = 386.4;
      
      % Calling the function to carry out the Hysteresis loop.
      p=DemandHysteresisLoopGenerator(p5, Dispdemand, Rvec, dvec, Hvec, muvec);
      
      % Length of 'p' vector
      L=length(p(:,1));
      
      % Area enclosed by the hysteresis loop
      
      if L > 7
      A = polyarea(p(4:L,1),p(4:L,2));
      else
      A = polyarea(p(3:L,1),p(3:L,2));
      end
      
      % effective Stiffness
      keff = max(p(:,2))/max(p(:,1));
      
      % damping ratio 
      eta = A / (2*pi*keff*max(p(:,1))^2);
      
      % Average Friction coeff
      mu_avg = A / (4*max(p(:,1)));
      
      % Effective Period of the Isolator
      Teff = 2*pi*sqrt(1/(keff*g));
      
      % Specta modification factor (ASCE 7-10 AASHTO Eq) due to damping
      spectra_mod_factor = (eta/0.05)^0.3;
      
      % Spectral displacement
      if sum(SiteSpectra(:,1)) == 0
         Sd_spectra = S*g*Teff/(4*(pi^2)*spectra_mod_factor);
      else
          Sa = interp1q(SiteSpectra(:,1),SiteSpectra(:,2),Teff);
          Sd_spectra = Sa*g*(Teff^2)/(4*(pi^2)*spectra_mod_factor);
      end
      
      r = Sd_spectra / Dispdemand;
      %r1 = (4*pi^2/Teff*max(p(:,1)))/max(p(:,2));
           
      if r > 1
         
         p= [0 0];  
      
      else
      
           while ~(r >= 0.95 && r <= 1)
               
               if Sd_spectra < p5(6,1) 

                    Dispdemand = Sd_spectra;
                    p = DemandHysteresisLoopGenerator(p5, Dispdemand, Rvec, dvec, Hvec, muvec);
                    L = length(p(:,1));

                    if L > 7
                     A = polyarea(p(4:L,1),p(4:L,2));
                    else
                     A = polyarea(p(3:L,1),p(3:L,2));
                    end

                    keff = max(p(:,2))/max(p(:,1));
                    eta = A / (2*pi*keff*max(p(:,1))^2);
                    Teff = 2*pi*sqrt(1/(keff*g));
                    spectra_mod_factor = (eta/0.05)^0.3;
                    if sum(SiteSpectra(:,1)) == 0
                       Sd_spectra = S*g*Teff/(4*(pi^2)*spectra_mod_factor);
                    else
                       Sa = interp1q(SiteSpectra(:,1),SiteSpectra(:,2),Teff);
                       Sd_spectra = Sa*g*(Teff^2)/(4*(pi^2)*spectra_mod_factor);
                   end
                    r = Sd_spectra / Dispdemand ;
               else
                     break;                  
               end
          end
      end 
      
      if (1.1*Dispdemand) > p5(7,1)
          
          Dispdemand = p5(7.1)/1.1;
          p = DemandHysteresisLoopGenerator(p5, Dispdemand, Rvec, dvec, Hvec, muvec);
          L = length(p(:,1));

           if L > 7
              A = polyarea(p(4:L,1),p(4:L,2));
           else
              A = polyarea(p(3:L,1),p(3:L,2));
           end

              keff = max(p(:,2))/max(p(:,1));
              eta = A / (2*pi*keff*max(p(:,1))^2);
              Teff = 2*pi*sqrt(1/(keff*g));
      end
      
      
      % Output variables of this function
      
      D = max(p(:,1));
      Shear = max(p(:,2));
      Damping = eta;
      Keff = keff;
      
 end