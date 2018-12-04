function varargout = initialconfiguration(varargin)
% INITIALCONFIGURATION MATLAB code for initialconfiguration.fig
%      INITIALCONFIGURATION, by itself, creates a new INITIALCONFIGURATION or raises the existing
%      singleton*.
%
%      H = INITIALCONFIGURATION returns the handle to a new INITIALCONFIGURATION or the handle to
%      the existing singleton*.
%
%      INITIALCONFIGURATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INITIALCONFIGURATION.M with the given input arguments.
%
%      INITIALCONFIGURATION('Property','Value',...) creates a new INITIALCONFIGURATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before initialconfiguration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to initialconfiguration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help initialconfiguration

% Last Modified by GUIDE v2.5 19-Apr-2012 20:27:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @initialconfiguration_OpeningFcn, ...
                   'gui_OutputFcn',  @initialconfiguration_OutputFcn, ...
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


% --- Executes just before initialconfiguration is made visible.
function initialconfiguration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to initialconfiguration (see VARARGIN)
loadcurrentbtn_Callback(hObject, eventdata, handles);
% Choose default command line output for initialconfiguration
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes initialconfiguration wait for user response (see UIRESUME)
% uiwait(handles.iniconfigtag);


% --- Outputs from this function are returned to the command line.
function varargout = initialconfiguration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ipaddresstag_Callback(hObject, eventdata, handles)
% hObject    handle to ipaddresstag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ipaddresstag as text
%        str2double(get(hObject,'String')) returns contents of ipaddresstag as a double


% --- Executes during object creation, after setting all properties.
function ipaddresstag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ipaddresstag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function porttag_Callback(hObject, eventdata, handles)
% hObject    handle to porttag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of porttag as text
%        str2double(get(hObject,'String')) returns contents of porttag as a double


% --- Executes during object creation, after setting all properties.
function porttag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to porttag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samplingratetag_Callback(hObject, eventdata, handles)
% hObject    handle to samplingratetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingratetag as text
%        str2double(get(hObject,'String')) returns contents of samplingratetag as a double


% --- Executes during object creation, after setting all properties.
function samplingratetag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samplingratetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ppltag_Callback(hObject, eventdata, handles)
% hObject    handle to ppltag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ppltag as text
%        str2double(get(hObject,'String')) returns contents of ppltag as a double


% --- Executes during object creation, after setting all properties.
function ppltag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ppltag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function buffersizetag_Callback(hObject, eventdata, handles)
% hObject    handle to buffersizetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of buffersizetag as text
%        str2double(get(hObject,'String')) returns contents of buffersizetag as a double


% --- Executes during object creation, after setting all properties.
function buffersizetag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buffersizetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function displaytimetag_Callback(hObject, eventdata, handles)
% hObject    handle to displaytimetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of displaytimetag as text
%        str2double(get(hObject,'String')) returns contents of displaytimetag as a double


% --- Executes during object creation, after setting all properties.
function displaytimetag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to displaytimetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in savebtn.
function savebtn_Callback(hObject, eventdata, handles)
% hObject    handle to savebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ipaddress=get(handles.ipaddresstag,'String');
port=get(handles.porttag,'String');
samplingrate=get(handles.samplingratetag,'String');
ppl=get(handles.ppltag,'String');
buffersize=get(handles.buffersizetag,'String');
displaytime=get(handles.displaytimetag,'String');
imchannel=[get(handles.channel1tag,'Value'),...
    get(handles.channel2tag,'Value'),...
    get(handles.channel3tag,'Value'),...
    get(handles.channel4tag,'Value')];
thpo=[get(handles.mainaxestag,'Value'),...
    get(handles.newwindowtag,'Value')];
xpscale=[get(handles.xlineartag,'Value'),...
    get(handles.xlogtag,'Value')];
ypscale=[get(handles.ylineartag,'Value'),...
    get(handles.ydbtag,'Value')];
smethod=[get(handles.fftmethodtag,'Value'),...
    get(handles.periodogramtag,'Value'),...
    get(handles.welchmethodtag,'Value')];
configfile='config.ini';
fid=fopen(configfile,'w');
fprintf(fid,'ANYLOGGER 4CH DAQ Initial condition, creation in %s\n',datestr(now));
fprintf(fid,'%s\n',ipaddress);
fprintf(fid,'%s\n',port);
fprintf(fid,'%s\n',samplingrate);
fprintf(fid,'%s\n',ppl);
fprintf(fid,'%s\n',buffersize);
fprintf(fid,'%s\n',displaytime);
fprintf(fid,'%d,%d,%d,%d\n',imchannel);
fprintf(fid,'%d,%d\n',thpo);
fprintf(fid,'%d,%d\n',xpscale);
fprintf(fid,'%d,%d\n',ypscale);
fprintf(fid,'%d,%d,%d\n',smethod);
fclose(fid);

HRDAQ4CH_V1('resetiniconfig_ClickedCallback(hObject, eventdata, handles)')
% HRDAQ4CH_V1('resetiniconfig_ClickedCallback')
close(handles.iniconfigtag);
% --- Executes on button press in cancelbtn.
function cancelbtn_Callback(hObject, eventdata, handles)
% hObject    handle to cancelbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in loadcurrentbtn.
function loadcurrentbtn_Callback(hObject, eventdata, handles)
% hObject    handle to loadcurrentbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
configfile='config.ini';
fid=fopen(configfile,'r');
header=fgetl(fid);
set(handles.lastconfiguredtag,'String',header(50:end));
ipaddress=fgetl(fid);
set(handles.ipaddresstag,'String',ipaddress);
port=fgetl(fid);
set(handles.porttag,'String',port);
samplingrate=fgetl(fid);
set(handles.samplingratetag,'String',samplingrate);
ppl=fgetl(fid);
set(handles.ppltag,'String',ppl);
buffersize=fgetl(fid);
set(handles.buffersizetag,'String',buffersize);
displaytime=fgetl(fid);
set(handles.displaytimetag,'String',displaytime);

simchannel=fgetl(fid);
eval(['imchannel=[',simchannel,'];']);
set(handles.channel1tag,'Value',imchannel(1));
set(handles.channel2tag,'Value',imchannel(2));
set(handles.channel3tag,'Value',imchannel(3));
set(handles.channel4tag,'Value',imchannel(4));

sthpo=fgetl(fid);
eval(['thpo=[',sthpo,'];']);
set(handles.mainaxestag,'Value',thpo(1));
set(handles.newwindowtag,'Value',thpo(2));

sxpscale=fgetl(fid);
eval(['xpscale=[',sxpscale,'];']);
set(handles.xlineartag,'Value',xpscale(1));
set(handles.xlogtag,'Value',xpscale(2));

sypscale=fgetl(fid);
eval(['ypscale=[',sypscale,'];']);
set(handles.ylineartag,'Value',ypscale(1));
set(handles.ydbtag,'Value',ypscale(2));

ssmethod=fgetl(fid);
eval(['smethod=[',ssmethod,'];']);
set(handles.fftmethodtag,'Value',smethod(1));
set(handles.periodogramtag,'Value',smethod(2));
set(handles.welchmethodtag,'Value',smethod(3));

fclose(fid);
