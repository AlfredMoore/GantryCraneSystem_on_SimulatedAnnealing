function varargout = longmendiao_4(varargin)
% LONGMENDIAO_4 MATLAB code for longmendiao_4.fig
%      LONGMENDIAO_4, by itself, creates a new LONGMENDIAO_4 or raises the existing
%      singleton*.
%
%      H = LONGMENDIAO_4 returns the handle to a new LONGMENDIAO_4 or the handle to
%      the existing singleton*.
%
%      LONGMENDIAO_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LONGMENDIAO_4.M with the given input arguments.
%
%      LONGMENDIAO_4('Property','Value',...) creates a new LONGMENDIAO_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before longmendiao_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to longmendiao_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help longmendiao_4

% Last Modified by GUIDE v2.5 13-May-2021 19:38:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @longmendiao_4_OpeningFcn, ...
                   'gui_OutputFcn',  @longmendiao_4_OutputFcn, ...
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


% --- Executes just before longmendiao_4 is made visible.
function longmendiao_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to longmendiao_4 (see VARARGIN)

% Choose default command line output for longmendiao_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes longmendiao_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = longmendiao_4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_m0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_m0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_m0 as text
%        str2double(get(hObject,'String')) returns contents of edit_m0 as a double


% --- Executes during object creation, after setting all properties.
function edit_m0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_m0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_m_Callback(hObject, eventdata, handles)
% hObject    handle to edit_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_m as text
%        str2double(get(hObject,'String')) returns contents of edit_m as a double


% --- Executes during object creation, after setting all properties.
function edit_m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_draw.
function pushbutton_draw_Callback(hObject, eventdata, handles)
clc
load_system('longmendiao_3');
% options=simset('SrcWorkspace','current');

                                                        %GUI
m0 = str2double(get(handles.edit_m0,'string'));                            
m  = str2double(get(handles.edit_m,'string'));
g  = str2double(get(handles.edit_g,'string'));
l  = str2double(get(handles.edit_l,'string'));
                                                        %transfer                                                    
K1 = num2str(m0*l);
K2 = num2str((m+m0)*g);
G  = num2str(g);
L  = num2str(l);
                                                        %transfer
set_param('longmendiao_3/get_theta','Denominator',['[' K1 ' 0 ' K2 ']']);
set_param('longmendiao_3/get_position','Numerator',['[' L ' 0 ' G ']']);   
                                                        
inner=sim('longmendiao_3');                             %simulink
x1=inner.data_x.time;
y1=inner.data_x.signals.values;
x2=inner.data_theta.time;
y2=inner.data_theta.signals.values*180/pi;
cla reset                                               
axes(handles.axes5)
yyaxis left                                             
plot(x1,y1,'LineWidth',2)
hold on
ylabel('x/m')
yyaxis right                                            
plot(x2,y2,'lineWidth',2)
ylabel('angle/бу')
xlabel('t/s')
grid on                                                 





% hObject    handle to pushbutton_draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_g_Callback(hObject, eventdata, handles)
% hObject    handle to edit_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_g as text
%        str2double(get(hObject,'String')) returns contents of edit_g as a double


% --- Executes during object creation, after setting all properties.
function edit_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_l_Callback(hObject, eventdata, handles)
% hObject    handle to edit_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_l as text
%        str2double(get(hObject,'String')) returns contents of edit_l as a double


% --- Executes during object creation, after setting all properties.
function edit_l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
