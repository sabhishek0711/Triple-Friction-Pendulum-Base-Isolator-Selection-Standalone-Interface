function mytemplate_9_generator(temp1,temp2,temp3,dsi, dsc_outer, tc, tb, teff, fc, Fbu, Mu, b1, ratio, r, Mus, Muext, Pu, Pallbuild, Pallbridge, Area, Pusi60, Pysi40, Pall_build, Pall_bridge, CF, K, K_ksi_conv, wt_conv, unit1, p_unit, wt_unit1) 

import mlreportgen.dom.*
doc=Document('TRIPLE PENDULUM BEARING_9','docx','mytemplate_9');
    while ~strcmp(doc.CurrentHoleId, '#end#')
        switch doc.CurrentHoleId
            
            case 'OC'
                str1=mat2str(temp1(1),3);
                str2=mat2str(temp1(2),2);
                append(doc,strcat('FPT',str1,str2));
            case 'SC1'
                str1=mat2str(temp2(1));
                append(doc,str1);
            case 'SC2'
                str1=mat2str(temp2(2));
                append(doc,str1);
            case 'IS1'
                str1=mat2str(temp3(1));
                append(doc,str1);
            case 'IS2'
                str1=mat2str(temp3(2));
                append(doc,str1);
            
            case '1'
                str = num2str(dsc_outer*K,2);
                append(doc,str);
                
            case '2'
                
                str = num2str(tc*K,2);
                append(doc,str);
                
            case '3'
                
                str = num2str(tb*K,2);
                append(doc,str);
                
            case '4'
                
                str = num2str(teff*K,2);
                append(doc,str);
                
            case '5'
                
                str = num2str(fc*K_ksi_conv,2);
                append(doc,str);
                
            case '6'
               
                str = num2str(Fbu(1)*K_ksi_conv,2);
                append(doc,str);
                
            case '7'
                
                str = num2str(b1(1)*K,2);
                append(doc,str);
                
            case '8'
                
                str = num2str(r(1)*K,2);
                append(doc,str);
                
            case '30'
                
                str = num2str(Mu(1)*wt_conv*K,2);
                append(doc,str);
                
            case '9'
                
                str = num2str(Mus(1)*wt_conv*K,2);
                append(doc,str);
                
            case '10'
                
                str = num2str(Muext(1)*wt_conv*K,2);
                append(doc,str);
                
            case '31'
                
                str = num2str(ratio(1),2);
                append(doc,str);
                
            case '32'
                
                str = num2str(CF(1),2);
                append(doc,str);
                
            case '11'
                
                str = num2str(Pu(1)*wt_conv,2);
                append(doc,str);
                
            case '12'
                
                str = num2str(Pallbuild(1)*wt_conv,2);
                append(doc,str);
                
            case '13'
                
                str = num2str(Pallbridge(1)*wt_conv,2);
                append(doc,str);
                
            case '17'
                
                str = num2str(Fbu(2)*K_ksi_conv,2);
                append(doc,str);
                
            case '18'
                
               str = num2str(Mu(2)*wt_conv*K,2);
                append(doc,str); 
                
            case '19'
                
                str = num2str(b1(2)*K,2);
                append(doc,str);
                
            case '20'
                
                str = num2str(r(2),2);
                append(doc,str);
                
            case '21'
                
                str = num2str(Mus(2)*wt_conv*K,2);
                append(doc,str);
                
            case '22'
                
                str = num2str(ratio(2),2);
                append(doc,str);
                
            case '23'
                
                str = num2str(CF(2),2);
                append(doc,str);
                
            case '33'
                
                str = num2str(Muext(2)*wt_conv*K,2);
                append(doc,str);
                
            case '34'
                
                str = num2str(Pu(2)*wt_conv,2);
                append(doc,str);
                
            case '24'
                
                str = num2str(dsi*K,2);
                append(doc,str);
                
            case '25'
                
                str = num2str(Area*K^2,2);
                append(doc,str);
                
            case '26'
                
                str = num2str(Pusi60*wt_conv,2);
                append(doc,str);
                
            case '27'
                
                str = num2str(Pysi40*wt_conv,2);
                append(doc,str);
                
            case '28'
                
                str = num2str(Pall_build*wt_conv,2);
                append(doc,str);
                
            case '29'
            
                str = num2str(Pall_bridge*wt_conv,2);
                append(doc,str);
            
            case '35'
                append(doc,unit1);
            case '36'
                append(doc,p_unit);
            case '37'
                append(doc,wt_unit1);
                
            
        end
       moveToNextHole(doc);
    end
    
    
close(doc);
%rptview('TRIPLE PENDULUM BEARING_9.docx');   

end

