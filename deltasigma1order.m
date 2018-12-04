clear all; clc; close all;

Vin=0.04;
DAC=0;
intgr=0;
locbit=0;
for kk=1:52
    intgr=intgr+Vin-DAC;
    if intgr>=0
        locbit=1;
    else
        locbit=0;
    end
    if locbit
        DAC=2.5;
    else
        DAC=-2.5;
    end
    DACi(kk)=DAC;
    locbiti(kk)=num2str(locbit);
    intgri(kk)=intgr;
    out(kk)=mean(DACi);
end
Vo=bin2dec(locbiti)
% adgain=2.5/(2^23);
% 
% aVo=bin2dec(locbiti);
% 
% if aVo>=2^23
%     aVo=aVo-2^24;
% end
% 
% Vo=adgain*aVo