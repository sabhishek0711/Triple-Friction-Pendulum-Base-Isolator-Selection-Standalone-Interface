function mytemplate_8_generator(temp1, temp2, temp3, friction, Damping, L, D, p5, Teff, S, Bd, Shear, unit, K, unit1)

import mlreportgen.dom.*
doc=Document('TRIPLE PENDULUM BEARING_8','docx','mytemplate_8');
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
                str = num2str(friction(1,1),2);
                append(doc,str);

            case '2'

                str = num2str(friction(1,2),2);
                append(doc,str);

            case '3'

                str = num2str(friction(1,3),2);
                append(doc,str);

            case '4'

                str = num2str(friction(3,1),2);
                append(doc,str);

            case '5'
                str = num2str(friction(3,2),2);
                append(doc,str);

            case '6'

                str = num2str(friction(3,3),2);
                append(doc,str);

            case '7'

                str = num2str(friction(2,1),2);
                append(doc,str);

            case '8'

                str = num2str(friction(2,2),2);
                append(doc,str);

            case '9'

                str = num2str(friction(2,3),2);
                append(doc,str);

            case '10'

                str = num2str(L(1)*K,2);
                append(doc,str);

            case '11'

                str = num2str(L(2)*K,2);
                append(doc,str);

            case '12'

                str = num2str(L(3)*K,2);
                append(doc,str);

            case '13'

                str = num2str(D(1)*K,2);
                append(doc,str);

            case '14'

                str = num2str(Teff(1),2);
                append(doc,str);

            case '15'

                str = num2str(Shear(1),2);
                append(doc,str);

            case '16'

                str = num2str(Damping(1),2);
                append(doc,str);

            case '17'

                str = num2str(Bd(1),2);
                append(doc,str);

            case '18'

                str = num2str(Teff(1),2);
                append(doc,str);

            case '19'

                str = num2str(S(1)/Teff(1),2);
                append(doc,str);

            case '20'

                str = num2str(S(1)/(Teff(1)*Bd(1)),2);
                append(doc,str);

            case '21'

                str = num2str(Shear(1),2);
                append(doc,str);

            case '22'

                str = num2str(D(3)*K,2);
                append(doc,str);

            case '23'

                str = num2str(Teff(3),2);
                append(doc,str);

            case '24'

                str = num2str(Shear(3),2);
                append(doc,str);

            case '25'

                str = num2str(Damping(3),2);
                append(doc,str);

            case '26'

                str = num2str(Bd(3),2);
                append(doc,str);

            case '27'

                str = num2str(Teff(3),2);
                append(doc,str);

            case '28'

                str = num2str(S(3)/Teff(3),2);
                append(doc,str);

            case '29'

                str = num2str(S(3)/(Teff(3)*Bd(3)),2);
                append(doc,str);

            case '30'

                str = num2str(Shear(3),2);
                append(doc,str);

            case '31'

                str = num2str(D(2)*K,2);
                append(doc,str);

            case '32'

                str = num2str(Teff(2),2);
                append(doc,str);

            case '33'

                str = num2str(Shear(2),2);
                append(doc,str);

            case '34'

                str = num2str(Damping(2),2);
                append(doc,str);

            case '35'

                str = num2str(Bd(2),2);
                append(doc,str);

            case '36'

                str = num2str(Teff(2),2);
                append(doc,str);

            case '37'

                str = num2str(S(2)/Teff(2),2);
                append(doc,str);

            case '38'

                str = num2str(S(2)/(Teff(2)*Bd(2)),2);
                append(doc,str);

            case '39'

                str = num2str(Shear(2),2);
                append(doc,str);

            case '40'

                str = num2str(1.1*D(2)*K,2);
                append(doc,str);

            case '41'

                str = num2str(max(p5(:,1))*K,2);
                append(doc,str);

            case '42'

                str = num2str(1.1*0.9*D(2)*K,2);
                append(doc,str);

            case '43'

                str = num2str(1.1*0.9*D(2)*K,2);
                append(doc,str);

            case '44'

                str = num2str(max(p5(:,1))*K,2);
                append(doc,str);

            case '45'

                str = num2str(0.9*D(2)*K,2);
                append(doc,str);

            case '46'

                str = num2str(friction(1,1) + 0.005,2);
                append(doc,str);

            case '47'

                str = num2str(friction(1,2) + 0.005,2);
                append(doc,str);

            case '48'

                str = num2str(friction(1,3) + 0.005,2);
                append(doc,str);

            case '49'

                str = num2str(friction(2,1) + 0.005,2);
                append(doc,str);

            case '50'

                str = num2str(friction(2,2) + 0.005,2);
                append(doc,str);

            case '51'

                str = num2str(friction(2,3) + 0.005,2);
                append(doc,str);

            case '52'

                str = num2str(unit1,2);
                append(doc,str);

            case 'DBE/MCE'

                if S(3) == S(1)

                    append(doc,'DBE');
                else
                    append(doc,'MCE');                
                end

        end

    moveToNextHole(doc);
    end

close(doc);
%rptview('TRIPLE PENDULUM BEARING_8.docx');

end

