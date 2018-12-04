clear all; clc; close all;

load HRDATA_20120725_172338_sf3000_new1
scrsz = get(0,'ScreenSize');
figW=640;
figH=480;
% window=1024;
% noverlap=512;
window=8192;
noverlap=1024;
nfft=2^nextpow2(length(data.signal));
Fs=200;

for kk=1:3
    [Pxx(:,kk),F]=periodogram(detrend(data.signal(:,kk)),[],nfft,Fs);
end

figure('Position',[scrsz(3)/2-figW/2 scrsz(4)/2-figH/2 figW figH])
semilogx(F,pow2db(Pxx/Fs))
grid on
xlabel('Frequency (Hz)')
ylabel({'Power spectral density';'Power/frequency (dB/Hz)'})
xlim([0.01 100])
legend('X','Z','Y')