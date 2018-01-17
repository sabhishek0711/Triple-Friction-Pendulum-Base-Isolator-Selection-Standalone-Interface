% import mlreportgen.dom.*;
% doc =Document('groupReport','docx');
% disclaimerHead = Heading(2,'Results May Vary');
% disclaimerIntro = Paragraph('The following results assume:');
% disclaimerList = UnorderedList(...
% {'Temperature between 30 and 70 degrees F',...
% 'Wind less than 20 MPH','Dry road conditions'});
% disclaimer = Group();
% append(disclaimer,disclaimerHead);
% append(disclaimer,disclaimerIntro);
% append(disclaimer,disclaimerList);
% append(doc,disclaimer);
% p1 = Paragraph('First set of results...');
% p1.Bold = true;
% p2 = Paragraph('more report content...');
% p2.Bold = true;
% append(doc,p1);
% append(doc,p2);
% append(doc,disclaimer);
% close(doc);
% rptview('groupReport','pdf');

% import mlreportgen.dom.*;
% d = Document('test','html');
% t = append(d, 'Bold Arial text');
% fontFamily = FontFamily('Arial');
% fontFamily.BackupFamilyNames = {'Helvetica'};
% t.Style = {fontFamily};
% t.Bold = true;
% close(d);
% rptview('test','html');

% import mlreportgen.dom.*;
% doc = Document('test','html');
% p = Paragraph('Indent a half inch and space after 12 points.');
% p.Style = {OuterMargin('3in','5in','2in','12pt')};
% %p.HAlign='center';
% append(doc,p);
% q = Paragraph('Centered paragraph');
% q.HAlign = 'center';
% append(doc,q);
% image=Image('SectionElevationTP.jpg');
% clone(image,p);
% append(doc,image);
% close(doc);
% rptview('test','html');

% image = ones([100 100]);
% imshow(image);

% image = rand([100 100]);
% imshow(image);
% 
% imshow(drawPolygon(ones(100,100), [10 10 ; 90 30 ;  90 90], 0.5));

% figure
% line([5,10],[1,1])

% A = rand(50);
% imwrite(A,'SectionElevationTP.jpg')


%%
% import mlreportgen.dom.*;
% t = Template('mytemplate');
% p = Paragraph('My Company');
% p.FontSize = '24';
% p.Color = 'DeepSkyBlue';
% p.Bold = true;
% p.HAlign = 'center';
% append(t,p);
% p = Paragraph;
% p.FontFamilyName = 'Arial';
% p.FontSize = '18pt';
% p.Bold = true;
% p.HAlign = 'center';
% append(p,TemplateHole('ReportTitle','Report Title'));
% append(t,p);
% close(t);
% rptview('mytemplate');

%%

%I=imread('SectionElevationTP.jpg');
% textColor    = [0 0 0];
% %% 
% textLocation = [300 20]; 
% textInserter = vision.TextInserter('ONE', 'Color', textColor, 'FontSize', 24, 'Location', textLocation);
% J = step(textInserter, I);
% imshow(J);

%%
%  import mlreportgen.dom.*;
% imgName =[pwd, '\SectionElevationTP.jpg'];
% 
% fileName = [pwd, '\TRIPLE PENDULUM BEARING_3.docx'];
% 
% wordApplication=actxserver('Word.Application');
% 
% % Define constants.
% 
% wdFormatDocument = 0;
% 
% %set(wordApplication,'Visible',1); % Great for debugging.
% 
% documents = wordApplication.Documents;
% 
% % Create a new document. 
% 
% documents.Add;
% 
% doc = documents.Item(documents.Count);
% 
% selection = wordApplication.Selection;
% 
% % add picture
% 
% selection.InlineShapes.AddPicture(imgName);  % absolute path to the image
% 
% selection.TypeParagraph;
% 
% selection.TypeParagraph;
% 
% % save and close
% 
% doc.saveas(fileName,wdFormatDocument);
% 
% doc.Close(0);
% 
% wordApplication.Quit


%%
% import mlreportgen.dom.*;
% doc=Document('TRIPLE PENDULUM BEARING_3','docx','mytemplate_3');
% p=Paragraph();
% append(doc,p);
% I=Image('road_dwg.jpg');
% Image.Style = {Height('4in')};
% out=num2str(I);
% append(p,I);
% while ~strcmp(doc.CurrentHoleId, '#end#')
%     append(doc,out);
%     moveToNextHole(doc);
% end
% close(doc);
% rptview('TRIPLE PENDULUM BEARING_3.docx');
% 
% %%
% h = text(0.5,0.5,'text here');
% s = h.FontSize;
% h.FontSize = 12;

%%
% figure;
% x = linspace(0,10);
% y = x.^2;
% plot(x,y,'b+-');
% hold on;

%plot(x(50),y(50),'--rs','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',5);

%%
%figure
% plot([1:5],[1:5]*3,'.-')
% %// Say I want to put an arrow pointing to the location, [3 9]    
% text(2.94,8.3,'\uparrow','fontsize',80)
% text(2.8,7.8,'point [3,9]')
% x=1;
% y=1;
% u=3;
% v=4;
% quiver(x,y,v,u,0);
% 
% %%
% figure;
% plot(5,5,'o');
% hold on
% quiver(5-4,5-4,4,4);

%circle = plot:Circle2d(3, [0,0]);
% arc = plot:Arc2d(3, [0, 0], [0 pi/4]);
% plot(arc)

% t = linspace(0,pi/4);
% plot(cos(t),sin(t))

% plot(0,0,'o','MarkerSize',452.4)

%%
%h = figure('Units','inches','Position',[1.525 .031 10.333 5.781]);
%h = figure;
% %h.PositionMode = 'manual';
% h.Units = 'inches';
% h.Position = [1.525 .031 10.333 5.781];
% x = 0:.05:1;
% y = x;
% plot(x,y);
% axis square;
% h.Units = 'inches';
% h.Position = [1.525 .031 10.333 5.781];
% set(h, 'Units', 'inches');
% set(h,'Position',[1.525 .031 10.333 5.781])

%%

% rptview('client_spectra_input.xlsx');
% A = xlsread('client_spectra_input.xlsx');
% x = A(:,1);
% y = A(:,3);
% yi = interp1q(x,y,1.47);

%%
h = openfig('CROPTEST_plan.fig');
set(h,'PaperPositionMode','auto');
saveas(h,'CROPTEST.jpg')
A=imread('CROPTEST.jpg');
%B = imresize(A, [600 800]);
C = imcrop(A, [600, 150, 900, 680]);
%D = imcrop(C, [0,0, 1010, 1975]);
%B = imresize(C, [425 1010]);
imwrite(C,'CROPTEST.jpg');







