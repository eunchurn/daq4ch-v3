clear all; clc; close all;
scrsz = get(0,'ScreenSize');
figW=640;
figH=480;
if ~isdir('figs')
    mkdir('figs');
end

load HRDATA_20120806_160303_3000sec.mat

Fs=200;
nt=length(data.signal);
t=0:1/Fs:(nt-1)/Fs;
ltext={'X-dir','Z-dir','Y-dir'};

for kk=1:3
    [Pxx(:,kk),F]=pwelch(detrend(data.signal(:,kk)*2/1.3494),[],[],[],Fs);
    Pref=ones(length(F),1)*2*pow2db(sqrt(2)*3/Fs);
    Plow=ones(length(F),1)*(min(pow2db(Pxx(:,kk)/Fs))+7);
    
    figure('Position',[scrsz(3)/2-figW/2 scrsz(4)/2-figH/2 figW figH])
    semilogx(F,pow2db(Pxx(:,kk)/Fs),'-k',F,Pref,'-.r',F,Plow,'--b')
    grid on
    xlim([0.01 100])
    xlabel('Frequency (Hz)')
    ylabel({'Power spectral density';'Power/frequency (dB/Hz)'})
    legend('Measured signal level',['Max signal level (\pm3g_{peak}, \pm2.01g_{RMS}) = ',num2str(Pref(1)),'(dB/Hz)'],['Noise level (DC-100Hz) = ',num2str(Plow(1)),'(dB/Hz)'],'Location','Best')
    title(['KM Tower-',ltext{kk},' : Sampling rate Fs = ',num2str(Fs),'Hz, SNR = ',num2str(Pref(1)-Plow(1)),'dB'])
    print(gcf,'-depsc2',['figs/KMTower3-',ltext{kk},'.eps']);
end

for kk=1:3
    figure('Position',[scrsz(3)/2-figW/2 scrsz(4)/2-figH/2 figW figH])
    plot(t,data.signal(:,kk),'-k')
    xlim([t(6000) t(8000)])
    xlabel('Time (second)')
    ylabel('Acceleration (g)')
    title(['KM Tower-',ltext{kk}])
    print(gcf,'-depsc2',['figs/KMTower3-',ltext{kk},'-zomed2-time.eps']);
end