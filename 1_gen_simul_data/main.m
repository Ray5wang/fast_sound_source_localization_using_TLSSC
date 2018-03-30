% Release date: May 2015
% Author: Taewoo Lee, (twlee@speech.korea.ac.kr)
%
% Copyright (C) 2015 Taewoo Lee
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program. If not, see <http://www.gnu.org/licenses/>.

[SrcSignalVec, Fs]= wavread('LDC93S1.wav');     % 获得音频的信息，数据，采样率
% [SrcSignalVec, Fs]= audioread('LDC93S1.wav');     % 获得音频的信息，数据，采样率
M= 4;                   % MIC的个数
amp_rate= 90.0;         % 幅度放大倍数?

% disp(['audio info:--------------']), size(SrcSignalVec), Fs, M, disp(['-------------------------'])

mk_ISM_RIRs(Fs);        % 根据参数设置产生音频mat文件
mk_dir;                 % 产生存放仿真音频文件的目录结构
wav_length= size(SrcSignalVec,1);
RIRlist= ld_RIRlist();  % 所有mat文件的名称列表
nRIR= size(RIRlist,1);  % mat文件的个数
for i=1:nRIR            % 产生所有所需要的音频文件
    RIRfn= RIRlist{i};  % 获取文件名称
    fprintf('%s\n',RIRfn);
    AuData= ISM_AudioData(RIRfn,SrcSignalVec);  % 这里正式产生音频文件
    for j=1:M
        str= sprintf('out%02d.wav',j-1);
        wavwrite(AuData(1:wav_length,j)*amp_rate + 0.001*randn(wav_length,1),Fs,str);
        % audiowrite(str, AuData(1:wav_length,j)*amp_rate + 0.001*randn(wav_length,1),Fs);
        direction= RIRfn(12:14);
        distance= RIRfn(16:17);
        height= RIRfn(19:23);
        reverberation= RIRfn(25:33);
        destination= ['./TL-SSC_simul_data/' direction '/' distance '/' height '/' reverberation];
        movefile(['./' str],destination);
    end
end
