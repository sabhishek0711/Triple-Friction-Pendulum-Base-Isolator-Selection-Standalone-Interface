function varargout = TripleFrictionPendulumGUI(varargin)
% TRIPLEFRICTIONPENDULUMGUI M-file for TripleFrictionPendulumGUI.fig
%      TRIPLEFRICTIONPENDULUMGUI, by itself, creates a new TRIPLEFRICTIONPENDULUMGUI or raises the existing
%      singleton*.
%
%      H = TRIPLEFRICTIONPENDULUMGUI returns the handle to a new TRIPLEFRICTIONPENDULUMGUI or the handle to
%      the existing singleton*.
%
%      TRIPLEFRICTIONPENDULUMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRIPLEFRICTIONPENDULUMGUI.M with the given input arguments.
%
%      TRIPLEFRICTIONPENDULUMGUI('Property','Value',...) creates a new TRIPLEFRICTIONPENDULUMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TripleFrictionPendulumGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TripleFrictionPendulumGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TripleFrictionPendulumGUI

% Last Modified by GUIDE v2.5 18-Aug-2015 11:06:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TripleFrictionPendulumGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TripleFrictionPendulumGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:}); 
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TripleFrictionPendulumGUI is made visible.
function TripleFrictionPendulumGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TripleFrictionPendulumGUI (see VARARGIN)

% Choose default command line output for TripleFrictionPendulumGUI

%loading the cell arrays for various parts
load('OuterConcave.mat');
load('SliderConcave.mat');
load('InnerSlider.mat');

% Putting the parts in the popup menu of the GUI
L1=length(OuterConcave(:,1));
L2=length(SliderConcave(:,1));
starter1=3;
starter2=2;
for i = 2:L2
    d = strsplit(char(SliderConcave(i,1)),'-156','CollapseDelimiters',true);
    C1(i-1) = cellstr(strcat(char(d(1)),'/',char(InnerSlider(i,1))));
end

empty={};
set(handles.OS,'String',OuterConcave(starter1:L1,1)); 
set(handles.SC,'String',SliderConcave(starter2:L2,1)); 
set(handles.IS,'String',empty);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes TripleFrictionPendulumGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TripleFrictionPendulumGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

varargout{1} = handles.output;

function QC_Callback(hObject, eventdata, handles)
% hObject    handle to QC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QC as text
%        str2double(get(hObject,'String')) returns contents of QC as a double


% --- Executes during object creation, after setting all properties.
function QC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in NewOuterConcave.
function NewOuterConcave_Callback(hObject, eventdata, handles)
% hObject    handle to NewOuterConcave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Control shifts from the current GUI to the other one and waits there
% untill told to return back
uiwait(partGUIOuterConcave); 

% Retrieves variables from the root directory
n1=getappdata(0,'n1value');
n2=getappdata(0,'n2value');
n3=getappdata(0,'n3value');
n4=getappdata(0,'n4value');
n5=getappdata(0,'n5value');
n6=getappdata(0,'n6value');
n7=getappdata(0,'n7value');
n8=getappdata(0,'n8value');
n9=getappdata(0,'n9value');
n10=getappdata(0,'n10value');
n11=getappdata(0,'n11value');
n12=getappdata(0,'n12value');
n13=getappdata(0,'n13value');
n14=getappdata(0,'n13value');
n15=getappdata(0,'n13value');

%loads the .mat file
load('OuterConcave.mat');
temp=OuterConcave;
L=length(temp(:,1));
OuterConcave(L+1,:)={n13,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n14,n15};
set(handles.OS,'String',OuterConcave(3:L+1,1)); 

% Removes variables from the root directory after it has been stored in
% OuterConcave.mat
rmappdata(0,'n1value');
rmappdata(0,'n2value');
rmappdata(0,'n3value');
rmappdata(0,'n4value');
rmappdata(0,'n5value');
rmappdata(0,'n6value');
rmappdata(0,'n7value');
rmappdata(0,'n8value');
rmappdata(0,'n9value');
rmappdata(0,'n10value');
rmappdata(0,'n11value');
rmappdata(0,'n12value');
rmappdata(0,'n13value');
rmappdata(0,'n14value');
rmappdata(0,'n15value');

% Saves the updated OuterConcave.mat
save('OuterConcave.mat','OuterConcave');


             
% --- Executes on button press in NewSliderConcave.
function NewSliderConcave_Callback(hObject, eventdata, handles)
% hObject    handle to NewSliderConcave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Control shifts from the current GUI to the other one and waits there
% untill told to return back
uiwait(partGUISliderConcave); 

% Retrieves variables from the root directory
n1=getappdata(0,'n1value');
n2=getappdata(0,'n2value');
n3=getappdata(0,'n3value');
n4=getappdata(0,'n4value');
n5=getappdata(0,'n5value');
n6=getappdata(0,'n6value');
n7=getappdata(0,'n7value');

%loads the .mat file
load('SliderConcave.mat');
temp=SliderConcave;
L=length(temp(:,1));
SliderConcave(L+1,:)=[cellstr(n7),cellstr(n1),cellstr(n2),cellstr(n3),cellstr(n4),cellstr(n5),cellstr(n6)];
set(handles.SC,'String',SliderConcave(2:L+1,1)); 

% Removes variables from the root directory after it has been stored in
% OuterConcave.mat
rmappdata(0,'n1value');
rmappdata(0,'n2value');
rmappdata(0,'n3value');
rmappdata(0,'n4value');
rmappdata(0,'n5value');
rmappdata(0,'n6value');
rmappdata(0,'n7value');

% Saves the updated OuterConcave.mat
save('SliderConcave.mat','SliderConcave');



% --- Executes on button press in NewInnerSlider.
function NewInnerSlider_Callback(hObject, eventdata, handles)
% hObject    handle to NewInnerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Control shifts from the current GUI to the other one and waits there
% untill told to return back
uiwait(partGUIInnerSlider); 

% Retrieves variables from the root directory
n1=getappdata(0,'n1value');
n2=getappdata(0,'n2value');
n3=getappdata(0,'n3value');
n4=getappdata(0,'n4value');
n5=getappdata(0,'n5value');


%loads the .mat file
load('InnerSlider.mat');
temp=InnerSlider;
L=length(temp(:,1));
InnerSlider(L+1,:)=[cellstr(n5),cellstr(n1),cellstr(n2),cellstr(n3),cellstr(n4)];
set(handles.IS,'String',InnerSlider(2:L+1,1));

% Removes variables from the root directory after it has been stored in
% OuterConcave.mat
rmappdata(0,'n1value');
rmappdata(0,'n2value');
rmappdata(0,'n3value');
rmappdata(0,'n4value');
rmappdata(0,'n5value');

% Saves the updated OuterConcave.mat
save('InnerSlider.mat','InnerSlider');



% --- Executes on button press in ShowCompleteDatabase.
function ShowCompleteDatabase_Callback(hObject, eventdata, handles)
% hObject    handle to ShowCompleteDatabase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

uiwait(CompleteDatabaseGUI);


% publish('SliderConcave.mat','pdf');
% publish('InnerSlider.mat','pdf');




% --- Executes on selection change in mu1.
function mu1_Callback(hObject, eventdata, handles)
% hObject    handle to mu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting values from popup menu
mu1=(get(handles.mu1,'string'));
% val=get(hObject,'value');
% str=get(hObject,'String');
% for i=1:length(getstr)
%     if strcmp(str{val},getstr(i))
%         mu1=getstr(i);
%     end
% end
setappdata(0,'mu1value',mu1);


% Hints: contents = cellstr(get(hObject,'String')) returns mu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mu1


% --- Executes during object creation, after setting all properties.
function mu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in mu2.
function mu2_Callback(hObject, eventdata, handles)
% hObject    handle to mu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting values from popup menu
mu2=(get(handles.mu2,'string'));
% val=get(hObject,'value');
% str=get(hObject,'String');
% for i=1:length(getstr)
%     if strcmp(str{val},getstr(i))
%         mu2=getstr(i);
%     end
% end
setappdata(0,'mu2value',mu2);

% Hints: contents = cellstr(get(hObject,'String')) returns mu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mu2


% --- Executes during object creation, after setting all properties.
function mu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in mu3.
function mu3_Callback(hObject, eventdata, handles)
% hObject    handle to mu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting values from popup menu
mu3=(get(handles.mu3,'string'));
% val=get(hObject,'value');
% str=get(hObject,'String');
% for i=1:length(getstr)
%     if strcmp(str{val},getstr(i))
%         mu3=getstr(i);
%     end
% end
setappdata(0,'mu3value',mu3);

% Hints: contents = cellstr(get(hObject,'String')) returns mu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mu3


% --- Executes during object creation, after setting all properties.
function mu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in OS.
function OS_Callback(hObject, eventdata, handles)
% hObject    handle to OS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% GET the part names from the popup boxes
getstr=(get(handles.OS,'string'));
val=get(hObject,'value');
str=get(hObject,'String');
for i=1:length(getstr)
    if strcmp(str{val},getstr(i))
        n1=getstr(i);
    end
