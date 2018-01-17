function varargout = CompleteDatabaseGUI(varargin)
% COMPLETEDATABASEGUI M-file for CompleteDatabaseGUI.fig
%      COMPLETEDATABASEGUI, by itself, creates a new COMPLETEDATABASEGUI or raises the existing
%      singleton*.
%
%      H = COMPLETEDATABASEGUI returns the handle to a new COMPLETEDATABASEGUI or the handle to
%      the existing singleton*.
%
%      COMPLETEDATABASEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPLETEDATABASEGUI.M with the given input arguments.
%
%      COMPLETEDATABASEGUI('Property','Value',...) creates a new COMPLETEDATABASEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CompleteDatabaseGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CompleteDatabaseGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CompleteDatabaseGUI

% Last Modified by GUIDE v2.5 19-Jun-2015 17:44:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CompleteDatabaseGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @CompleteDatabaseGUI_OutputFcn, ...
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


% --- Executes just before CompleteDatabaseGUI is made visible.
function CompleteDatabaseGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CompleteDatabaseGUI (see VARARGIN)

% Loading the values in the list box
load('OuterConcave.mat');
temp=OuterConcave;
L=length(temp(:,1));
set(handles.OuterConcave,'String',temp(3:L,1));


load('SliderConcave.mat');
temp=SliderConcave;
L=length(temp(:,1));
set(handles.SliderConcave,'String',temp(2:L,1));


load('InnerSlider.mat');
temp=InnerSlider;
L=length(temp(:,1));
set(handles.InnerSlider,'String',temp(2:L,1));



% Choose default command line output for CompleteDatabaseGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

uiresume;

% UIWAIT makes CompleteDatabaseGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CompleteDatabaseGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in OuterConcave.
function OuterConcave_Callback(hObject, eventdata, handles)
% hObject    handle to OuterConcave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% Hints: contents = cellstr(get(hObject,'String')) returns OuterConcave contents as cell array
%        contents{get(hObject,'Value')} returns selected item from OuterConcave


% --- Executes during object creation, after setting all properties.
function OuterConcave_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OuterConcave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SliderConcave.
function SliderConcave_Callback(hObject, eventdata, handles)
% hObject    handle to SliderConcave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SliderConcave contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SliderConcave


% --- Executes during object creation, after setting all properties.
function SliderConcave_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderConcave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in InnerSlider.
function InnerSlider_Callback(hObject, eventdata, handles)
% hObject    handle to InnerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns InnerSlider contents as cell array
%        contents{get(hObject,'Value')} returns selected item from InnerSlider


% --- Executes during object creation, after setting all properties.
function InnerSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InnerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
