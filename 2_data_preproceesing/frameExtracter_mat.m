% IN: ld_vadlist.m, enframe.m
% OUT: VADed_dat.mat

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
clc; clear all;

M= 4;
n= 4096;   % number of samples in a frame
filelist= ld_vadlist();
nfile= size(filelist,1);

disp('Extract VAD frames');
% Extract VADed frames, then save it as *.mat files
for i=1:nfile
    fprintf('Processing %s...\n',filelist{i,1});
    fnlen= size(filelist{i,1},2);
    vadfn= [filelist{i,1}(1:fnlen-4) '_VAD.mat'];
    load(vadfn); % load VAD result on results
    
    % enframed M channel wavfiles
    % 创建一个M*1的矩阵
    f= cell(M,1);
    for j=1:M
        % 这里是要遍历第i种配置所对应的16个音频文件
        read_filename= [filelist{i,1}(1:fnlen-6) sprintf('%02d.wav',j-1)];
        % [x(:,j),Fs]= wavread(read_filename);
        [x(:,j),Fs]= audioread(read_filename);
        f{j,1}= enframe(x(:,j),hamming(n,'periodic'),n/2)
    end
    
    % results是上面load的结果，也是vad的输出，找到所有为1的帧，也就是有语音的帧
    extract_frames= find(results==1);
    f2= cell(M,1);
    for j=1:M
        % f{j,1}是个二维数组，每一行为一帧数据
        % 这里也就是排除了非语音帧
        f2{j,1}= f{j,1}(extract_frames,:);
    end
    
    output_filename= [filelist{i,1}(1:fnlen-9) 'VADed_data'];
    save(output_filename,'f2');
end
