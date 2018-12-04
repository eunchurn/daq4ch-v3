clear all; clc; close all;

n=2^18;
x=50*randn(n,1);
disp(['RMS = ',num2str(std(x))])
Fs=1000;
[Pxx,F]=pwelch(x,[],[],[],Fs);
figure,semilogx(F,Pxx)
grid on
disp(['dHz = ',num2str(F(2)-F(1))])
sqrt(sum(Pxx*(F(2)-F(1))))

sum(sqrt(Pxx*(F(2)-F(1))))
% xlabel('Frequency (Hz)')
% ylabel({'Power spectral density';'Power/frequency (dB/Hz)'})