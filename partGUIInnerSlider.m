function varargout = partGUIInnerSlider(varargin)
% PARTGUIINNERSLIDER M-file for partGUIInnerSlider.fig
%      PARTGUIINNERSLIDER, by itself, creates a new PARTGUIINNERSLIDER or raises the existing
%      singleton*.
%
%      H = PARTGUIINNERSLIDER returns the handle to a new PARTGUIINNERSLIDER or the handle to
%      the existing singleton*.
%
%      PARTGUIINNERSLIDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARTGUIINNERSLIDER.M with the given input arguments.
%
%      PARTGUIINNERSLIDER('Property','Value',...) creates a new PARTGUIINNERSLIDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before partGUIInnerSlider_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to partGUIInnerSlider_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help partGUIInnerSlider

% Last Modified by GUIDE v2.5 19-Jun-2015 13:55:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @partGUIInnerSlider_OpeningFcn, ...
                   'gui_OutputFcn',  @partGUIInnerSlider_OutputFcn, ...
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


% --- Executes just before partGUIInnerSlider is made visible.
function partGUIInnerSlider_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to partGUIInnerSlider (see VARARGIN)

A=imread('TPpartslabel.jpg');
imshow(A);

% Choose default command line output for partGUIInnerSlider
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes partGUIInnerSlider wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = partGUIInnerSlider_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Diameter_Callback(hObject, eventdata, handles)
% hObject    handle to Diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Diameter as text
%        str2double(get(hObject,'String')) returns contents of Diameter as a double


% --- Executes during object creation, after setting all properties.
function Diameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Radius_Callback(hObject, eventdata, handles)
% hObject    handle to Radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Radius as text
%        str2double(get(hObject,'String')) returns contents of Radius as a double


% --- Executes during object creation, after setting all properties.
function Radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_Callback(hObject, eventdata, handles)
% hObject    handle to Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height as text
%        str2double(get(hObject,'String')) returns contents of Height as a double


% --- Executes during object creation, after setting all properties.
function Height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height (see GCBO)
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


% --- Executes on button press in OK.
function OK_Callback(hObject, eventdata, handles)
% hObject    handle to OK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the dimensions of the part from User
n1=(get(handles.Diameter,'string'));
n2=(get(handles.Height,'string'));
n3=(get(handles.Radius,'string'));
n4=(get(handles.Weight,'string'));
n5=(get(handles.NewPart,'string'));

% Set the values of n1,n2,n3...to the root directory
setappdata(0,'n1value',n1);
setappdata(0,'n2value',n2);
setappdata(0,'n3value',n3);
setappdata(0,'n4value',n4);
setappdata(0,'n5value',n5);

uiresume;
