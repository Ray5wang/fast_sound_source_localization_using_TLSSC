function [max_srp_index]= srp_phat_forward_map(f, ...   % M by T matrix
                                               TDOA_table)
% f为MIC数的音频，每一行一个MIC的一帧数据
% 采样一帧数据进行定位
% Reference:
% J. Dmochowski, J. Benesty, and S. Affes, "A generalized steered response 
% power method for computationally viable source localization," 
% IEEE Transactions on Audio, Speech, and Language Processing, vol. 15, 
% pp. 2510-2526, 2007.
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

% MIC数
M= size(f,1);
% MIC对数
N= M*(M-1)/2;
% 一帧数据的采样点数
T= size(f,2);
% TDOA表格进行过转置，所以这里的列就是之前的行，代表搜索点数 
Q= size(TDOA_table,2);

% GCC-PHAT
% 和f一样的矩阵
X= zeros(M,T);
for m=1:M
    % 对之前音频的每一行做fft变换，所有值都变成了复数了
    X(m,:)= fft(f(m,:));
    % 这里除以每个元素的模，得到就是单位矩阵了
    X(m,:)= X(m,:)./abs(X(m,:));
end     
Z= zeros(N,T);
p= 0;
for m1=1:M-1
    for m2=m1+1:M
        % 对没对音频操作
        p= p+1;
        % conj取共轭
        % m1行.*m2行的共轭表示什么意思?
        % 没两行进行某种操作
        Z(p,:)= X(m1,:).*conj(X(m2,:))
    end
end
R= zeros(N,T);
for p=1:N
    % 还不太明白运算的原理
    % 先假设得到了这N MIC对的交互数据
    R(p,:)= fftshift(real(ifft(Z(p,:))));
end

% SRP (full search or forward map)
% 1/2采样点数
center= T/2;
% 搜索点的个数
srp_global= zeros(Q,1);
for q=1:Q
    srp_local= 0;
    % 遍历MIC对数
    for p=1:N
        % +center啥意思?
        % 某一个搜索点的第一对MIC TDOA值
        % 这里的计算是个难点，需要好好理解
        tau_qp= TDOA_table(p,q) + center;
        srp_local= srp_local + R(p,tau_qp);
    end
    % 第q个搜索点所对应的功率
    srp_global(q,1)= srp_local;
end

[~,max_srp_index]= max(srp_global);
