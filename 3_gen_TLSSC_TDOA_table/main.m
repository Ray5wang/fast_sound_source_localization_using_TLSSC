% SRP-PHAT Two-level Search Space Clustering
%
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
clc; clear all; close all;

% coordinates of a microphone array (cartesian coordinates), milli meter
mic=[0, 122.5, 438; ...		%0
	86.6, 86.6, 438; ...	%1
	122.5, 0, 438; ... 		%2
	86.6, -86.6, 438; ...	%3
	0, -122.5, 438; ...		%4
	-86.6, -86.6, 438; ...	%5
	-122.5, 0, 438; ...		%6
	-86.6, 86.6, 438; ...	%7
	0, 122.5, 200; ...		%8
	86.6, 86.6, 200; ...	%9
	122.5, 0, 200; ...  	%10
	86.6, -86.6, 200; ...	%11
	0, -122.5, 200; ... 	%12
	-86.6, -86.6, 200; ...	%13 
	-122.5, 0, 200; ...		%14
	-86.6, 86.6, 200];  	%15
% 不是最开始的[400, 400, 60]?，这里是建立搜索中心
% mic_array_origin= [0 0 400];    % in the room
mic_array_origin= [0 0 319];    % in the room

% Search range
search_range.theta= 0:2:359;        % 水平degree
% search_range.phi= 1:1:90;           % 垂直degree
search_range.phi= 1:15:90;           % 垂直degree
search_range.r= [800 1600 2300 2900 3400 3800];   % milli meter

% fprint('search point = %d')

Fs= 16000; % sampling frequency (Hz)
c= 340000; % speed of sound (mm/s)

mk_tdoa_table_full(mic,mic_array_origin,search_range,Fs,c);
% mk_tdoa_table_inverse('TDOA_table.mat');
% mk_tdoa_table_ssc('TDOA_table.mat','cartCoords.mat',mic,Fs,c);
% mk_tdoa_table_tlssc('TDOA_table.mat','TDOA_table_SSC.mat','SSC_centroids.mat',mic,Fs,c);
