function varargout = partGUISliderConcave(varargin)
% PARTGUISLIDERCONCAVE M-file for partGUISliderConcave.fig
%      PARTGUISLIDERCONCAVE, by itself, creates a new PARTGUISLIDERCONCAVE or raises the existing
%      singleton*.
%
%      H = PARTGUISLIDERCONCAVE returns the handle to a new PARTGUISLIDERCONCAVE or the handle to
%      the existing singleton*.
%
%      PARTGUISLIDERCONCAVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARTGUISLIDERCONCAVE.M with the given input arguments.
%
%      PARTGUISLIDERCONCAVE('Property','Value',...) creates a new PARTGUISLIDERCONCAVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before partGUISliderConcave_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to partGUISliderConcave_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help partGUISliderConcave

% Last Modified by GUIDE v2.5 18-Jun-2015 18:28:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @partGUISliderConcave_OpeningFcn, ...
                   'gui_OutputFcn',  @partGUISliderConcave_OutputFcn, ...
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


% --- Executes just before partGUISliderConcave is made visible.
function partGUISliderConcave_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to partGUISliderConcave (see VARARGIN)

% Choose default command line output for partGUISliderConcave

A=imread('TPpartslabel.jpg');
imshow(A);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes partGUISliderConcave wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = partGUISliderConcave_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function InsideR_Callback(hObject, eventdata, handles)
% hObject    handle to InsideR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InsideR as text
%        str2double(get(hObject,'String')) returns contents of InsideR as a double


% --- Executes during object creation, after setting all properties.
function InsideR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InsideR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OutsideD_Callback(hObject, eventdata, handles)
% hObject    handle to OutsideD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OutsideD as text
%        str2double(get(hObject,'String')) returns contents of OutsideD as a double


% --- Executes during object creation, after setting all properties.
function OutsideD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OutsideD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InsideD_Callback(hObject, eventdata, handles)
% hObject    handle to InsideD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InsideD as text
%        str2double(get(hObject,'String')) returns contents of InsideD as a double


% --- Executes during object creation, after setting all properties.
function InsideD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InsideD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OutsideR_Callback(hObject, eventdata, handles)
% hObject    handle to OutsideR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OutsideR as text
%        str2double(get(hObject,'String')) returns contents of OutsideR as a double


% --- Executes during object creation, after setting all properties.
function OutsideR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OutsideR (see GCBO)
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


% --- Executes on button press in OK.
function OK_Callback(hObject, eventdata, handles)
% hObject    handle to OK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the dimensions of the part from User
n1=(get(handles.OutsideD,'string'));
n2=(get(handles.InsideR,'string'));
n3=(get(handles.InsideD,'string'));
n4=(get(handles.OutsideR,'string'));
n5=(get(handles.Thickness,'string'));
n6=(get(handles.Weight,'string'));
n7=(get(handles.NewPart,'string'));

% Set the values of n1,n2,n3...to the root directory
setappdata(0,'n1value',n1);
setappdata(0,'n2value',n2);
setappdata(0,'n3value',n3);
setappdata(0,'n4value',n4);
setappdata(0,'n5value',n5);
setappdata(0,'n6value',n6);
setappdata(0,'n7value',n7);

uiresume;


function NewPart_Callback(hObject, eventdata, handles)
% hObject    handle to NewPart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NewPart as text
%        str2double(get(hObject,'String')) returns contents of NewPart as a double


% --- Executes during object creation, after setting all properties.
function NewPart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NewPart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
