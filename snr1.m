clear all; clc; close all;

load vs9002_1000
scrsz = get(0,'ScreenSize');
figW=640;
figH=480;
Fs=1000;
nfft=2^nextpow2(length(data.signal));
window=1024;
noverlap=512;
Hs=spectrum.welch('Hann',window,100*noverlap/window);
rdata=detrend(data.signal(2:end,4));
Hpsd=psd(Hs,rdata,'NFFT',nfft,'Fs',Fs);
Pw=Hpsd.Data;
Fw=Hpsd.Frequencies;

figure('Position',[scrsz(3)/2-figW/2 scrsz(4)/2-figH/2 figW figH])
semilogx(Fw,pow2db(Pw),'-k')
grid on
xlabel('Frequency (Hz)')
ylabel('Power/frequency (dB/Hz)')