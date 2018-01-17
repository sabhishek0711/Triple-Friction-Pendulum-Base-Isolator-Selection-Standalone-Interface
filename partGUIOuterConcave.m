function varargout = partGUIOuterConcave(varargin)
% PARTGUIOUTERCONCAVE M-file for partGUIOuterConcave.fig
%      PARTGUIOUTERCONCAVE, by itself, creates a new PARTGUIOUTERCONCAVE or raises the existing
%      singleton*.
%
%      H = PARTGUIOUTERCONCAVE returns the handle to a new PARTGUIOUTERCONCAVE or the handle to
%      the existing singleton*.
%
%      PARTGUIOUTERCONCAVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARTGUIOUTERCONCAVE.M with the given input arguments.
%
%      PARTGUIOUTERCONCAVE('Property','Value',...) creates a new PARTGUIOUTERCONCAVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before partGUIOuterConcave_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to partGUIOuterConcave_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help partGUIOuterConcave

% Last Modified by GUIDE v2.5 28-Jul-2015 15:28:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @partGUIOuterConcave_OpeningFcn, ...
                   'gui_OutputFcn',  @partGUIOuterConcave_OutputFcn, ...
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


% --- Executes just before partGUIOuterConcave is made visible.
function partGUIOuterConcave_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to partGUIOuterConcave (see VARARGIN)

% Choose default command line output for partGUIOuterConcave
A=imread('TPpartslabel.jpg');
imshow(A);

handles.output =hObject;


% Initializing Variables

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes partGUIOuterConcave wait for user response (see UIRESUME)
% uiwait(handles.NewPart);


%--- Outputs from this function are returned to the command line.
function varargout = partGUIOuterConcave_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% n1=str2num(get(handles.radius,'string'))
% n2=str2num(get(handles.Thickness,'string'))
% n3=str2num(get(handles.ConcaveDia,'string'))
varargout{1}=handles.output;

% Get default command line output from handles structure


function radius_Callback(hObject, eventdata, handles)
% hObject    handle to radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%n1=str2num(get(handles.radius,'string'));

 

% Hints: get(hObject,'String') returns contents of radius as text
%        str2double(get(hObject,'String')) returns contents of radius as a double


% --- Executes during object creation, after setting all properties.
function radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function Thickness_Callback(hObject, eventdata, handles)
% hObject    handle to Thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%n2=str2num(get(handles.Thickness,'string'));

% Hints: get(hObject,'String') returns contents of Thickness as text
%        str2double(get(hObject,'String')) returns contents of Thickness as a double



% --- Executes during object creation, after setting all properties.
function Thickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function ConcaveDia_Callback(hObject, eventdata, handles)
% hObject    handle to ConcaveDia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%n3=str2num(get(handles.ConcaveDia,'string'));

% Hints: get(hObject,'String') returns contents of ConcaveDia as text
%        str2double(get(hObject,'String')) returns contents of ConcaveDia as a double


% --- Executes during object creation, after setting all properties.
function ConcaveDia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ConcaveDia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Accepts the dimensions of a part
n1=(get(handles.radius,'string'));
n2=(get(handles.ConcaveDia,'string'));
n3=(get(handles.Thickness,'string'));
n4=(get(handles.Weight,'string'));
n5=(get(handles.RingThickness,'string'));
n6=(get(handles.PlanDim,'string'));
n7=(get(handles.Holes,'string'));
n8=(get(handles.HoleDia,'string'));
n9=(get(handles.CenterHoleX,'string'));
n10=(get(handles.CenterHoleY,'string'));
n11=(get(handles.CornerHolesXY1,'string'));
n12=(get(handles.CornerHolesXY2,'string'));
n13=(get(handles.NewName,'string'));
n14=get(handles.edgedim,'string');
n15=get(handles.flangeradius,'string');


%sets the values of n1,n2 and n3 to the root directory for other GUI's to
%access it

