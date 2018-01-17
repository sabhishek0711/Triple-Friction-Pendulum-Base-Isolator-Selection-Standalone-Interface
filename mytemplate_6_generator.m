function mytemplate_6_generator(temp1,temp2,temp3,Mass,W,Rot_inertia,Hvec,friction,rate,Rvec,D5,kv,k_m,Overall_units,unit_m)

import mlreportgen.dom.*
doc=Document('TRIPLE PENDULUM BEARING_6','docx','mytemplate_6');
while ~strcmp(doc.CurrentHoleId, '#end#')
    switch doc.CurrentHoleId
        case 'units'
            append(doc,Overall_units);
        case 'OC'
            str1=mat2str(temp1(1),3);
            str2=mat2str(temp1(2),2);
            append(doc,strcat('FPT ',str1,str2));
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
        case 'u'
            str = mat2str(0.05*k_m,3);
            append(doc,strcat(str,unit_m));
        case '1'
         str = num2str(Mass,3);   
         append(doc,str);   
        case '2'
         str = num2str(W,5);
         append(doc,str); 
        case '3'
         str = num2str(Rot_inertia,3);
         append(doc,str);    
        case '4'
          str = num2str(kv,5);
          append(doc,str);     
        case '5'
         str = num2str(Hvec(2)*k_m,3);
         append(doc,str);      
        case '6'
         str = num2str(Hvec(1)*k_m,3);
         append(doc,str);    
        case '7'
         str = num2str((2/3)*friction(1,2),3);
         append(doc,str);    
        case '8'
         str = num2str((2/3)*friction(1,3),3);
         append(doc,str);  
        case '9'
         str = num2str((2/3)*friction(1,1),3);
         append(doc,str);   
        case '10'
         str = num2str(friction(1,2),3);
         append(doc,str);    
        case '11'
         str = num2str(friction(1,3),3);
         append(doc,str);   
        case '12'
         str = num2str(friction(1,1),3);
         append(doc,str);   
        case '13'
         str = num2str((2/3)*friction(3,2),3);
         append(doc,str);   
        case '14'
         str = num2str((2/3)*friction(3,3),3);
         append(doc,str);   
        case '15'
         str = num2str((2/3)*friction(3,1),3);
         append(doc,str);
        case '16'
         str = num2str(friction(3,2),3);
         append(doc,str);
        case '17'
         str = num2str(friction(3,3),3);
         append(doc,str);
        case '18'
         str = num2str(friction(3,1),3);
         append(doc,str);
        case '19'
         str = num2str((2/3)*friction(2,2),3);
         append(doc,str);
        case '20'
         str = num2str((2/3)*friction(2,3),3);
         append(doc,str);
        case '21'
         str = num2str((2/3)*friction(2,1),3);
         append(doc,str);
        case '22'
         str = num2str(friction(2,2),3);
         append(doc,str);
        case '23'
         str = num2str(friction(2,3),3);
         append(doc,str);
        case '24'
         str = num2str(friction(2,1),3);
         append(doc,str);
        case '25'
         str = num2str(rate,3);
         append(doc,str);
        case '26'
         str = num2str(rate,3);
         append(doc,str); 
        case '27'
         str = num2str(rate,3);
         append(doc,str);
        case '28'
         str = num2str(Rvec(2)*k_m,3);
         append(doc,str);
        case '29'
         str = num2str(Rvec(2)*k_m,3);
         append(doc,str);
        case '30'
         str = num2str(Rvec(1)*k_m,3);
         append(doc,str);
        case '31'
         str = num2str(2*D5*k_m,3);
         append(doc,str); 
    end
    moveToNextHole(doc);
end
close(doc);
%rptview('TRIPLE PENDULUM BEARING_6.docx');
end