end
setappdata(0,'n1value',n1);


% Hints: contents = cellstr(get(hObject,'String')) returns OS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from OS


% --- Executes during object creation, after setting all properties.
function OS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in IS.
function IS_Callback(hObject, eventdata, handles)
% hObject    handle to IS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the name of the Inner Slider
getstr=(get(handles.IS,'string'));
val=get(hObject,'value');
str=get(hObject,'String');
for i=1:length(getstr)
    if strcmp(str{val},getstr(i))
        n3=getstr(i);
    end
end
setappdata(0,'n3value',n3);

% Hints: contents = cellstr(get(hObject,'String')) returns IS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from IS


% --- Executes during object creation, after setting all properties.
function IS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SC.
function SC_Callback(hObject, eventdata, handles)
% hObject    handle to SC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the name of the Slider Concave
getstr=(get(handles.SC,'string'));
val=get(hObject,'value');
str=get(hObject,'String');
for i=1:length(getstr)
    if strcmp(str{val},getstr(i))
        n2=getstr(i);
    end
end
setappdata(0,'n2value',n2);

% Hints: contents = cellstr(get(hObject,'String')) returns SC contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SC


% --- Executes during object creation, after setting all properties.
function SC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in UsePairedSliders.
function UsePairedSliders_Callback(hObject, eventdata, handles)
% hObject    handle to UsePairedSliders (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of UsePairedSliders

checkbox = get(handles.UsePairedSliders, 'Value');
setappdata(0,'checkbox',checkbox);
if checkbox == 0
   load('InnerSlider.mat'); 
   L3=length(InnerSlider(:,1));
   starter3=2;
   set(handles.IS,'String',InnerSlider(starter3:L3,1));
else
   empty={};
   set(handles.IS,'String',empty);
end


function fc_Callback(hObject, eventdata, handles)
% hObject    handle to fc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fc as text
%        str2double(get(hObject,'String')) returns contents of fc as a double


% --- Executes during object creation, after setting all properties.
function fc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ConcreteStrength.
function ConcreteStrength_Callback(hObject, eventdata, handles)
% hObject    handle to ConcreteStrength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ConcreteStrength contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ConcreteStrength


% --- Executes during object creation, after setting all properties.
function ConcreteStrength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ConcreteStrength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in GenerateReport.
function GenerateReport_Callback(hObject, eventdata, handles)
% hObject    handle to GenerateReport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Input the part names from different callbacks and matching them with the
% database

% loading .mat files
load('OuterConcave.mat');
load('SliderConcave.mat');
load('InnerSlider.mat');

% obtaining the value of checkbox
checkbox=getappdata(0,'checkbox');

% finding the lengths of the .mat files
L1=length(OuterConcave(:,1));
L2=length(SliderConcave(:,1));
L3=length(InnerSlider(:,1));

% getting friction from root directory
mu1=getappdata(0,'mu1value');
mu2=getappdata(0,'mu2value');
mu3=getappdata(0,'mu3value');

% Converting from string to integer
mu1=str2double(mu1);
mu2=str2double(mu2);
mu3=str2double(mu3);

mu1=mu1/100;
mu2=mu2/100;
mu3=mu3/100;


mu_UB1=getappdata(0,'mu_UB1');
mu_UB2=getappdata(0,'mu_UB2');
mu_UB3=getappdata(0,'mu_UB3');
mu_LB1=getappdata(0,'mu_LB1');
mu_LB2=getappdata(0,'mu_LB2');
mu_LB3=getappdata(0,'mu_LB3');

mu_UB1 = str2double(mu_UB1);
mu_UB2 = str2double(mu_UB2);
mu_UB3 = str2double(mu_UB3);

mu_LB1 = str2double(mu_LB1);
mu_LB2 = str2double(mu_LB2);
mu_LB3 = str2double(mu_LB3);

mu_UB1 = mu_UB1/100;
mu_UB2 = mu_UB2/100;
mu_UB3 = mu_UB3/100;


mu_LB1 = mu_LB1/100;
mu_LB2 = mu_LB2/100;
mu_LB3 = mu_LB3/100;



% check for paired sliders
if checkbox == 0
        % getting data from root directory
        n1=getappdata(0,'n1value');
        n2=getappdata(0,'n2value');
        n3=getappdata(0,'n3value');

        % matching the user inputed variables with the dataset
        for i=1:L1
            if strcmp(n1,OuterConcave(i,1))
                temp1=OuterConcave(i,:);
            end
        end

        for i=1:L2
            if strcmp(n2,SliderConcave(i,1))
                temp2=SliderConcave(i,:);
            end
        end

        for i=1:L3
            if strcmp(n3,InnerSlider(i,1))
                temp3=InnerSlider(i,:);
            end
        end
        
%         % Removing data from root directory
%          rmappdata(0,'n1value');
%          rmappdata(0,'n2value');
%          rmappdata(0,'n3value');
else 
       % getting data from root directory
         n1=getappdata(0,'n1value');
         n2=getappdata(0,'n2value');
        
        % matching the user inputed variables with the dataset
        for i=1:L1
            if strcmp(n1,OuterConcave(i,1))
                temp1=OuterConcave(i,:);
            end
        end

        for i=1:L2
            if strcmp(n2,SliderConcave(i,1))
                temp2=SliderConcave(i,:);
                temp3=InnerSlider(i,:);
            end
        end
        
%         % Removing data from root directory
%           rmappdata(0,'n1value');
%           rmappdata(0,'n2value');

end 

% Getting check values from root directory for display units
 IScheck = get(handles.SIunits, 'Value');
 Americancheck = get(handles.AmericanUnits, 'Value');
 
 if IScheck == 0 && Americancheck == 1
     
     unit = '"';
     unit_m = '"';
     K = 1;
     k_m = 1;
     unit1 = 'in';
     wt_conv = 1;
     g = 386.4;
     wt_unit = 'lb';
     mass_unit = 'lb-sec^2/in';
     Overall_units = 'Kips,in,F'; 
     K_ksi_conv = 1;
     p_unit = 'Ksi';
     wt_unit1 = 'Kips';
     
 elseif IScheck == 1 && Americancheck == 0
     
     unit = 'mm';
     unit_m = 'm';
     K = 25.4;
     k_m = K/1000;
     unit1 = 'mm';
     wt_conv = 4.4482;
     g = 9.8;
     wt_unit = 'N';
     mass_unit = 'Kg';
     Overall_units = 'KN,m,F';
     K_ksi_conv = 6.895;
     p_unit = 'Mpa';
     wt_unit1 = 'KN';
     
 elseif IScheck ==1 && Americancheck == 1
     
     errordlg('WARNING: choose any one unit.');
     
 else
     
     errordlg('WARNING: Choose atleast one unit');
     
 end

% % Removing data from root directory
% rmappdata(0,'mu1value');
% rmappdata(0,'mu2value');
% rmappdata(0,'mu3value');

%Storing the data properties of three isolator parts 
temp1=cell2mat(temp1(2:length(OuterConcave(3,:))));
temp2=cell2mat(temp2(2:length(SliderConcave(3,:))));
temp3=cell2mat(temp3(2:length(InnerSlider(3,:))));

%Additional Parameters
overlay= 0.1; % inches
liner=0.1;    % inches         
% Calc the total height of the Isolator and other related heights(
% Convention following Stanley's spreadsheet.
Ht= temp3(2) + 2*temp2(5) + 2*temp1(3) + 2*overlay + 2*liner; %height of TP
Hi=temp3(2);                                      % Height of inner slider   
Hs=temp3(2) + 2*temp2(5);                         % Height upto slider conc
dmc=temp1(2);                           % Plan Internal dia of main concave           
dso=temp2(1);                           % plan outer dia of slider concave
dsi=temp2(3);                           % plan inner dia of inner slider
Inner=temp3(1);                         % dia of inner slider
R1=temp2(2);                            % Radius of slider concave
R2=temp1(1);                            % Radius of Main Concave
W = 2*temp1(4) + 2*temp2(6) + temp3(4); % Estimated total weight
edge_dim_mc = temp1(13);                % Edge Dimension of Main Concave
flange_radius = temp1(14);              % Flange radius
center_hole = temp1(9);                 % center hole position
corner_hole = [temp1(11) temp1(12)];    % corner hole position
hole_dia = temp1(8);                    % diameter of the holes
scr_radius = temp2(7);                % corner radius of scr-Slider Concave
dmc_outer = temp1(2) + 2*temp1(5);    % Outer diameter of main concave

if flange_radius ~= 0
    edge_dim_mc = sqrt(flange_radius^2 - (temp1(6)/2 + 0.25)^2);
end


% Calc of effective Radii of three distinct surfaces
L1=2*R1 - Hi;
L3=2*R2 - Hs;
L2=(L1+L3)/2;




% Calc of terminal displacements for each regime ( I to V )
Dsc= (L1/(2*R1))*(dso-Inner);
Dmc=(L3/(2*R2))*(dmc_outer-dso);

D1=(mu2-mu1)*L1;
D2=(mu3-mu2)*L2 +D1;
D4 = Dmc + (mu3-mu1)*L1;
D3 = D4 - (mu3-mu2)*L2;
D5 =Dsc + Dmc;

% Making Nicole's Hysteresis Loop Work (force loop based on capacity, NOT demand) ( 5 Regimes )
hsi = Hi;
tsc = temp2(5);
Rmc = R2;
dmc_outer = temp1(2) + 2*temp1(5);
tmc = temp1(3);
dsc = temp2(3);
Rsc = R1;
dsc_outer = temp2(1);
dsi = temp3(1);
Rsc_outer = temp2(4);
SiteSpectra = getappdata(0,'SiteSpectra');


Sd1 = str2num(get(handles.Sd1,'String'));
Sm1 = str2num(get(handles.Sm1,'String'));
Rvec=[R1 R2];
dvec=[dmc_outer dso dsi Inner];   
Hvec=[Hi Hs];
muvec=[mu1 mu2 mu3];
mu_vec = [mu_UB1 mu_UB2 mu_UB3;mu_LB1 mu_LB2 mu_LB3;mu1 mu2 mu3];
title_graph = {'UPPER BOUND','LOWER BOUND','NOMINAL'};
report_name = {'TRIPLE PENDULUM BEARING_UpperBound','TRIPLE PENDULUM BEARING_LowerBound','TRIPLE PENDULUM BEARING_Nominal'};
plot_name = {'hysteresis_UB.jpg','hysteresis_LB.jpg','hysteresis_nominal.jpg'};


if isempty(SiteSpectra) == 0
    
    
    SiteSpectra_DBE(:,1) = SiteSpectra(:,1);
    SiteSpectra_DBE(:,2) = SiteSpectra(:,2);
    SiteSpectra_MCE(:,1) = SiteSpectra(:,1);
    SiteSpectra_MCE(:,2) = SiteSpectra(:,3);
    S = [0 0];
    
    
else
    S(1) = Sd1;
    S(2) = Sm1;
   SiteSpectra_DBE = 0 ;
   SiteSpectra_MCE = 0;
end

import mlreportgen.dom.*;

for i = 1:3
        [p1,p2,p3,p4,p5]=getnicoleloopS3(Rvec, dvec, Hvec, mu_vec(i,:));
        [pd,D(1),~,Teff(1),Damping(1),Keff(1)]=DisplacementDemandCalc(p5,Rvec, dvec, Hvec, mu_vec(i,:), S(1), SiteSpectra_DBE);
        [pm,D(2),~,Teff(2),Damping(2),Keff(2)]=DisplacementDemandCalc(p5,Rvec, dvec, Hvec, mu_vec(i,:), S(2), SiteSpectra_MCE);

        % Storing values in root directory
        setappdata(0,'p5max',p5(7,1));
        setappdata(0,'p4max',p4(6,1));

        h1=figure;

        plot(p1(:, 1), p1(:, 2), 'b-', p2(:, 1), p2(:, 2), 'b-', p3(:, 1), p3(:, 2), 'b-', p4(:, 1), p4(:, 2), 'b-', p5(:, 1), p5(:, 2), 'b-'); grid on;
        hold on
        plot(pd(:,1),pd(:,2),'b.-',pm(:,1),pm(:,2),'b.-');
        plot([-p5(7,1)-3 p5(7,1)+3],[0 0],'k');
        plot([0 0],[-p5(7,2)-0.03 p5(7,2)+0.03],'k');
        title(strcat(title_graph(i),'FORCE-DISPLACEMENT LOOP'), 'FontName', 'Arial', 'FontWeight', 'Bold');
        xlabel(strcat('Horizontal Displacement ','(',unit1,')'), 'FontName', 'Arial');
        ylabel('Normalized Shear', 'FontName', 'Arial');
        set(gca, 'YTick', []);
        set(gca, 'XTick', []);

        % str2=strcat(num2str(p5(2,2),2),'-');
        str3=strcat(num2str(p5(3,2),2),'-');
        % str4=strcat(num2str(p5(4,2),2),' \rightarrow');
        % str5=strcat(num2str(p5(5,2),2),' \rightarrow');
        str6=strcat(num2str(p5(6,2),2),'-');
        str7=strcat(num2str(p5(7,2),2),'-');
        str8=strcat(num2str(max(pd(:,2)),2),'-');
        %str9=strcat(num2str(max(pm(:,2)),2),'-');

        %text(0,p5(2,2),str2,'HorizontalAlignment','right');
        h(1)=text(0,p5(3,2),str3,'HorizontalAlignment','right');
        % text(p5(4,1)-2,p5(4,2),str4,'HorizontalAlignment','right');
        % text(p5(5,1)-5,p5(5,2),str5,'HorizontalAlignment','right');
        h(2)=text(0,p5(6,2),str6,'HorizontalAlignment','right');
        h(3)=text(0,p5(7,2),str7,'HorizontalAlignment','right');
        h(4)=text(0,max(pd(:,2)),str8,'HorizontalAlignment','right');
        %h(5)=text(0,max(pm(:,2)),str9,'HorizontalAlignment','right');
        h(1).FontSize=8;h(2).FontSize=8;h(3).FontSize=8;h(4).FontSize=8;
        %h(5).FontSize=8;

        % str3=strcat(num2str(p5(3,1),2),'"');
        str4=strcat(num2str(p5(4,1)*K,4),unit);
        % str5=strcat(num2str(p5(5,1),2),'"');
        str6=strcat(num2str(p5(6,1)*K,4),unit);
        str7=strcat(num2str(p5(7,1)*K,4),unit);
        str8=strcat(num2str(D(1)*K,4),unit);
        %str9=strcat(num2str(D(2)*K,4),unit);

        % text(p5(3,1)+0.5,-0.05,str3,'HorizontalAlignment','center');
        h(1)=text(p5(4,1),-0.03,str4,'HorizontalAlignment','center');
        % text(p5(5,1),p5(5,2)-0.07,str5,'HorizontalAlignment','center');
        h(2)=text(p5(4,1),0,'|','HorizontalAlignment','center');
        h(3)=text(p5(6,1),0,'|','HorizontalAlignment','center');
        h(4)=text(p5(7,1),0,'|','HorizontalAlignment','center');
        h(5)=text(D(1),0,'|','HorizontalAlignment','center');
        %h(6)=text(D(2),0,'|','HorizontalAlignment','center');
        h(7)=text(p5(6,1)-1,-0.03,str6,'HorizontalAlignment','center');
        h(8)=text(p5(7,1)+1,-0.03,str7,'HorizontalAlignment','left');
        h(9)=text(D(1)-1,-0.03,str8,'HorizontalAlignment','left');
        %h(10)=text(D(2)+1,-0.03,str9,'HorizontalAlignment','right');
        h(1).FontSize=8;h(2).FontSize=8;h(3).FontSize=8;h(4).FontSize=8;
        h(5).FontSize=8;h(7).FontSize=8;h(8).FontSize=8;h(9).FontSize=8;
        %h(10).FontSize=8;

        saveas(h1,char(plot_name(i)),'jpg');

        % Generation of Regime Properties ie Teff,Keff and damping ratio for
        % template_3

             [Teff1,Keff1,eta1]=RegimePropertyGenerator(p1);
             [Teff2,Keff2,eta2]=RegimePropertyGenerator(p2);
             [Teff3,Keff3,eta3]=RegimePropertyGenerator(p3);
             [Teff4,Keff4,eta4]=RegimePropertyGenerator(p4);
             [Teff5,Keff5,eta5]=RegimePropertyGenerator(p5);

             Teff_vec = [Teff1 Teff2 Teff3 Teff4 Teff5 Teff(1) Teff(2)];
             Keff_vec = [Keff1 Keff2 Keff3 Keff4 Keff5 Keff(1) Keff(2)];
             eta_vec = [eta1 eta2 eta3 eta4 eta5 Damping(1) Damping(2)];

             % Report Generation and Hole filling in MS Word Template_3
             
        
        import mlreportgen.dom.*
        doc=Document(char(report_name(i)),'docx','mytemplate_3');

        A=imread(char(plot_name(i)));
        B = imresize(A, [600 800]);
        imwrite(B,char(plot_name(i)));
        I=Image(char(plot_name(i)));


        while ~strcmp(doc.CurrentHoleId, '#end#')
               switch doc.CurrentHoleId
                 case 'picture'
                    append(doc,I);
                case 'OC'
                    str1=mat2str(temp1(1),3);
                    str2=mat2str(temp1(2),2);
                    append(doc,strcat('FPT',str1,str2));
                case 'SC1'
                    str1=mat2str(temp2(1),2);
                    append(doc,str1);
                case 'SC2'
                    str1=mat2str(temp2(2),2);
                    append(doc,str1);
                case 'IS1'
                    str1=mat2str(temp3(1),2);
                    append(doc,str1);
                case 'IS2'
                    str1=mat2str(temp3(2),2);
                    append(doc,str1);  
                case 'date'
                    formatOut = 2;
                    str = datestr(now,formatOut);
                    append(doc,str);

                case '6'
                    str=num2str(mu_vec(i,1),2);
                    append(doc,str);  
                case '7'
                    str=num2str(mu_vec(i,2),2);
                    append(doc,str);   
                case '8'
                    str=num2str(mu_vec(i,3),2);
                    append(doc,str);  
                case '9'
                    str=num2str(L1*K,4);
                    append(doc,strcat(str,unit));   
                case '10'
                    str=num2str(L2*K,4);
                    append(doc,strcat(str,unit));   
                case '11'
                    str=num2str(L3*K,4);
                    append(doc,strcat(str,unit)); 
                case '12'
                    str=num2str(Teff_vec(1),2);
                    append(doc,str); 
                case '13'
                    str=num2str(Teff_vec(2),2);
                    append(doc,str); 
                case '14'
                    str=num2str(Teff_vec(3),2);
                    append(doc,str); 
                case '15'
                    str=num2str(Teff_vec(4),2);
                    append(doc,str); 
                case '16'
                    str=num2str(Teff_vec(5),2);
                    append(doc,str);  
                case '17'
                    str=num2str(Keff_vec(1)/K,2);
                    append(doc,str);
                case '18'
                    str=num2str(Keff_vec(2)/K,2);
                    append(doc,str); 
                case '19'
                    str=num2str(Keff_vec(3)/K,2);
                    append(doc,str);
                case '20'
                    str=num2str(Keff_vec(4)/K,2);
                    append(doc,str);
                case '21'
                    str=num2str(Keff_vec(5)/K,2);
                    append(doc,str);
                case '22'
                    str=num2str(eta_vec(1),2);
                    append(doc,str);
                case '23'
                    str=num2str(eta_vec(2),2);
                    append(doc,str);
                case '24'
                    str=num2str(eta_vec(3),2);
                    append(doc,str); 
                case '25'
                    str=num2str(eta_vec(4),2);
                    append(doc,str); 
                case '26'
                    str=num2str(eta_vec(5),2);
                    append(doc,str);   
                case '27'
                    str=num2str(p1(3,1)*K,2);
                    append(doc,strcat(str,unit));
                case '28'
                    str=num2str(p2(4,1)*K,2);
                    append(doc,strcat(str,unit));
                case '29'
                    str=num2str(p3(5,1)*K,2);
                    append(doc,strcat(str,unit));
                case '30'
                    str=num2str(p4(6,1)*K,2);
                    append(doc,strcat(str,unit));    
                case '31'
                    str=num2str(p5(7,1)*K,4);
                    append(doc,strcat(str,unit));
                case '32'
                    str=num2str(Rmc*K,4);
                    append(doc,strcat(str,unit));
                case '33'
                    str=num2str(Rsc*K,4);
                    append(doc,strcat(str,unit));  
                case '34'
                    str=num2str(dmc*K,4);
                    append(doc,strcat(str,unit));
                case '35'
                    str=num2str(dsc_outer*K,4);
                    append(doc,strcat(str,unit));
                case '36'
                    str=num2str(dsc*K,4);
                    append(doc,strcat(str,unit));
                case '37'
                    str=num2str(dsi*K,4);
                    append(doc,strcat(str,unit));
                case '38'
                    str=num2str(tsc*K,4);
                    append(doc,strcat(str,unit));
                case '39'
                    str=num2str(hsi*K,4);
                    append(doc,strcat(str,unit));  
                case '40'
                    str=num2str(Teff_vec(6),2); 
                    append(doc,str);
                case '41'
                    str=num2str(Keff_vec(6)/K,2);  
                    append(doc,str);
                case '42'
                    str=num2str(eta_vec(6),2);  
                    append(doc,str);
                case '43'
                    str=num2str(Teff_vec(7),2);
                    append(doc,str);
                case '44'
                    str=num2str(Keff_vec(7)/K,2); 
                    append(doc,str);
                case '45'
                    str=num2str(eta_vec(7),2);
                    append(doc,str);
                case '46'
                    str=num2str(D(1)*K,3);
                    append(doc,str);
                case '47'
                    str=num2str(D(2)*K,3);
                    append(doc,str);
               end
               moveToNextHole(doc);
        end
        close(doc);
        %rptview(strcat('TRIPLE PENDULUM BEARING_',report_name(i)),'.docx');
end
     

  
% % Generation of Design Spectrum for a chosen bearing 
% 
%  if sum(p) ~= 0
%     
%     [T,Sa,d]=TPDesignSpectrumGenerator(p5,Rvec, dvec, Hvec, muvec);
%       
%  end
 
   
% Report Generation and Hole filling in MS Word Template_1

% Generation of Section, Elevation and Plan View of TP (To Scale)
% hsi,tsc,dmc,Rmc,dmc_outer,tmc,hsi,dsc,Rsc,dsc_outer
% Hi,temp2(5),dmc,R2,temp1(6),temp1(3),Hi,temp2(3),R1,temp2(1)

hsi = Hi;
tsc = temp2(5);
Rmc = R2;
dmc_outer = temp1(2) + 2*temp1(5);
tmc = temp1(3);
dsc = temp2(3);
Rsc = R1;
dsc_outer = temp2(1);
dsi = temp3(1);
Rsc_outer = temp2(4);



% To Scale drawing of the SECTION
h = figure('units','normalized','outerposition',[0 0 1 1]);
[q1,q2,q3,q4,q5,q6,c1,c2,c3,c4,c5,c6,P1,P2,P3,P4,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10]=ToScaleDrawing_section(hsi,tsc,dmc,Rmc,dmc_outer,tmc,dsc,Rsc,dsc_outer, dsi, Ht, Hs, Rsc_outer, scr_radius);                 
plot(q1(:, 1), q1(:, 2), 'k-', q2(:, 1), q2(:, 2), 'k-', q3(:, 1), q3(:, 2), 'k-', q4(:, 1), q4(:, 2), 'k-', q5(:, 1), q5(:, 2), 'k-', q6(:, 1), q6(:, 2), 'k-');
hold on
plot(c1(:,1),c1(:,2),'k-', c2(:,1),c2(:,2),'k-', c3(:,1),c3(:,2),'k-', c4(:,1),c4(:,2),'k-', c5(:,1),c5(:,2),'k-', c6(:,1),c6(:,2),'k-');

axis([(-dmc_outer/2 - 10)  (dmc_outer/2 + 10) (-Ht -5)  (Ht + 5)]);
%axis square;
axis equal;
axis off;

quiver(P1(1),P1(2),3,(q1(15,2) + Ht/2 + 3),0,'color',[0 0 0]);
%quiver(P2(1),P2(2),2,Hs/2,0,'color',[0 0 0]);
quiver(P3(1),P3(2),0,hsi/2,0,'color',[0 0 0]);
quiver(P4(1),P4(2),-4,tsc + tmc + 6,0,'color',[0 0 0]);

str1 = strcat(mat2str(Ht*K),unit);
str2 = strcat(mat2str(dmc_outer*K),unit);
str3 = strcat(mat2str(dsc_outer*K),unit);
str4 = strcat(mat2str(dsi*K),unit);
str5 = strcat(mat2str(hsi*K),unit);
str6 = strcat(mat2str(Hs*K),unit);
str7 = {'CONCAVE SURFACE,';strcat(' R=',mat2str(R2*K),unit)};
str8 = strcat('R=',mat2str(R1*K),unit);
str9 = 'ARTICULATED SLIDER';
str10 = {'CONCAVE';'PLATE'};

text(T1(1),T1(2),str1,'HorizontalAlignment','center');
text(T2(1),T2(2),str2,'HorizontalAlignment','center');
text(T3(1),T3(2),str3,'HorizontalAlignment','center');
text(T4(1),T4(2),str4,'HorizontalAlignment','center');
text(T5(1),T5(2),str5,'HorizontalAlignment','center');
text(T6(1),T6(2),str6,'HorizontalAlignment','center');
text(T7(1),T7(2),str7,'HorizontalAlignment','center');
text(T8(1),T8(2),str8,'HorizontalAlignment','center');
text(T9(1),T9(2),str9,'HorizontalAlignment','center');
text(T10(1),T10(2),str10,'HorizontalAlignment','center');
%text(0,-Ht-4,'SECTION','HorizontalAlignment','center');

set(h,'PaperPositionMode','auto');
saveas(h,'section','jpg');
A=imread('section.jpg');
%B = imresize(A, [600 800]);
C = imcrop(A, [360, 170, 1380, 560]);
%D = imcrop(C, [-20,0, 600, 400]);
B = imresize(C, [224 552]);
imwrite(B,'section.jpg');
I1 = Image('section.jpg');


% To scale drawing of the ELEVATION
 h = figure('units','normalized','outerposition',[0 0 1 1]);
[e1, e2, e3, c1, T1]=ToScaleDrawing_elevation(hsi,tsc,dmc,Rmc,dmc_outer,tmc,dsc,Rsc,dsc_outer, dsi, Ht, Hs, edge_dim_mc);
plot(e1(:,1),e1(:,2),'k-', e2(:,1),e2(:,2),'k-', e3(:,1),e3(:,2),'k-',c1(:,1),c1(:,2),'k-');
axis([(-dmc_outer/2 - 10)  (dmc_outer/2 + 10) (-Ht -5)  (Ht + 5)]);
%axis square;
axis equal;
axis off;
hold on;
str1 = strcat(mat2str(tmc*K),unit);
text(T1(1),T1(2),str1,'HorizontalAlignment','center');

set(h,'PaperPositionMode','auto');
saveas(h,'elevation','jpg');
A=imread('elevation.jpg');
%B = imresize(A, [600 800]);
C = imcrop(A, [390, 300, 1300, 350]);
%D = imcrop(C, [50,0, 600, 225]);
B = imresize(C, [140 520]);
imwrite(B,'elevation.jpg');
I2 = Image('elevation.jpg');


% To Scale drawing of the PLAN VIEW
 h = figure('units','normalized','outerposition',[0 0 1 1]);
[archx,pl,pl1,pl2,pl3,pl4,cirprop,c1,c2,c3,c4,c5,c6,c7,T1,T2,T3,T4,T5,T6,T7,T8,sp1,sp2,sp3,sp4] = ToScaleDrawing_plan(hsi,tsc,dmc,Rmc,dmc_outer,tmc,dsc,Rsc,dsc_outer, dsi, Ht, Hs, edge_dim_mc, flange_radius, center_hole, corner_hole);

plot(pl(:,1),pl(:,2),'k-',pl1(:,1),pl1(:,2),'k-',pl2(:,1),pl2(:,2),'k-',pl3(:,1),pl3(:,2),'k-',pl4(:,1),pl4(:,2),'k-');
hold on
plot(c1(:,1),c1(:,2),'k-', c2(:,1),c2(:,2),'k-', c3(:,1),c3(:,2),'k-',...
     c4(:,1),c4(:,2),'k-',c5(:,1),c5(:,2),'k-',c6(:,1),c6(:,2),'k-',...
     c7(:,1),c7(:,2),'k-');
plot(sp1(:,1),sp1(:,2),'k-',sp2(:,1),sp2(:,2),'k-',sp3(:,1),sp3(:,2),'k-',sp4(:,1),sp4(:,2),'k-'); 

str = 'k--';
circle([0 0],dmc_outer/2,str);   % circle() and arc() are NOT matlab in-built functions
circle([0 0],dmc/2,str);
circle([0 0],dsc_outer/2,str);
str = 'k';
for i=1:length(cirprop(:,1))
    circle(cirprop(i,:),hole_dia/2,str);
end   
arc(flange_radius,archx(1,1),archx(1,2));
arc(flange_radius,archx(2,1),archx(2,2));

    if sum(T2) == 0 

        str = strcat(mat2str(center_hole*K),unit);
        text(T6(1),T6(2),str,'HorizontalAlignment','center');
        text(T7(1),T7(2),str,'HorizontalAlignment','center');
        
        str1 = strcat(mat2str(hole_dia*K),unit,'DIA HOLE');
        text(center_hole + 4,center_hole,str1,'HorizontalAlignment','left');


    elseif sum(T6) == 0

         str1 = strcat(mat2str(min(corner_hole)*K),unit);
         str2 = strcat(mat2str(max(corner_hole)*K),unit);
         text(T2(1),T2(2),str1,'HorizontalAlignment','center');
         text(T3(1),T3(2),str2,'HorizontalAlignment','center');
         text(T4(1),T4(2),str1,'HorizontalAlignment','center');
         text(T5(1),T5(2),str2,'HorizontalAlignment','center');
         
         str1 = strcat(mat2str(hole_dia*K),unit,'DIA HOLE');
         text(corner_hole(1) + 4,corner_hole(2),str1,'HorizontalAlignment','left');

    else

        str = strcat(mat2str(center_hole*K),unit);
        str1 = strcat(mat2str(min(corner_hole)*K),unit);
        str2 = strcat(mat2str(max(corner_hole)*K),unit);

        text(T6(1),T6(2),str,'HorizontalAlignment','center');
        text(T7(1),T7(2),str,'HorizontalAlignment','center');
        text(T2(1),T2(2),str1,'HorizontalAlignment','center');
        text(T3(1),T3(2),str2,'HorizontalAlignment','center');
        text(T4(1),T4(2),str1,'HorizontalAlignment','center');
        text(T5(1),T5(2),str2,'HorizontalAlignment','center');
        
        str1 = strcat(mat2str(hole_dia*K),unit,'DIA HOLE');
        text(corner_hole(1) + 4,corner_hole(2),str1,'HorizontalAlignment','left');

    end

str = strcat(mat2str(dmc_outer*K),unit);
text(T1(1),T1(2),str,'HorizontalAlignment','center');

str = 'SHIPPING PLATES';
text(T8(1),T8(2),str,'HorizontalAlignment','center');

axis([(-dmc_outer/2 - 25)  (dmc_outer/2 + 25)    (-dmc_outer/2 - 25)  (dmc_outer/2 + 25)]);
%axis square;
axis equal;
axis off;


set(h,'PaperPositionMode','auto');
saveas(h,'plan','jpg');
A=imread('plan.jpg');
%B = imresize(A, [600 800]);
C = imcrop(A, [600, 150, 900, 680]);
%D = imcrop(C, [15,0, 700, 405]);
B = imresize(C, [453.33 600]);
imwrite(B,'plan.jpg');
I3 = Image('plan.jpg');



import mlreportgen.dom.*
doc=Document('TRIPLE PENDULUM BEARING_1','docx','mytemplate_1');
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
        case 'section'
            append(doc,I1);
        case 'elevation'
            append(doc,I2);
        case 'plan'
            append(doc,I3);  
        case 'date'
            formatOut = 2;
            str = datestr(now,formatOut);
            append(doc,str);    
        case '15'
            append(doc, '+-1/16" (1.6 mm)');    
    end
    moveToNextHole(doc);
end
close(doc);
%rptview('TRIPLE PENDULUM BEARING_1.docx');


% Report Generation and Hole filling in MS Word Template_4
% doc=Document('TRIPLE PENDULUM BEARING_4','docx','mytemplate_4');
% close(doc);






% Report Generation and Hole filling in MS Word Template_6

Mass = W*wt_conv/(g*1000);    % SI: Kilo-kg, AUnit: kips/g
W = W*wt_conv/1000;
Rot_inertia = Mass*(dmc*k_m)^2/8;
rate = 1.25/k_m ;
friction(1,:) = [mu_UB1; mu_UB2; mu_UB3];
friction(2,:) = [mu_LB1; mu_LB2; mu_LB3];
friction(3,:) = [mu1; mu2; mu3];
E = 29000;
A = (pi*dsc_outer^2/4 + pi*dsi^2/4)/2;
kv = 0.05*A*E*wt_conv/Ht*k_m;
mytemplate_6_generator(temp1,temp2,temp3,Mass,W,Rot_inertia,Hvec,friction,rate,Rvec,D5,kv,k_m,Overall_units,unit_m);



% Report Generation and Hole filling in MS Word Template_7 & MS Word
% Template_8
% Generate Demand Based Hysteresis Loop based on Response Spectra provided
% by User

  
%   Sd1 = str2num(get(handles.Sd1,'String'));
%   Sm1 = str2num(get(handles.Sm1,'String'));
  friction(1,:) = [mu_UB1  mu_UB2  mu_UB3];
  friction(2,:) = [mu_LB1  mu_LB2  mu_LB3];
  friction(3,:) = [mu1  mu2  mu3];
  SiteSpectra = getappdata(0,'SiteSpectra');
  
  if isempty(SiteSpectra) == 0
   
    SiteSpectra_all(:,1) = SiteSpectra(:,1);
    SiteSpectra_all(:,2) = SiteSpectra(:,2);
    SiteSpectra_all(:,3) = SiteSpectra(:,1);
    SiteSpectra_all(:,4) = SiteSpectra(:,3);
    SiteSpectra_all(:,5) = SiteSpectra(:,1);
    S = [Sd1 Sm1 0];
    if get(handles.checkifSm1,'Value') == 1
       SiteSpectra_all(:,6) = SiteSpectra(:,3);
       S(3) = Sm1;
    else
       SiteSpectra_all(:,6) = SiteSpectra(:,2);
       S(3) = Sd1;
    end
         
  else
        S = [Sd1 Sm1 0];
      if get(handles.checkifSm1,'Value') == 1
          S(3) = Sm1;
      else
          S(3) = Sd1;
      end
       SiteSpectra_all = [0,0,0,0,0,0];
     
  end

          
  c = 1;
  for i=1:3
           muvec = friction(i,:);
           [~,~,~,~,p5]=getnicoleloopS3(Rvec, dvec, Hvec, muvec);
           [p,D(i),Shear(i),Teff(i),Damping(i),Keff(i)]=DisplacementDemandCalc(p5,Rvec, dvec, Hvec, muvec, S(i), SiteSpectra_all(:,c:c+1));
           if i==1
                    p1 = p;
                    setappdata(0,'DBE_resp',p1);
                    
           elseif i==2
               
                    p2 = p;
                    setappdata(0,'MCE_resp',p2);
                    
           else
                    p3 = p;
           end
           c = c+2;
  end 
  
  % check if the bearing is adequate for the given Design Spectrum
          if sum(p)~=0

              h = figure;
              plot(p1(:, 1), p1(:, 2), 'r-',p2(:, 1), p2(:, 2), 'b-',p3(:, 1), p3(:, 2), 'g-'); grid on;
              title('FORCE-DISPLACEMENT LOOP', 'FontName', 'Arial', 'FontWeight', 'Bold');
              xlabel('Horizontal Displacement (in)', 'FontName', 'Arial');
              ylabel('Normalized Shear', 'FontName', 'Arial');
              h1 = legend('Upper Bound DBE','Lower Bound MCE','EPS Proposed Nominal');
              set(h1,'Location','southeast');
              
              saveas(h,'template_7','jpg');
              A=imread('template_7.jpg');
              B = imresize(A, [500 666.67]);
              imwrite(B,'template_7.jpg');
              I=Image('template_7.jpg');

              
              %Conversion of doubles to string
              
                L=[L1,L2,L3];
                mytemplate_7_generator(temp1,temp2,temp3,I,friction,L,D,Shear,Teff,Damping,Keff,unit,K,unit1);
                
                Bd = (Damping./0.05).^0.3;
                
                mytemplate_8_generator(temp1,temp2,temp3, friction, Damping, L, D, p5, Teff, S, Bd, Shear, unit, K, unit1);

          else
              errordlg('The selected bearing is inadequate for the given design spectrum'); 
          end
          
  %Report Generation and Hole filling in MS Word Template_10
  
  h = figure;
  t = (0.05*Teff_vec(5)):0.05:(1.5*Teff_vec(6));
  plot(t,Sd1./t,'b-');grid on;
  title('Design Spectra at DBE', 'FontName', 'Arial', 'FontWeight', 'Bold');
  xlabel('Time(s)', 'FontName', 'Arial');
  ylabel('Sa(g)', 'FontName', 'Arial');
  saveas(h,'DBE_design_spectra','jpg');
  
  A=imread('DBE_design_spectra.jpg');
  B = imresize(A, [350 666.67]);
  imwrite(B,'DBE_design_spectra.jpg');
  I1=Image('DBE_design_spectra.jpg');
  
  h = figure;
  plot(t,Sm1./t,'r-');grid on;
  title('Design Spectra at MCE', 'FontName', 'Arial', 'FontWeight', 'Bold');
  xlabel('Time(s)', 'FontName', 'Arial');
  ylabel('Sa(g)', 'FontName', 'Arial');
  saveas(h,'MCE_design_spectra','jpg');
  
  A=imread('MCE_design_spectra.jpg');
  B = imresize(A, [350 666.67]);
  imwrite(B,'MCE_design_spectra.jpg');
  I2=Image('MCE_design_spectra.jpg');
  
  
  doc=Document('TRIPLE PENDULUM BEARING_ASCE_spectra','docx','mytemplate_10');
  while ~strcmp(doc.CurrentHoleId, '#end#')
    switch doc.CurrentHoleId
        
        case 'DBE_spectra_plot'
            append(doc,I1);
        case 'MCE_spectra_plot'
            append(doc,I2);
        case '1'
            str = num2str(Sd1,2);
            append(doc,str);
        case '2'
            str = num2str(Sm1,2);
            append(doc,str);
    end
    moveToNextHole(doc);
  end
  close(doc);
  %rptview('TRIPLE PENDULUM BEARING_ASCE_spectra.docx');    
  
  %Report Generation and Hole filling in MS Word Template_11
  
  if isempty(SiteSpectra) == 0
      h = figure;
      plot(SiteSpectra(:,1),SiteSpectra(:,2),'b-');grid on;
      title('Site Specific Spectra at DBE', 'FontName', 'Arial', 'FontWeight', 'Bold');
      xlabel('Time(s)', 'FontName', 'Arial');
      ylabel('Sa(g)', 'FontName', 'Arial');
      saveas(h,'DBE_site_spectra','jpg');
  
      A=imread('DBE_site_spectra.jpg');
      B = imresize(A, [350 666.67]);
      imwrite(B,'DBE_site_spectra.jpg');
      I1=Image('DBE_site_spectra.jpg');
      
      h = figure;
      plot(SiteSpectra(:,1),SiteSpectra(:,3),'r-');grid on;
      title('Site Specific Spectra at MCE', 'FontName', 'Arial', 'FontWeight', 'Bold');
      xlabel('Time(s)', 'FontName', 'Arial');
      ylabel('Sa(g)', 'FontName', 'Arial');
      saveas(h,'MCE_site_spectra','jpg');
  
      A=imread('MCE_site_spectra.jpg');
      B = imresize(A, [350 666.67]);
      imwrite(B,'MCE_site_spectra.jpg');
      I2=Image('MCE_site_spectra.jpg');
      
  
      doc=Document('TRIPLE PENDULUM BEARING_Site_spectra','docx','mytemplate_11');
      while ~strcmp(doc.CurrentHoleId, '#end#')
        switch doc.CurrentHoleId

            case 'DBE_site_spectra'
                append(doc,I1);
            case 'MCE_site_spectra'
                append(doc,I2);
        end
       moveToNextHole(doc);
      end
      close(doc);
      %rptview('TRIPLE PENDULUM BEARING_Site_spectra.docx');
  end
  
          
  %Report Generation and Hole filling in MS Word Template_9
  
  fc = str2num(get(handles.fc,'String'));
  fc = fc/1000;
  fy = 40;
  tb = 0;
  thc = [0.65 1];
  ths = [0.90 1];
  
  for i = 1:2
      [tc, teff, Fbu(i), Mu(i), b1(i), ratio(i), r(i), Mus(i), Muext(i), Pu(i), Pallbuild(i), Pallbridge(i), Area, Pusi60, Pysi40, Pall_build, Pall_bridge, CF(i)] = VirticalLoadCapacityCircular(dsi,Rmc,dsc_outer,tmc,tb,fc,fy,thc(i),ths(i));
  end
  
  mytemplate_9_generator(temp1,temp2,temp3,dsi, dsc_outer, tc, tb, teff, fc, Fbu, Mu, b1, ratio, r, Mus, Muext, Pu, Pallbuild, Pallbridge, Area, Pusi60, Pysi40, Pall_build, Pall_bridge, CF, K, K_ksi_conv, wt_conv, unit1, p_unit, wt_unit1);
  
          
 % Report Generation and Hole filling in MS Word Template_5



QC_vert_load = str2num(get(handles.QC,'String'));
shear_load =  str2num(get(handles.ShearLoad,'String'));



doc=Document('TRIPLE PENDULUM BEARING_5','docx','mytemplate_5');
while ~strcmp(doc.CurrentHoleId, '#end#')
    switch doc.CurrentHoleId
        case 'OC'
            str1=mat2str(temp1(1),3);
            str2=mat2str(temp1(2),2);
            append(doc,strcat('FPT',str1,str2));
        case 'SC1'
            str1=mat2str(temp2(1),2);
            append(doc,str1);
        case 'SC2'
            str1=mat2str(temp2(2),2);
            append(doc,str1);
        case 'IS1'
            str1=mat2str(temp3(1),2);
            append(doc,str1);
        case 'IS2'
            str1=mat2str(temp3(2),2);
            append(doc,str1);  
        case 'date'
            formatOut = 2;
            str = datestr(now,formatOut);
            append(doc,str);
        case '1'
          str=num2str(p5(7,1),3);
          append(doc,strcat(str,'in')); 
        case '2'
         str=num2str(p4(7,1)*25.4,4);
          append(doc,strcat(str,'mm')); 
        case '3'
         str=num2str(p4(6,1),3);
          append(doc,strcat(str,'in'));    
        case '4'
         str=num2str(p4(6,1)*25.4,4);
         append(doc,strcat(str,'mm'));    
        case '5'
         str=num2str(Pysi40,4);
          append(doc,strcat(str,'Kips'));     
        case '6'
         str=num2str(Pysi40*4.448,4);
          append(doc,strcat(str,'KN'));   
        case '7'
         str=num2str(Pusi60,4);
          append(doc,strcat(str,'Kips'));   
        case '8'
         str = num2str(shear_load,4);
         append(doc,strcat(str,'Kips'));
        case '9'
         str = num2str(shear_load*4.448,4);
         append(doc,strcat(str,'KN'));   
        case '10'
         str = num2str(QC_vert_load,4);
         append(doc,strcat(str,'Kips'));  
        case '11'
        str = num2str(QC_vert_load*4.448,4);
         append(doc,strcat(str,'KN'));   
        case '12'
         append(doc,'1');   
        case '13'
         str=num2str(fc*1000,4);
          append(doc,strcat(str,'Psi'));  
        case '14'
          str=num2str(Pallbuild(1),4);
          append(doc,strcat(str,'Kips'));    
        case '15'
         str=num2str((Pallbuild(1))*4.448,4);
          append(doc,strcat(str,'KN'));  
        case '16'
         str=num2str((Pu(2)),4);
         append(doc,strcat(str,'Kips'));
        case '17'
        str=num2str((Pu(2))*4.448,4);
         append(doc,strcat(str,'KN'));
        case '18'
         str=num2str(D(2),4);
          append(doc,strcat(str,'in')); 
        case '19'
         str=num2str(D(2)*25.4,4);
         append(doc,strcat(str,'mm')); 
        case '20'
          str=num2str(fc*1000*0.00689,4);
          append(doc,strcat(str,'Mpa')); 
        case '21'
          str=num2str(Pusi60*4.448,4);
          append(doc,strcat(str,'KN'));  
        case '22'
            str=num2str(mu_LB1*100,2);
            append(doc,str);
        case '23'
            str=num2str(mu_LB2*100,2);
            append(doc,str);
        case '24'
            str=num2str(mu_LB3*100,2);
            append(doc,str);
        case '25'
            str=num2str((mu_LB1+0.005)*100,2);
            append(doc,str);
        case '26'
            str=num2str((mu_LB2+0.005)*100,2);
            append(doc,str);
        case '27'
            str=num2str((mu_LB3+0.005)*100,2);
            append(doc,str);
        case '28'
             str=num2str(mu_UB1*100,2);
            append(doc,str);
        case '29'
            str=num2str(mu_UB2*100,2);
            append(doc,str);
        case '30'
            str=num2str(mu_UB3*100,2);
            append(doc,str);
        case '31'
             str=num2str((mu_UB1+0.005)*100,2);
            append(doc,str);
        case '32'
             str=num2str((mu_UB2+0.005)*100,2);
            append(doc,str);
        case '33'
            str=num2str((mu_UB3+0.005)*100,2);
            append(doc,str);
        case '34'
            str=num2str(D(1),4);
           append(doc,strcat(str,'in'));            
        case '35'
            str=num2str(D(1)*25.4,4);
         append(doc,strcat(str,'mm'));
        case '36'
            T = 2*pi*sqrt(L3/386.4);
            str = num2str(floor(T)*3);
            append(doc,str);
         
    end
    moveToNextHole(doc);
end
close(doc);
%rptview('TRIPLE PENDULUM BEARING_5.docx');         

 % Report Generation and Hole filling in MS Word Template_12

 doc=Document('TRIPLE PENDULUM BEARING_Prototype Test','docx','mytemplate_12');
while ~strcmp(doc.CurrentHoleId, '#end#')
    switch doc.CurrentHoleId 
        case 'OC'
            str1=mat2str(temp1(1),3);
            str2=mat2str(temp1(2),2);
            append(doc,strcat('FPT',str1,str2));
        case 'SC1'
            str1=mat2str(temp2(1),2);
            append(doc,str1);
        case 'SC2'
            str1=mat2str(temp2(2),2);
            append(doc,str1);
        case 'IS1'
            str1=mat2str(temp3(1),2);
            append(doc,str1);
        case 'IS2'
            str1=mat2str(temp3(2),2);
            append(doc,str1);
        case '1'
            str = num2str(D(1),3);
            append(doc,str);
        case '2'
            str = num2str(D(1)*25.4,3);
            append(doc,str);
        case '3'
            str = num2str(0.25*D(1),3);
            append(doc,str);
        case '4'
            str = num2str(0.25*D(1)*25.4,3);
            append(doc,str);
        case '5'
            str = num2str(0.5*D(1),3);
            append(doc,str);
        case '6'
            str = num2str(0.5*D(1)*25.4,3);
            append(doc,str);
        case '7'
            str = num2str(D(2),3);
            append(doc,str);
        case '8'
            str = num2str(D(2)*25.4,3);
            append(doc,str);
        case '9'
            str = num2str(1.1*D(2),3);
            append(doc,str);  
        case '10'
            str = num2str(1.1*D(2)*25.4,3);
            append(doc,str);  
        case '11'
            str = num2str(p5(6,1),3);
            append(doc,str);  
        case '12'
            str = num2str(p5(6,1)*25.4,3);
            append(doc,str);
        case '13'
             MCE_uplift = L3 - sqrt(L3^2 - D(2)^2);
             str = num2str(ceil(MCE_uplift));
             append(doc,str);
        case '14'
             str=num2str((Pu(2)),4);
             append(doc,str);
        case '15'
            str = num2str(p5(7,1),3);
            append(doc,str);
        case '16'
             str=num2str(shear_load,4);
             append(doc,str);           
        case '17'
            str = num2str(QC_vert_load);
            append(doc,str);
            
    end
    moveToNextHole(doc);
end
close(doc);
rptview('TRIPLE PENDULUM BEARING_Prototype Test.docx'); 

         


% --- Executes on button press in SIunits.
function SIunits_Callback(hObject, eventdata, handles)
% hObject    handle to SIunits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of SIunits






% --- Executes on button press in AmericanUnits.
function AmericanUnits_Callback(hObject, eventdata, handles)
% hObject    handle to AmericanUnits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AmericanUnits




% --- Executes on button press in Compatibility.
function Compatibility_Callback(hObject, eventdata, handles)
% hObject    handle to Compatibility (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% EXTRACTING DATA FROM THE GUI TO THE PROGRAM
% loading .mat files
load('OuterConcave.mat');
load('SliderConcave.mat');
load('InnerSlider.mat');

% obtaining the value of checkbox
checkbox=getappdata(0,'checkbox');

% finding the lengths of the .mat files
L1=length(OuterConcave(:,1));
L2=length(SliderConcave(:,1));
L3=length(InnerSlider(:,1));

if checkbox == 0
        % getting data from root directory
        n1=getappdata(0,'n1value');
        n2=getappdata(0,'n2value');
        n3=getappdata(0,'n3value');

        % matching the user inputed variables with the dataset
        for i=1:L1
            if strcmp(n1,OuterConcave(i,1))
                temp1=OuterConcave(i,:);
            end
        end

        for i=1:L2
            if strcmp(n2,SliderConcave(i,1))
                temp2=SliderConcave(i,:);
            end
        end

        for i=1:L3
            if strcmp(n3,InnerSlider(i,1))
                temp3=InnerSlider(i,:);
            end
        end
        
        
else 
       % getting data from root directory
         n1=getappdata(0,'n1value');
         n2=getappdata(0,'n2value');
        
        % matching the user inputed variables with the dataset
        for i=1:L1
            if strcmp(n1,OuterConcave(i,1))
                temp1=OuterConcave(i,:);
            end
        end

        for i=1:L2
            if strcmp(n2,SliderConcave(i,1))
                temp2=SliderConcave(i,:);
                temp3=InnerSlider(i,:);
            end
        end
        
       

end 

% CHECK CALCULATIONS
%Storing the data properties of three isolator parts 
temp1=cell2mat(temp1(2:length(OuterConcave(3,:))));
temp2=cell2mat(temp2(2:length(SliderConcave(3,:))));
temp3=cell2mat(temp3(2:length(InnerSlider(3,:))));

%Additional Parameters
overlay= 0.1; % inches
liner=0.1;    % inches

% Calc the total height of the Isolator and other related heights(
% Convention following Stanley's spreadsheet.
Ht= temp3(2) + 2*temp2(5) + 2*temp1(3) + 2*overlay + 2*liner; %height of TP
Hi=temp3(2);                                      % Height of inner slider   
Hs=temp3(2) + 2*temp2(5);                         % Height upto slider conc
dmc=temp1(2);                           % Plan Internal dia of main concave           
dso=temp2(1);                           % plan inner dia of slider concave
dsi=temp2(3);                           % plan outer dia of slider concave
Inner=temp3(1);                         % dia of inner slider
R1=temp2(2);                            % Radius of slider concave
R2=temp1(1);                            % Radius of Main Concave

concave_cut = R2 - sqrt(R2^2 - (dmc/2)^2);
ring_ht = 1.5;
ring_gap = Hi + 2*temp2(5) + 2*overlay + 2*liner - 2*concave_cut - 2*ring_ht ;

% Rotation Capacity
rot_cap = atand(ring_gap/(dmc/2));

if rot_cap > 2.5 
   
    figure;
    A=imread('tick.jpg');
    imshow(A);
    str=mat2str(rot_cap,3);
    title(strcat('The rotational capacity of the bearing =',str,'. The minimum requirement is 2.5 degrees.'));
    
else
    errordlg('The rotational capacity of the selected bearing is less than 2.5 degrees');
end



function Sd1_Callback(hObject, eventdata, handles)
% hObject    handle to Sd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sd1 as text
%        str2double(get(hObject,'String')) returns contents of Sd1 as a double


% --- Executes during object creation, after setting all properties.
function Sd1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sm1_Callback(hObject, eventdata, handles)
% hObject    handle to Sm1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sm1 as text
%        str2double(get(hObject,'String')) returns contents of Sm1 as a double


% --- Executes during object creation, after setting all properties.
function Sm1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sm1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkifSm1.
function checkifSm1_Callback(hObject, eventdata, handles)
% hObject    handle to checkifSm1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkifSm1


% --- Executes on button press in BearingOutputs.
function BearingOutputs_Callback(hObject, eventdata, handles)
% hObject    handle to BearingOutputs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

   Sd1 = str2num(get(handles.Sd1,'String'));
   Sm1 = str2num(get(handles.Sm1,'String'));
   SiteSpectra = getappdata(0,'SiteSpectra');
   
   if isempty(SiteSpectra) == 0
        
        SiteSpectra_all(:,1) = SiteSpectra(:,1);
        SiteSpectra_all(:,2) = SiteSpectra(:,2);
        SiteSpectra_all(:,3) = SiteSpectra(:,1);
        SiteSpectra_all(:,4) = SiteSpectra(:,3);
        SiteSpectra_all(:,5) = SiteSpectra(:,1);
        if get(handles.checkifSm1,'Value') == 1
           SiteSpectra_all(:,6) = SiteSpectra(:,3);
        else
           SiteSpectra_all(:,6) = SiteSpectra(:,2);
        end
        S = [0 0 0];
    
    
  else
        S = [Sd1 Sm1 0];
      if get(handles.checkifSm1,'Value') == 1
          S(3) = Sm1;
      else
          S(3) = Sd1;
      end
       SiteSpectra_all = [0,0,0,0,0,0];
       
  end
  
 fc = str2num(get(handles.fc,'String'));
  
[p,p1,p2,p3,p4,p5,q1,q2,q3,q4,q5,q6,r1,r2,r3,Pu_bearing,Pall_build_bearing,Pall_bridge_bearing]=CompleteBearingCalculations(S,fc,SiteSpectra_all);


p5max = getappdata(0,'p5max');
p4max = getappdata(0,'p4max');
L3 = getappdata(0,'L3');
DBE_resp_vec = getappdata(0,'DBE_resp');
MCE_resp_vec = getappdata(0,'MCE_resp');
DBE_resp_max = max(DBE_resp_vec(:,1));
MCE_resp_max = max(MCE_resp_vec(:,1));
DBE_base_shear = max(DBE_resp_vec(:,2));
MCE_base_shear = max(MCE_resp_vec(:,2));
Vert_rise_DBE = L3 - sqrt(L3^2 - DBE_resp_max^2);
Vert_rise_MCE = L3 - sqrt(L3^2 - MCE_resp_max^2);

disp_vect = {strcat('Dtmc = ',num2str(p5max), 'in'); strcat('Dmc = ',num2str(p4max),'in');strcat('Dd = ',num2str(DBE_resp_max),'in'); strcat('Dm = ',num2str(MCE_resp_max),'in'); strcat('Base Shear for DBE Response = ',num2str(DBE_base_shear));...
             strcat('Base Shear for MCE Response = ',num2str(MCE_base_shear)); strcat('Pu of the bearing = ',num2str(Pu_bearing),'Kips'); strcat('Pall of bearing for buildings = ',num2str(Pall_build_bearing),'Kips'); strcat('Pall of bearing for bridges = ',num2str(Pall_bridge_bearing),'Kips');...
             strcat('Vertical Rise at DBE Response = ',num2str(Vert_rise_DBE,3),'in'); strcat('Vertical Rise at MCE Response = ',num2str(Vert_rise_MCE,3),'in')};

set(handles.majorpropdisp,'string',disp_vect);

axes(handles.hysteresis);
plot(p1(:, 1), p1(:, 2), 'b-', p2(:, 1), p2(:, 2), 'b-', p3(:, 1), p3(:, 2), 'b-', p4(:, 1), p4(:, 2), 'b-', p5(:, 1), p5(:, 2), 'b-'); grid on;
hold on
plot([-p5(7,1)-3 p5(7,1)+3],[0 0],'k');
plot([0 0],[-p5(7,2)-0.03 p5(7,2)+0.03],'k');
title('NOMINAL FORCE-DISPLACEMENT LOOP', 'FontName', 'Arial', 'FontWeight', 'Bold');
xlabel(strcat('Horizontal Displacement (in)'), 'FontName', 'Arial');
ylabel('Normalized Shear', 'FontName', 'Arial');
hold off

axes(handles.bearingdrawing);
plot(q1(:, 1), q1(:, 2), 'k-', q2(:, 1), q2(:, 2), 'k-', q3(:, 1), q3(:, 2), 'k-', q4(:, 1), q4(:, 2), 'k-', q5(:, 1), q5(:, 2), 'k-', q6(:, 1), q6(:, 2), 'k-');
set(gca, 'YTick', []);
set(gca, 'XTick', []);


if ~sum(r1(:,1))==0 && ~sum(r2(:,1))==0 && ~sum(r3(:,1))==0

              axes(handles.Dispdemandcalc);
              plot(r1(:, 1), r1(:, 2), 'r-',r2(:, 1), r2(:, 2), 'b-',r3(:, 1), r3(:, 2), 'g-'); grid on;
              axis([min(r2(:,1)) - 5  max(r2(:,1)) + 5   min(r2(:,2)) - .05  max(r2(:,2)) + .05]);
              title('FORCE-DISPLACEMENT LOOP', 'FontName', 'Arial', 'FontWeight', 'Bold');
              xlabel('Horizontal Displacement (in)', 'FontName', 'Arial');
              ylabel('Normalized Shear', 'FontName', 'Arial');
              h1 = legend('Upper Bound DBE','Lower Bound MCE','EPS Proposed Nominal');
              set(h1,'Location','southeast');
                       
   else
              errordlg('The selected bearing is inadequate for the given design spectrum'); 
end



function ShearLoad_Callback(hObject, eventdata, handles)
% hObject    handle to ShearLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ShearLoad as text
%        str2double(get(hObject,'String')) returns contents of ShearLoad as a double


% --- Executes during object creation, after setting all properties.
function ShearLoad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ShearLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function muUB1_Callback(hObject, eventdata, handles)
% hObject    handle to muUB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of muUB1 as text
%        str2double(get(hObject,'String')) returns contents of muUB1 as a double

mu_UB1 = get(handles.muUB1,'String')
setappdata(0,'mu_UB1',mu_UB1);



% --- Executes during object creation, after setting all properties.
function muUB1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to muUB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function muUB2_Callback(hObject, eventdata, handles)
% hObject    handle to muUB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of muUB2 as text
%        str2double(get(hObject,'String')) returns contents of muUB2 as a double
mu_UB2 = get(handles.muUB2,'String');
setappdata(0,'mu_UB2',mu_UB2);


% --- Executes during object creation, after setting all properties.
function muUB2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to muUB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function muUB3_Callback(hObject, eventdata, handles)
% hObject    handle to muUB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of muUB3 as text
%        str2double(get(hObject,'String')) returns contents of muUB3 as a double

mu_UB3 = get(handles.muUB3,'String');
setappdata(0,'mu_UB3',mu_UB3);


% --- Executes during object creation, after setting all properties.
function muUB3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to muUB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function muLB1_Callback(hObject, eventdata, handles)
% hObject    handle to muLB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of muLB1 as text
%        str2double(get(hObject,'String')) returns contents of muLB1 as a double
mu_LB1 = get(handles.muLB1,'String');
setappdata(0,'mu_LB1',mu_LB1);


% --- Executes during object creation, after setting all properties.
function muLB1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to muLB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function muLB2_Callback(hObject, eventdata, handles)
% hObject    handle to muLB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of muLB2 as text
%        str2double(get(hObject,'String')) returns contents of muLB2 as a double
mu_LB2 = get(handles.muLB2,'String');
setappdata(0,'mu_LB2',mu_LB2);


% --- Executes during object creation, after setting all properties.
function muLB2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to muLB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function muLB3_Callback(hObject, eventdata, handles)
% hObject    handle to muLB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of muLB3 as text
%        str2double(get(hObject,'String')) returns contents of muLB3 as a double
mu_LB3 = get(handles.muLB3,'String');
setappdata(0,'mu_LB3',mu_LB3);


% --- Executes during object creation, after setting all properties.
function muLB3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to muLB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SiteSpectra.
function SiteSpectra_Callback(hObject, eventdata, handles)
% hObject    handle to SiteSpectra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

SiteSpectra = xlsread('client_spectra_input.xlsx');

axes(handles.SiteSpectrumplot);
plot(SiteSpectra(:,1),SiteSpectra(:,2),'b-',SiteSpectra(:,1),SiteSpectra(:,3),'r-');grid on
setappdata(0,'SiteSpectra',SiteSpectra);


% --- Executes on button press in deleteSpectrum.
function deleteSpectrum_Callback(hObject, eventdata, handles)
% hObject    handle to deleteSpectrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rmappdata(0,'SiteSpectra');
cla(handles.SiteSpectrumplot);
