function mytemplate_7_generator(temp1,temp2,temp3,I,friction,L,D,Shear,Teff,Damping,Keff,unit,K,unit1)

% Report Generation and Hole filling in MS Word Template_7
import mlreportgen.dom.*;
doc=Document('TRIPLE PENDULUM BEARING_7','docx','mytemplate_7');
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
        case 'picture'
            append(doc,I);
        case '1'
          str = mat2str(friction(1,1),3);  
         append(doc,str);   
        case '2'
         str = mat2str(friction(2,1),3);  
         append(doc,str);  
        case '3'
         str = mat2str(friction(3,1),3);  
         append(doc,str);   
        case '4'
         str = mat2str(friction(1,2),3);  
         append(doc,str);    
        case '5'
         str = mat2str(friction(2,2),3);  
         append(doc,str);     
        case '6'
         str = mat2str(friction(3,2),3);  
         append(doc,str);   
        case '7'
         str = mat2str(friction(1,3),3);  
         append(doc,str);   
        case '8'
         str = mat2str(friction(2,3),3);  
         append(doc,str);  
        case '9'
         str = mat2str(friction(3,3),3);  
         append(doc,str);   
        case '10'
         str = mat2str(L(1)*K,3);  
         append(doc,strcat(str,unit));   
        case '11'
         str = mat2str(L(2)*K,3);  
         append(doc,strcat(str,unit));   
        case '12'
         str = mat2str(L(3)*K,3);  
         append(doc,strcat(str,unit));    
        case '19'
         str = mat2str(D(1)*K,3);  
         append(doc,strcat(str,unit)); 
        case '20'
         str = mat2str(D(2)*K,3);  
         append(doc,strcat(str,unit));  
        case '21'
         str = mat2str(D(3)*K,3);  
         append(doc,strcat(str,unit)); 
        case '22'
         str = mat2str(Shear(1),3);  
         append(doc,str);
        case '23'
         str = mat2str(Shear(2),3);  
         append(doc,str);
        case '24'
         str = mat2str(Shear(3),3);  
         append(doc,str);
        case '25'
         str = mat2str(Teff(1),3);  
         append(doc,str);
        case '26'
         str = mat2str(Teff(2),3);  
         append(doc,str);
        case '27'
         str = mat2str(Teff(3),3);  
         append(doc,str);
        case '28'
         str = mat2str(Damping(1),3);  
         append(doc,str);
        case '29'
         str = mat2str(Damping(2),3);  
         append(doc,str);
        case '30'
         str = mat2str(Damping(3),3);  
         append(doc,str);
        case '31'
         str = num2str(Keff(1)/K,3);   
         append(doc,strcat(str,''));
        case '32'
         str = num2str(Keff(2)/K,3);   
         append(doc,strcat(str,''));
        case '33'
         str = num2str(Keff(3)/K,3);   
         append(doc,strcat(str,''));
        case 'unit1'
         append(doc,unit1);
         
    end
    moveToNextHole(doc);
end
close(doc);
%rptview('TRIPLE PENDULUM BEARING_7.docx');
end

