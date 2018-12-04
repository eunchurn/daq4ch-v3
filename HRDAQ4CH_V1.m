function varargout = HRDAQ4CH_V1(varargin)
% HRDAQ4CH_V1 MATLAB code for HRDAQ4CH_V1.fig
%      HRDAQ4CH_V1, by itself, creates a new HRDAQ4CH_V1 or raises the existing
%      singleton*.
%
%      H = HRDAQ4CH_V1 returns the handle to a new HRDAQ4CH_V1 or the handle to
%      the existing singleton*.
%
%      HRDAQ4CH_V1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HRDAQ4CH_V1.M with the given input arguments.
%
%      HRDAQ4CH_V1('Property','Value',...) creates a new HRDAQ4CH_V1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HRDAQ4CH_V1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HRDAQ4CH_V1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HRDAQ4CH_V1

% Last Modified by GUIDE v2.5 09-Jul-2012 14:01:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @HRDAQ4CH_V1_OpeningFcn, ...
    'gui_OutputFcn',  @HRDAQ4CH_V1_OutputFcn, ...
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
% save aaa

% --- Executes just before HRDAQ4CH_V1 is made visible.
function HRDAQ4CH_V1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HRDAQ4CH_V1 (see VARARGIN)

% set(handles.titleaxes,'XTick',[]);
% set(handles.titleaxes,'YTick',[]);
% set(handles.titleaxes,'XTickLabel',[]);
% set(handles.titleaxes,'YTickLabel',[]);
% set(handles.titleaxes,'XColor',[1 1 1]);
% set(handles.titleaxes,'YColor',[1 1 1]);

% axes(handles.backgroundaxes)
% imshow('background.png');
[titlecd,maptitle,alphatitle]=imread('title.png','BackgroundColor','none');
% titlehandle=image(title,'Parent',handles.titleaxes);
% set(titlehandle,'AlphaData',alphatitle);
% axis(handles.titleaxes,'off')
% set(handles.titleaxes,'XTickLabel',[],'YTickLabel',[])
set(handles.titletag,'CData',titlecd);

% [logo,maplogo,alphalogo]=imread('logo.png','BackgroundColor','none');
% logohandle=image(logo,'Parent',handles.logoaxes);
% set(logohandle,'AlphaData',alphalogo);
% axis(handles.logoaxes,'off')
% set(handles.logoaxes,'XTickLabel',[],'YTickLabel',[])

[timemode,maptimemode,alphadtimemode]=imread('timedomain.png','BackgroundColor','none');
[freqmode,mapfreqmode,alphadfreqmode]=imread('frequencydomain.png','BackgroundColor','none');
set(handles.displaymodebtn,'Value',0);
set(handles.displaymodebtn,'CData',timemode);
% [timecdata,timemap] = imread('timedomain.png','BackgroundColor','none');
% if ~isempty(timemap) 
%    timecdata = ind2rgb(timecdata, timemap); 
% end
% [freqcdata,freqmap] = imread('frequencydomain.png','BackgroundColor','none');
% if ~isempty(freqmap) 
%    freqcdata = ind2rgb(freqcdata, freqmap); 
% end
% timecdata=iconRead('timedomain.png',1);

% set(handles.displaymodebtn,'Value',0);
% displaymodehandle=image(timemode,'Parent',handles.displaymodeaxes);
% set(displaymodehandle,'AlphaData',alphadtimemode);
% axis(handles.displaymodeaxes,'off');
% set(handles.displaymodeaxes,'XTickLabel',[],'YTickLabel',[]);