setappdata(0,'n1value',n1);
setappdata(0,'n2value',n2);
setappdata(0,'n3value',n3);
setappdata(0,'n4value',n4);
setappdata(0,'n5value',n5);
setappdata(0,'n6value',n6);
setappdata(0,'n7value',n7);
setappdata(0,'n8value',n8);
setappdata(0,'n9value',n9);
setappdata(0,'n10value',n10);
setappdata(0,'n11value',n11);
setappdata(0,'n12value',n12);
setappdata(0,'n13value',n13);
setappdata(0,'n14value',n14);
setappdata(0,'n15value',n15);

uiresume;

function CornerHolesXY2_Callback(hObject, eventdata, handles)
% hObject    handle to CornerHolesXY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CornerHolesXY2 as text
%        str2double(get(hObject,'String')) returns contents of CornerHolesXY2 as a double


% --- Executes during object creation, after setting all properties.
function CornerHolesXY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CornerHolesXY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CornerHolesXY1_Callback(hObject, eventdata, handles)
% hObject    handle to CornerHolesXY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CornerHolesXY1 as text
%        str2double(get(hObject,'String')) returns contents of CornerHolesXY1 as a double


% --- Executes during object creation, after setting all properties.
function CornerHolesXY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CornerHolesXY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CenterHoleY_Callback(hObject, eventdata, handles)
% hObject    handle to CenterHoleY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CenterHoleY as text
%        str2double(get(hObject,'String')) returns contents of CenterHoleY as a double


% --- Executes during object creation, after setting all properties.
function CenterHoleY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CenterHoleY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CenterHoleX_Callback(hObject, eventdata, handles)
% hObject    handle to CenterHoleX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CenterHoleX as text
%        str2double(get(hObject,'String')) returns contents of CenterHoleX as a double


% --- Executes during object creation, after setting all properties.
function CenterHoleX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CenterHoleX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HoleDia_Callback(hObject, eventdata, handles)
% hObject    handle to HoleDia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HoleDia as text
%        str2double(get(hObject,'String')) returns contents of HoleDia as a double


% --- Executes during object creation, after setting all properties.
function HoleDia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HoleDia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Holes_Callback(hObject, eventdata, handles)
% hObject    handle to Holes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Holes as text
%        str2double(get(hObject,'String')) returns contents of Holes as a double


% --- Executes during object creation, after setting all properties.
function Holes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Holes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PlanDim_Callback(hObject, eventdata, handles)
% hObject    handle to PlanDim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlanDim as text
%        str2double(get(hObject,'String')) returns contents of PlanDim as a double


% --- Executes during object creation, after setting all properties.
function PlanDim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlanDim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RingThickness_Callback(hObject, eventdata, handles)
% hObject    handle to RingThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RingThickness as text
%        str2double(get(hObject,'String')) returns contents of RingThickness as a double


% --- Executes during object creation, after setting all properties.
function RingThickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RingThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Weight_Callback(hObject, eventdata, handles)
% hObject    handle to Weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Weight as text
%        str2double(get(hObject,'String')) returns contents of Weight as a double


% --- Executes during object creation, after setting all properties.
function Weight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NewName_Callback(hObject, eventdata, handles)
% hObject    handle to NewName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NewName as text
%        str2double(get(hObject,'String')) returns contents of NewName as a double


% --- Executes during object creation, after setting all properties.
function NewName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NewName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edgedim_Callback(hObject, eventdata, handles)
% hObject    handle to edgedim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edgedim as text
%        str2double(get(hObject,'String')) returns contents of edgedim as a double


% --- Executes during object creation, after setting all properties.
function edgedim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edgedim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function flangeradius_Callback(hObject, eventdata, handles)
% hObject    handle to flangeradius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of flangeradius as text
%        str2double(get(hObject,'String')) returns contents of flangeradius as a double


% --- Executes during object creation, after setting all properties.
function flangeradius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flangeradius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