xlim(handles.mainaxes,[0 10]);
xlabel('Time (second)','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
ylabel('Measured voltage in V','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
set(handles.mainaxes,'YGrid','on','XGrid','on');

% set(handles.popupmenu1,'String',{'Channel 1','Channel 2','Channel 3','Channel 4'});
set(handles.timehistorybtn,'UserData',[]);
configfile='config.ini';
[fid,m]=fopen(configfile,'r');
if isempty(m)
    header=fgetl(fid);
    % set(handles.lastconfiguredtag,'String',header(50:end));
    ipaddress=fgetl(fid);
    set(handles.ipaddress,'String',ipaddress);
    port=fgetl(fid);
    set(handles.portnumber,'String',port);
    sampling=fgetl(fid);
    set(handles.samplingrate,'String',sampling);
    ppl=fgetl(fid);
    set(handles.ppltag,'String',ppl);
    buffersize=fgetl(fid);
    set(handles.buffersizetag,'String',buffersize);
    displaytime=fgetl(fid);
    set(handles.blocktimetag,'String',displaytime);
    
    simchannel=fgetl(fid);
    eval(['imchannel=[',simchannel,'];']);
    set(handles.chbox1,'Value',imchannel(1));
    set(handles.chbox2,'Value',imchannel(2));
    set(handles.chbox3,'Value',imchannel(3));
    set(handles.chbox4,'Value',imchannel(4));
    
    sthpo=fgetl(fid);
    eval(['thpo=[',sthpo,'];']);
    set(handles.thnopopupbtn,'Value',thpo(1));
    set(handles.thyespopupbtn,'Value',thpo(2));
    
    sxpscale=fgetl(fid);
    eval(['xpscale=[',sxpscale,'];']);
    set(handles.xlinearbtn,'Value',xpscale(1));
    set(handles.xlogbtn,'Value',xpscale(2));
    
    sypscale=fgetl(fid);
    eval(['ypscale=[',sypscale,'];']);
    set(handles.ylinearbtn,'Value',ypscale(1));
    set(handles.ydbbtn,'Value',ypscale(2));
    
    ssmethod=fgetl(fid);
    eval(['smethod=[',ssmethod,'];']);
    set(handles.fftmethod,'Value',smethod(1));
    set(handles.periodogrammethod,'Value',smethod(2));
    set(handles.welchmethod,'Value',smethod(3));
    
    fclose(fid);
else
    mssgs=get(handles.mssgbox,'String');
    mssgs{end+1}=['config.ini : ',m];
    set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
end






% Choose default command line output for HRDAQ4CH_V1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HRDAQ4CH_V1 wait for user response (see UIRESUME)
% uiwait(handles.uimain);


% --- Outputs from this function are returned to the command line.
function varargout = HRDAQ4CH_V1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ipaddress_Callback(hObject, eventdata, handles)
% hObject    handle to ipaddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ipaddress as text
%        str2double(get(hObject,'String')) returns contents of ipaddress as a double


% --- Executes during object creation, after setting all properties.
function ipaddress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ipaddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function portnumber_Callback(hObject, eventdata, handles)
% hObject    handle to portnumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of portnumber as text
%        str2double(get(hObject,'String')) returns contents of portnumber as a double


% --- Executes during object creation, after setting all properties.
function portnumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to portnumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in connectbtn.
function connectbtn_Callback(hObject, eventdata, handles)
% hObject    handle to connectbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ipaddress=get(handles.ipaddress,'String');
port=str2num(get(handles.portnumber,'String'));
connectid=get(handles.connectbtn,'Value');
buffersizeMB=str2num(get(handles.buffersizetag,'String'));
if ~isempty(ipaddress)
    if ~isempty(port)
        if ~isempty(buffersizeMB)
            if connectid
                try
%                     delete(instrfind);
                    delete(instrfind('RemoteHost',ipaddress));
                    buffersize=buffersizeMB*2^20;
%                     u=get(handles.connectbtn,'UserData');
%                     if isempty(u)
                        u=udp(ipaddress,port,'LocalPort',port,...
                            'InputBufferSize',buffersize,'DatagramTerminateMode','off');
%                     end
                    if all(u.Status=='closed');
                        fopen(u);
                    end
                    set(handles.buffersize,'String',num2str(buffersize/1024/1024));
                    set(handles.connectbtn,'String','Disconnect');
                    mssgs=get(handles.mssgbox,'String');
                    mssgs{end+1}=['UDP connection : ',u.Status];
                    set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                    set(handles.connectbtn,'UserData',u);
                catch me
                    mssgs=get(handles.mssgbox,'String');
                    mssgs{end+1}=['UDP connection failed'];
                    mssgs{end+1}=['check connection or restart program'];
                    set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                    set(handles.connectbtn,'Value',0);
                    save connectionlog;
                end
            else
                %             set(handles.startbtn,'Value',0)
                %             set(handles.startbtn,'String','Start');
                u=get(handles.connectbtn,'UserData');
                if ~isempty(u)
                    fwrite(u,int8([115 101 13 10]));
                end
                if all(u.Status=='open')
                    fclose(u);
%                     delete(u);
                end
                set(handles.connectbtn,'String','Connect');
                mssgs=get(handles.mssgbox,'String');
                mssgs{end+1}=['UDP connection : ',u.Status];
                set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                %             delete(u);
                %             set(handles.connectbtn,'UserData',u);
                
            end
        end
    end
end
% --- Executes on button press in startbtn.
function startbtn_Callback(hObject, eventdata, handles)
% hObject    handle to startbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
u=get(handles.connectbtn,'UserData');
% savedatatag=get(handles.savedatatag,'Value');
Fs=str2num(get(handles.samplingrate,'String'));
blocktime=str2num(get(handles.blocktimetag,'String'));
ppl=str2num(get(handles.ppltag,'String'));
buffersizeMB=str2num(get(handles.buffersizetag,'String'));
if get(handles.connectbtn,'Value')
    if ~isempty(u)
        if ~isempty(Fs)
            if ~isempty(blocktime)
                if ~isempty(ppl)
                    if ~isempty(buffersizeMB)
                        %                         set(u,'InputBufferSize',buffersizeMB*2^20);
                        %     mssgs=get(handles.mssgbox,'String');
                        %     mssgs{end+1}=u.Status;
                        %     set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                        %     fclose(u);
                        startid=get(handles.startbtn,'Value');
                        if startid
                            set(handles.startbtn,'String','Stop');
                            mssgs=get(handles.mssgbox,'String');
                            mssgs{end+1}='Measurement started';
                            set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                            %         if savedatatag
                            filename=['HRDAQ4CH-',datestr(now,'YYYYmmddHHMMSS'),'.temp'];
                            mssgs=get(handles.mssgbox,'String');
                            mssgs{end+1}=filename;
                            set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                            
                            % MAT File write (header)
                            [n,d]=weekday(now);
                            hdate=datestr(now,'mmm dd HH:MM:SS YYYY');
                            usrheader=['MATLAB 5.0 MAT-file, Platform: ',computer,', Created on: ',d,' ',hdate,', DAQVendor :KM, DAQ : 4CH ANYLOGGER'];
                            [hr,hc]=size(usrheader);
                            uheader=[usrheader,char(ones(1,124-hc)*32)];
                            
                            rversion=[0 1];
                            rendian='IM';
                            
                            unit='voltage';
                            unittag=[14,64];
                            unitflag=[6,8,4,0];
                            unitdimtag=[5,8];
                            unitdim=size(unit);
                            unitnametag=[1,4];
                            unitname='unit';
                            unitdatatag=[4,unitdim(2)*2];
                            unitdata='v o l t a g e   ';
                            
                            Fstag=[14,48];
                            Fsflag=[6,8,6,0]; % 16
                            Fsdimtag=[5,8]; % 8
                            Fsdim=[1,1]; % 8
                            Fsnametag=[1,2]; % 4
                            Fsname='Fs  '; % 4
                            Fsdatatag=[2,1]; % 8
                            Fsdata=Fs; % 4
                                                        
                            % wheader=cast(uheader,'char');
                            if ~isdir(fullfile(tempdir,'ANYLOGGER4CH'))
                                mkdir(fullfile(tempdir,'ANYLOGGER4CH'));
                            end
                            fid=fopen(fullfile(tempdir,'ANYLOGGER4CH',filename),'wb');
                            fwrite(fid,uheader','uint8');
                            fwrite(fid,rversion,'uint8');
                            fwrite(fid,rendian,'uint8');
                            fwrite(fid,unittag,'int32');
                            fwrite(fid,unitflag,'int32');
                            fwrite(fid,unitdimtag,'int32');
                            fwrite(fid,unitdim,'int32');
                            fwrite(fid,unitnametag,'int16');
                            fwrite(fid,unitname,'char');
                            fwrite(fid,unitdatatag,'int32');
                            fwrite(fid,unitdata,'char');
                            fwrite(fid,Fstag,'int32');
                            fwrite(fid,Fsflag,'int32');
                            fwrite(fid,Fsdimtag,'int32');
                            fwrite(fid,Fsdim,'int32');
                            fwrite(fid,Fsnametag,'int16');
                            fwrite(fid,Fsname,'char');
                            fwrite(fid,Fsdatatag,'int16');
                            fwrite(fid,Fsdata,'int32');
                            
                            % ftell(fid)
                            
                            sigMATRIX=14;
                            sigBYTES=56+32;
                            sigtag=[6,8,6,0];
                            dimtag=[5,8];
                            dimINT=4;
                            dimii=1; dim32ii=32;
                            nametag=[1,6];
                            arrayname='signal  ';
                            dataDOUBLE=9;
                            inidata=[0 0 0 0];
                            fwrite(fid,sigMATRIX,'int32');
                            fwrite(fid,sigBYTES,'int32');
                            fwrite(fid,sigtag,'int32');
                            fwrite(fid,dimtag,'int32');
                            fwrite(fid,dimINT,'int32');
                            fwrite(fid,dimii,'int32');
                            fwrite(fid,nametag,'int32');
                            fwrite(fid,arrayname,'char');
                            fwrite(fid,dataDOUBLE,'int32');
                            fwrite(fid,dim32ii,'int32');
                            %         end
                            ii=0;
                            adgain=5/2^23;
                            cnt=100;
                            plotHandle = plot(handles.mainaxes,0,0,'Marker','.',...
                                'LineWidth',1,'Color',[1 1 1]);
                            
                            xlabel('Time (second)','FontWeight','bold','FontSize',14,...
                                'Color',[0 0 0],'Parent',handles.mainaxes);
                            ylabel('Measured voltage in V','FontWeight','bold','FontSize',14,...
                                'Color',[0 0 0],'Parent',handles.mainaxes);
                            set(handles.mainaxes,'YGrid','on','XGrid','on',...
                                'Color',[0 0 0],'XColor',[0.314 0.314 0.314],'YColor',[0.314 0.314 0.314]);
                            fwrite(u,int8([115 115 13 10]));
                            set(u,'UserData',1);
                            
                            curdata=[];
                            pview=1;
                            pi=0;
                            stx=2;
                            count=1;
                            barpos=[20 20 200 20];
                            waitbh=uiwaitbar(barpos);
                            while 1
                                %             tic
                                pchid=[get(handles.chbox1,'Value'),...
                                    get(handles.chbox2,'Value'),...
                                    get(handles.chbox3,'Value'),...
                                    get(handles.chbox4,'Value')];
                                
                                if pchid(1)
                                    set(handles.chbox2,'Value',0);
                                    set(handles.chbox3,'Value',0);
                                    set(handles.chbox4,'Value',0);
                                    pview=1;pch=1;
                                end
                                if pchid(2)
                                    set(handles.chbox1,'Value',0);
                                    set(handles.chbox3,'Value',0);
                                    set(handles.chbox4,'Value',0);
                                    pview=1;pch=2;
                                end
                                if pchid(3)
                                    set(handles.chbox1,'Value',0);
                                    set(handles.chbox2,'Value',0);
                                    set(handles.chbox4,'Value',0);
                                    pview=1;pch=3;
                                end
                                if pchid(4)
                                    set(handles.chbox1,'Value',0);
                                    set(handles.chbox2,'Value',0);
                                    set(handles.chbox3,'Value',0);
                                    pview=1;pch=4;
                                end
                                if sum(pchid)==0
                                    pview=0;
                                end
                                set(handles.bufferratio,'String',num2str(u.BytesAvailable/u.InputBufferSize*100,'%.4f'));
                                uiwaitbar(waitbh,u.BytesAvailable/u.InputBufferSize);
                                
                                if u.BytesAvailable>=26*ppl
                                    
                                    bdata=fread(u,26*ppl);
                                    blockdata=buffer(bdata,26);
                                    [r,c]=size(blockdata);
                                    for kk=1:c
                                        adcount=blockdata(6,kk)+blockdata(7,kk)*2^8+blockdata(8,kk)*2^16+blockdata(9,kk)*2^24;
                                        if adcount
                                            ii=ii+1;
                                            ba(ii)=u.BytesAvailable;
                                            stx=blockdata(1,kk);
                                            
                                            adtime(ii)=blockdata(2,kk)+blockdata(3,kk)*2^8+blockdata(4,kk)*2^16+blockdata(5,kk)*2^24;
                                            count(ii)=adcount;
                                            for jj=1:4
                                                adval(jj)=blockdata(jj*4+6,kk)+blockdata(jj*4+7,kk)*2^8+blockdata(jj*4+8,kk)*2^16+blockdata(jj*4+9,kk)*2^24;
                                            end
                                            adval(adval>=2^23)=adval(adval>=2^23)-2^24;
                                            data=adval*adgain;
                                            
                                            pi=pi+1;
                                            if ii/Fs<=blocktime
                                                t=[1:ii]/Fs;
                                                curdata=[curdata data'];
                                            else
                                                t=[ii-blocktime*Fs+1:ii]/Fs;
                                                curdata=[curdata(:,2:end) data'];
                                                %                         curdata=curdata(:,2:end);
                                            end
                                            %                     if pi>200
                                            
                                            %                         pi=0;
                                            %                     end
                                            %                     etx(ii)=blockdata(26,kk);
                                            %                     if savedatatag
                                            fseek(fid,0,'eof');
                                            fwrite(fid,data,'double');
                                            sigBYTES=56+32*ii;
                                            dimii=ii;
                                            dim32ii=32*ii;
                                            fseek(fid,260,'bof');
                                            fwrite(fid,sigBYTES,'int32');
                                            fseek(fid,292,'bof');
                                            fwrite(fid,dimii,'int32');
                                            fseek(fid,316,'bof');
                                            fwrite(fid,dim32ii,'int32');
                                        end
                                        %                     end
                                    end
                                    if pview
                                        try
                                            if get(handles.displaymodebtn,'Value')
                                                nfft=2^nextpow2(length(curdata(pch,:)));
                                                df=Fs/nfft;
                                                Fw=0:df:Fs-df;
                                                if get(handles.detrendbtn,'Value')
                                                    if get(handles.welchmethod,'Value')
                                                        [Pxx,F]=pwelch(detrend(curdata(pch,:)),[],[],nfft,Fs);
                                                    end
                                                    if get(handles.periodogrammethod,'Value')
                                                        [Pxx,F]=periodogram(detrend(curdata(pch,:)),[],nfft,Fs);
                                                    end
                                                    if get(handles.fftmethod,'Value')
                                                        Pxxtemp=abs(fft(detrend(curdata(pch,:)),nfft)).^2/length(curdata(pch,:))/Fs;
                                                        Pxx=Pxxtemp(1:length(Pxxtemp)/2);
                                                        F=Fw(1:length(Pxxtemp)/2);
                                                    end
                                                    
                                                else
                                                    if get(handles.welchmethod,'Value')
                                                        [Pxx,F]=pwelch(curdata(pch,:),[],[],nfft,Fs);
                                                    end
                                                    if get(handles.periodogrammethod,'Value')
                                                        [Pxx,F]=periodogram(curdata(pch,:),[],nfft,Fs);
                                                    end
                                                    if get(handles.fftmethod,'Value')
                                                        Pxxtemp=abs(fft(curdata(pch,:),nfft)).^2/length(curdata(pch,:))/Fs;
                                                        Pxx=Pxxtemp(1:length(Pxxtemp)/2);
                                                        F=Fw(1:length(Pxxtemp)/2);
                                                    end
                                                end
                                                if get(handles.ydbbtn,'Value')
                                                    set(plotHandle,'YData',pow2db(Pxx),'XData',F);
                                                    xlabel('Frequency (Hz)','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
                                                    ylabel({'Power Spectrum';'Power/frequency (dB/Hz)'},'FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
                                                else
                                                    set(plotHandle,'YData',Pxx,'XData',F);
                                                    xlabel('Frequency (Hz)','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
                                                    ylabel({'Power Spectrum';'Squared voltage/frequency (V_{RMS}^2/Hz)'},...
                                                        'FontName','Helvetica','FontWeight','bold','FontSize',14,'Color',[0 0 0],...
                                                        'Parent',handles.mainaxes);
                                                end
                                                if get(handles.xlogbtn,'Value')
                                                    set(handles.mainaxes,'XScale','log');
                                                else
                                                    set(handles.mainaxes,'XScale','linear');
                                                end
                                                if length(F)~=1
                                                    xlim(handles.mainaxes,[F(1) F(end)]);
                                                end
                                            else
                                                
                                                set(plotHandle,'YData',curdata(pch,:),'XData',t);
                                                set(handles.mainaxes,'XScale','linear');
                                                xlabel('Time (second)','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
                                                ylabel('Measured voltage in V','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
                                                if length(t)~=1
                                                    xlim(handles.mainaxes,[t(1) t(end)]);
                                                end
                                            end
                                        catch me
                                            save errlog
                                        end
                                    end
                                    
                                else
                                    if ~get(u,'UserData')
                                        set(handles.startbtn,'Value',0);
                                    end
                                end
                                if stx~=2
                                    mssgs=get(handles.mssgbox,'String');
                                    mssgs{end+1}='!UDP Buffer overflow';
                                    mssgs{end+1}='!set larger PPL size';
                                    set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                                    set(handles.startbtn,'Value',0)
                                end
                                if ~get(handles.startbtn,'Value')
                                    fwrite(u,int8([115 101 13 10]));
                                    %             if ii>1000
                                    %                 if savedatatag
                                    fclose(fid);
                                    %                 end
                                    
                                    try
                                        load(fullfile(tempdir,'ANYLOGGER4CH',filename),'-mat');
                                        
                                        delete(fullfile(tempdir,'ANYLOGGER4CH',filename));
%                                         if isdir(fullfile(tempdir,'ANYLOGGER4CH'))
%                                             rmdir(fullfile(tempdir,'ANYLOGGER4CH'));
%                                         end
                                        sdata.Fs=Fs;
                                        sdata.signal=signal';
                                        sdata.unit=unit;
                                        sdata.count=count;
                                        sdata.time=adtime;
                                        %                 save data data;
                                        set(handles.timehistorybtn,'UserData',sdata);
                                        set(handles.startbtn,'String','Start');
                                        mssgs=get(handles.mssgbox,'String');
                                        mssgs{end+1}='Measurement stopped';
                                        set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                                    catch me
                                        delete(filename);
                                        set(handles.startbtn,'String','Start');
                                        save errlog;
                                    end
                                    %                 set(handles.connectbtn,'Value',0);
                                    %                 connectbtn_Callback(hObject, eventdata, handles);
                                    break;
                                end
                                set(handles.uimain,'Visible','on');
                                %             toc;
                            end
                            
                        else
                            set(handles.startbtn,'String','Start');
                            mssgs=get(handles.mssgbox,'String');
                            mssgs{end+1}='Stopped';
                            set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                            mssgs=get(handles.mssgbox,'String');
                            
                            %         mssgs{end+1}=u.Status;
                            %         set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
                        end
                    end
                end
            end
        end
    else
        set(handles.startbtn,'Value',0);
        mssgs=get(handles.mssgbox,'String');
        mssgs{end+1}='Not connected : no UDP object';
        set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
    end
else
    set(handles.startbtn,'Value',0);
    mssgs=get(handles.mssgbox,'String');
    mssgs{end+1}='Not connected';
    set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
end
% save temp;

% --- Executes on button press in loaddatabtn.
function loaddatabtn_Callback(hObject, eventdata, handles)
% hObject    handle to loaddatabtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
    {'*.mat','MAT-files (*.mat)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Load Data', ...
    'MultiSelect', 'off');
if isequal(filename,0) || isequal(pathname,0)
    mssgs=get(handles.mssgbox,'String');
    mssgs{end+1}='User selected Cancel';
    set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
else
    load(fullfile(pathname,filename));
    if ~isempty(data)
        set(handles.timehistorybtn,'UserData',data);
        if isfield(data,'Fs')
            curFs=get(handles.samplingrate,'String');
            set(handles.samplingrate,'String',num2str(data.Fs));
            mssgs=get(handles.mssgbox,'String');
            mssgs{end+1}='Sampling rate has changed';
            mssgs{end+1}=[' : ',curFs,'(Hz) -> ',num2str(data.Fs),'(Hz)'];
            set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
        else
            mssgs=get(handles.mssgbox,'String');
            mssgs{end+1}='There are no ''sampling rate'' field in data';
            set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
        end
        
        %         set(handles.packetloss,'UserData',data(5).index);
        mssgs=get(handles.mssgbox,'String');
        mssgs{end+1}=['Loaded : ',fullfile(pathname,filename)];
        set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
    else
        mssgs=get(handles.mssgbox,'String');
        mssgs{end+1}='There are no data';
        set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
    end
end

% --- Executes on button press in savedatabtn.
function savedatabtn_Callback(hObject, eventdata, handles)
% hObject    handle to savedatabtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.timehistorybtn,'UserData');
% data=get(handles.measurement,'UserData');
if ~isempty(data)
    defaultfile=['HRDATA_',datestr(now,'yyyymmdd_HHMMSS')];
    [filename, pathname, filterindex] = uiputfile( ...
        {'*.mat','MAT-files (*.mat)';...
        '*.dat','Data Ascii file (*.dat)';...
        '*.fig','Figures (*.fig)';...
        '*.*',  'All Files (*.*)'},...
        'Save as',defaultfile);
    if isequal(filename,0) || isequal(pathname,0)
        mssgs=get(handles.mssgbox,'String');
        mssgs{end+1}='User selected Cancel';
        set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
    else
        save(fullfile(pathname,filename),'data');
        mssgs=get(handles.mssgbox,'String');
        mssgs{end+1}=['Saved : ',fullfile(pathname,filename)];
        set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
    end
end
% --- Executes on button press in timehistorybtn.
function timehistorybtn_Callback(hObject, eventdata, handles)
% hObject    handle to timehistorybtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~get(handles.startbtn,'Value')
    data=get(handles.timehistorybtn,'UserData');
    
    if ~isempty(data)
        [r,c]=size(data.signal);
        t=0:1/data.Fs:(r-1)/data.Fs;
        selch=1:4;
        selchstr={'Channel 1','Channel 2','Channel 3','Channel 4'};
        chsel(1)=get(handles.chbox1,'Value');
        chsel(2)=get(handles.chbox2,'Value');
        chsel(3)=get(handles.chbox3,'Value');
        chsel(4)=get(handles.chbox4,'Value');
        corder=[1 1 1;1 0 0;0.75 0 0.75;0 0 1];
        selch=selch(chsel~=0);
        selchstr=selchstr(selch);
        if ~isempty(selch)
            set(0,'DefaultAxesColorOrder',corder);
            if get(handles.detrendbtn,'Value')
                h=plot(handles.mainaxes,t,detrend(data.signal(:,selch)));
            else
                h=plot(handles.mainaxes,t,data.signal(:,selch));
            end
            xlabel('Time (second)','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
            ylabel('Measured voltage in V','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
            %         set(handles.mainaxes,'YGrid','on','XGrid','on');
            set(handles.mainaxes,'YGrid','on','XGrid','on',...
                'Color',[0 0 0],'XColor',[0.314 0.314 0.314],'YColor',[0.314 0.314 0.314]);
            xlim(handles.mainaxes,[t(1) t(end)]);
            thleg1=legend(handles.mainaxes,selchstr,'Orientation','Horizontal','Location','South');
            set(thleg1,'TextColor',[1 1 1],'Color',[0.2 0.2 0.2])
            
            if get(handles.thyespopupbtn,'Value')
                scrsz = get(0,'ScreenSize');
                figW=640;
                figH=480;
                figure('Name','Time History',...
                    'Color',[0 0 0],...
                    'Position',[scrsz(3)/2-figW/2 scrsz(4)/2-figH/2 figW figH])
                axes
                set(0,'DefaultAxesColorOrder',corder);
                nh=copyobj(h,gca);
                xlabel('Time (second)','FontWeight','bold','FontSize',14,'Color',[0 0 0]);
                ylabel('Measured voltage in V','FontWeight','bold','FontSize',14,'Color',[0 0 0]);
                set(gca,'YGrid','on','XGrid','on');
                xlim(gca,[t(1) t(end)]);
                legend(selchstr,'Orientation','Horizontal','Location','South',...
                    'Color',[0.2 0.2 0.2]);
                set(gca,'YGrid','on','XGrid','on',...
                    'Color',[0 0 0],'XColor',[0.7 0.7 0.7],'YColor',[0.7 0.7 0.7]);
            end
                    colordef white;
        end
        
    end
else
    set(handles.displaymodebtn,'Value',0);
    HRDAQ4CH_V1('displaymodebtn_Callback',hObject,eventdata,guidata(hObject));
end
% save temp;

% --- Executes on button press in psdbtn.
function psdbtn_Callback(hObject, eventdata, handles)
% hObject    handle to psdbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~get(handles.startbtn,'Value')
    data=get(handles.timehistorybtn,'UserData');
    Fs=str2num(get(handles.samplingrate,'String'));
    if ~isempty(data)
        nt=length(data(1).signal);
        selch=1:4;
        selchstr={'\color[rgb]{1 1 1}Channel 1','\color[rgb]{1 1 1}Channel 2',...
            '\color[rgb]{1 1 1}Channel 3','\color[rgb]{1 1 1}Channel 4'};
        chsel(1)=get(handles.chbox1,'Value');
        chsel(2)=get(handles.chbox2,'Value');
        chsel(3)=get(handles.chbox3,'Value');
        chsel(4)=get(handles.chbox4,'Value');
        corder=[1 1 1;1 0 0;0.75 0 0.75;0 0 1];
        selch=selch(chsel~=0);
        selchstr=selchstr(selch);
        %     corder=corder(selch,:);
        isdetrend=get(handles.detrendbtn,'Value');
        if ~isempty(selch)
            if nt<=2
                mssgs=get(handles.mssgbox,'String');
                mssgs{end+1}='Measured data length must be larger than 2';
                set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
            else
                nfft=2^nextpow2(nt);
                df=Fs/nfft;
                Fw=0:df:Fs-df;
                for kk=1:4
                    if isdetrend
                        if get(handles.welchmethod,'Value')
                            [Pxx(:,kk),F]=pwelch(detrend(data.signal(:,kk)),[],[],nfft,Fs);
                        end
                        if get(handles.periodogrammethod,'Value')
                            [Pxx(:,kk),F]=periodogram(detrend(data.signal(:,kk)),[],nfft,Fs);
                        end
                        if get(handles.fftmethod,'Value')
                            Pxxtemp=abs(fft(detrend(data.signal(:,kk)),nfft)).^2/nt/Fs;
                            Pxx(:,kk)=Pxxtemp(1:length(Pxxtemp)/2);
                            F=Fw(1:length(Pxxtemp)/2);
                        end
                        
                    else
                        if get(handles.welchmethod,'Value')
                            [Pxx(:,kk),F]=pwelch(data.signal(:,kk),[],[],nfft,Fs);
                        end
                        if get(handles.periodogrammethod,'Value')
                            [Pxx(:,kk),F]=periodogram(data.signal(:,kk),[],nfft,Fs);
                        end
                        if get(handles.fftmethod,'Value')
                            Pxxtemp=abs(fft(data.signal(:,kk),nfft)).^2/nt/Fs;
                            Pxx(:,kk)=Pxxtemp(1:length(Pxxtemp)/2);
                            F=Fw(1:length(Pxxtemp)/2);
                        end
                    end
                end
%                 set(0,'DefaultAxesColorOrder',corder);
                %             set(handles.mainaxes,'ColorOrder',corder);
                if get(handles.ydbbtn,'Value')
                    hpsd = plot(F,pow2db(Pxx(:,selch)),'.-','Parent',handles.mainaxes);
                    if get(handles.xlogbtn,'Value')
                        set(handles.mainaxes,'XScale','log');
%                         hpsd = plot(F,pow2db(Pxx(:,selch)),'.-','Parent',handles.mainaxes);
                    else % get(handles.ylinearbtn,'Value')
%                         hpsd = plot(F,pow2db(Pxx(:,selch)),'.-','Parent',handles.mainaxes);
                    end
                    xlabel('Frequency (Hz)','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
                    ylabel({'Power Spectrum';'Power/frequency (dB/Hz)'},'FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
                else
                    if get(handles.xlogbtn,'Value')
                        hpsd = semilogx(F,Pxx(:,selch),'.-','Parent',handles.mainaxes);
                    else % get(handles.ylinearbtn,'Value')
                        hpsd = plot(F,Pxx(:,selch),'.-','Parent',handles.mainaxes);
                    end
                    xlabel('Frequency (Hz)','FontWeight','bold','FontSize',14,'Color',[0 0 0],'Parent',handles.mainaxes);
                    ylabel({'Power Spectrum';'Squared voltage/frequency (V_{RMS}^2/Hz)'},...
                        'FontWeight','bold','FontSize',14,'Color',[0 0 0],...
                        'Parent',handles.mainaxes);
                end
                set(handles.mainaxes,'YGrid','on','XGrid','on',...
                    'Color',[0 0 0],'XColor',[0.314 0.314 0.314],'YColor',[0.314 0.314 0.314]);
                legend(handles.mainaxes,selchstr,'Orientation','Horizontal','Location','South',...
                    'Color',[0.2 0.2 0.2]);
                xlim(handles.mainaxes,[F(2) F(end)]);
                
                if get(handles.thyespopupbtn,'Value')
                    scrsz = get(0,'ScreenSize');
                    figW=640;
                    figH=480;
                    figure('Name','Power Spectrum',...
                        'Color',[0 0 0],...
                        'Position',[scrsz(3)/2-figW/2 scrsz(4)/2-figH/2 figW figH])
                    axes
                    nhpsd=copyobj(hpsd,gca);
                    if get(handles.xlogbtn,'Value')
                        set(gca,'XScale','log');
                    end
                    xlabel('Frequency (Hz)','FontWeight','bold','FontSize',14,'Color',[0 0 0]);
                    if get(handles.ydbbtn,'Value')
                        ylabel({'Power Spectrum';'Power/frequency (dB/Hz)'},'FontWeight','bold','FontSize',14,'Color',[0 0 0]);
                    else
                        ylabel({'Power Spectrum';'Squared voltage/frequency (V_{RMS}^2/Hz)'},...
                            'FontName','Helvetica','FontWeight','bold','FontSize',14,'Color',[0 0 0]);
                    end
                    legend(selchstr,'Orientation','Horizontal','Location','South',...
                        'Color',[0.2 0.2 0.2]);
                    set(gca,'YGrid','on','XGrid','on',...
                        'Color',[0 0 0],'XColor',[0.7 0.7 0.7],'YColor',[0.7 0.7 0.7]);
                    xlim([F(2) F(end)]);
                end
%                 colordef white;
            end
        else
            errordlg('적어도 채널하나는 선택해야합니다.');
        end
    end
else
    set(handles.displaymodebtn,'Value',1);
    HRDAQ4CH_V1('displaymodebtn_Callback',hObject,eventdata,guidata(hObject));
end

function samplingrate_Callback(hObject, eventdata, handles)
% hObject    handle to samplingrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingrate as text
%        str2double(get(hObject,'String')) returns contents of samplingrate as a double


% --- Executes during object creation, after setting all properties.
function samplingrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samplingrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in mssgbox.
function mssgbox_Callback(hObject, eventdata, handles)
% hObject    handle to mssgbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mssgbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mssgbox


% --- Executes during object creation, after setting all properties.
function mssgbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mssgbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chbox1.
function chbox1_Callback(hObject, eventdata, handles)
% hObject    handle to chbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chbox1


% --- Executes on button press in chbox2.
function chbox2_Callback(hObject, eventdata, handles)
% hObject    handle to chbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chbox2


% --- Executes on button press in chbox3.
function chbox3_Callback(hObject, eventdata, handles)
% hObject    handle to chbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chbox3


% --- Executes on button press in chbox4.
function chbox4_Callback(hObject, eventdata, handles)
% hObject    handle to chbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chbox4


% --- Executes on button press in detrendbtn.
function detrendbtn_Callback(hObject, eventdata, handles)
% hObject    handle to detrendbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of detrendbtn



function blocktimetag_Callback(hObject, eventdata, handles)
% hObject    handle to blocktimetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blocktimetag as text
%        str2double(get(hObject,'String')) returns contents of blocktimetag as a double


% --- Executes during object creation, after setting all properties.
function blocktimetag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blocktimetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in savedatatag.
function savedatatag_Callback(hObject, eventdata, handles)
% hObject    handle to savedatatag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of savedatatag



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


% --- Executes on button press in measurementstopbtn.
function measurementstopbtn_Callback(hObject, eventdata, handles)
% hObject    handle to measurementstopbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
u=get(handles.connectbtn,'UserData');
if ~isempty(u)
    fwrite(u,int8([115 101 13 10]));
    set(u,'UserData',0);
end


% --- Executes on button press in clearmssg.
function clearmssg_Callback(hObject, eventdata, handles)
% hObject    handle to clearmssg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.mssgbox,'String',[]);

% --- Executes on button press in exitbtn.
function exitbtn_Callback(hObject, eventdata, handles)
% hObject    handle to exitbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function filemenu_Callback(hObject, eventdata, handles)
% hObject    handle to filemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function editmenu_Callback(hObject, eventdata, handles)
% hObject    handle to editmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function viewmenu_Callback(hObject, eventdata, handles)
% hObject    handle to viewmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function toolsmenu_Callback(hObject, eventdata, handles)
% hObject    handle to toolsmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function helpmenu_Callback(hObject, eventdata, handles)
% hObject    handle to helpmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function helpcontectmenu_Callback(hObject, eventdata, handles)
% hObject    handle to helpcontectmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function aboutmenu_Callback(hObject, eventdata, handles)
% hObject    handle to aboutmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function openmenu_Callback(hObject, eventdata, handles)
% hObject    handle to openmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function savemenu_Callback(hObject, eventdata, handles)
% hObject    handle to savemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function printmenu_Callback(hObject, eventdata, handles)
% hObject    handle to printmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% pos=get(handles.uimain,'Position');
% pos=get(handles.uimain,'PaperPosition');
% set(handles.uimain,'Papersize',pos(3:4));
defaultfile=['PR_',datestr(now,'yyyymmdd_HHMMSS')];
[filename, pathname, filterindex] = uiputfile( ...
    {'*.eps','Encapsulated PostScript, Level-2 (*.eps)';...
    '*.png','Portable Network Graphics (*.png)';...
    '*.jpg','JPEG Image (*.jpg)';...
    '*.*',  'All Files (*.*)'},...
    'Save as',defaultfile);
if isequal(filename,0) || isequal(pathname,0)
    mssgs=get(handles.mssgbox,'String');
    mssgs{end+1}='User selected Cancel';
    set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
else
%     save(fullfile(pathname,filename),'data');
    switch filterindex
        case 1
            print(handles.uimain,'-dpsc2',fullfile(pathname,filename));
        case 2
            print(handles.uimain,'-dpng',fullfile(pathname,filename));
        case 3
            print(handles.uimain,'-djpeg',fullfile(pathname,filename));
    end
    mssgs=get(handles.mssgbox,'String');
    mssgs{end+1}=['Saved : ',fullfile(pathname,filename)];
    set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
end
% dpsc2

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


% --- Executes on button press in displaymodebtn.
function displaymodebtn_Callback(hObject, eventdata, handles)
% hObject    handle to displaymodebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.displaymodebtn,'Value')
    [freqmode,mapfreqmode,alphadfreqmode]=imread('frequencydomain.png','BackgroundColor','none');
    set(handles.displaymodebtn,'CData',freqmode)
    %     set(handles.displaymodebtn,'String','Frequency Domain');
else
    [timemode,maptimemode,alphadtimemode]=imread('timedomain.png','BackgroundColor','none');
    set(handles.displaymodebtn,'CData',timemode)
    %     set(handles.displaymodebtn,'String','Time Domain');
end


% --------------------------------------------------------------------
function configtag_Callback(hObject, eventdata, handles)
% hObject    handle to configtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
initialconfiguration

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function resetiniconfig_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to resetiniconfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
configfile='config.ini';
[fid,m]=fopen(configfile,'r');
if isempty(m)
    header=fgetl(fid);
    % set(handles.lastconfiguredtag,'String',header(50:end));
    ipaddress=fgetl(fid);
    set(handles.ipaddress,'String',ipaddress);
    port=fgetl(fid);
    set(handles.portnumber,'String',port);
    sampling=fgetl(fid);
    set(handles.samplingrate,'String',sampling);
    ppl=fgetl(fid);
    set(handles.ppltag,'String',ppl);
    buffersize=fgetl(fid);
    set(handles.buffersizetag,'String',buffersize);
    displaytime=fgetl(fid);
    set(handles.blocktimetag,'String',displaytime);
    
    simchannel=fgetl(fid);
    eval(['imchannel=[',simchannel,'];']);
    set(handles.chbox1,'Value',imchannel(1));
    set(handles.chbox2,'Value',imchannel(2));
    set(handles.chbox3,'Value',imchannel(3));
    set(handles.chbox4,'Value',imchannel(4));
    
    sthpo=fgetl(fid);
    eval(['thpo=[',sthpo,'];']);
    set(handles.thnopopupbtn,'Value',thpo(1));
    set(handles.thyespopupbtn,'Value',thpo(2));
    
    sxpscale=fgetl(fid);
    eval(['xpscale=[',sxpscale,'];']);
    set(handles.xlinearbtn,'Value',xpscale(1));
    set(handles.xlogbtn,'Value',xpscale(2));
    
    sypscale=fgetl(fid);
    eval(['ypscale=[',sypscale,'];']);
    set(handles.ylinearbtn,'Value',ypscale(1));
    set(handles.ydbbtn,'Value',ypscale(2));
    
    ssmethod=fgetl(fid);
    eval(['smethod=[',ssmethod,'];']);
    set(handles.fftmethod,'Value',smethod(1));
    set(handles.periodogrammethod,'Value',smethod(2));
    set(handles.welchmethod,'Value',smethod(3));
    
    fclose(fid);
else
    mssgs=get(handles.mssgbox,'String');
    mssgs{end+1}=['config.ini : ',m];
    set(handles.mssgbox,'String',mssgs);set(handles.mssgbox,'Value',length(mssgs));
end



function titletag_Callback(hObject, eventdata, handles)
% hObject    handle to titletag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of titletag as text
%        str2double(get(hObject,'String')) returns contents of titletag as a double


% --- Executes during object creation, after setting all properties.
function titletag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to titletag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
