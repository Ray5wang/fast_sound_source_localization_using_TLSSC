function []=mk_tdoa_table_ssc(tdoa_table_filename,cartCoords_filename, ...
                              mic,Fs,c)
% In : TDOA_table.mat
% Out: TDOA_table_SSC.mat
%
% Reference:
% Youngkyu Cho, Dongsuk Yook, Seokmun Jang, and Hyunsoo Kim, 
% "Sound Source Localization for Robot Auditory Systems," 
% IEEE Transactions on Consumer Electronics, vol. 55, no. 3, pp. 1663-1668, 
% Aug. 2009.
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

% For all microphone pairs, the coordinates with a same TDOA are annotated 
% as a same cluster ID. Then, it is saved into the CoordClusterTable.
load(tdoa_table_filename);
% MIC对数
N= size(TDOA_table,2);
fprintf('Search Space Clustering ...\n');
clusterID= 0;
% 坐标点数
nCoord= size(TDOA_table,1);
CoordClusterTable= zeros(nCoord,1);
for i=1:nCoord-1
    fprintf('Processing ... clutser %d/%d\n',i,nCoord);
    % 聚类表中存的是什么？要判断是否为0，!=0代表已经聚类过了
    CoordClusterTable(i, 1)
    if (CoordClusterTable(i,1)~=0)
        continue;
    end
    
    clusterID= clusterID+1;
    coordCnt=1;
    % 存储的是该坐标属于哪一类？
    CoordClusterTable(i,1)= clusterID;
    % 搜索离该点比较近的点，判断为同一类
    % 这里将后面的全部搜索，显然是不合理的吧？以该点为球心进行球形搜索会不会好一点?
    % 而且两个球交叠区域归属于先搜索的球，不合理
    % 这里可以改进速度..............
    for j=i+1:nCoord
        diffVec= abs(TDOA_table(i,:) - TDOA_table(j,:));
        % TDOA差值最大的为0，也就是都为0，属于同一类
        if (max(diffVec) == 0)
            CoordClusterTable(j,1)= clusterID;
        end
    end
end
% 处理最后一个点
if (CoordClusterTable(nCoord,1)==0)
    clusterID= clusterID+1;
    CoordClusterTable(nCoord,1)= clusterID;
end

% Gathering coordinates with a same cluster ID, then save it in SSC.
nCluster= max(CoordClusterTable);
SSC= cell(nCluster,1);
for clusterID=1:nCluster
    % SSC中的每一项都是聚类表中clusterID类的索引（多少个值就有多少个索引）
    SSC{clusterID}= find(CoordClusterTable==clusterID);
end
save('SSC.mat','SSC');

% Extracting representative coordinates in each cluster. Then, it is saved
% in TDOA_table_SSC. The representative coordinates is determined as the 
% centroid in the cluster.
load(cartCoords_filename);
M= size(mic,1);
N= M*(M-1)/2;
nCluster= size(SSC,1);
% 相当于TDOA表，只是行数少了
TDOA_table_SSC= zeros(nCluster,N);
% 相当于坐标表，存储聚类中心
SSC_centroids= zeros(nCluster,3);
for i=1:nCluster
    centroid= zeros(1,3);
    nCoord= size(SSC{i,1},1);    
    % 遍历同一类中的所有元素（索引）的坐标和
    for j=1:nCoord
        coordIdx= SSC{i,1}(j,1);
        centroid= centroid + cartCoords(coordIdx,:);
    end
    % 平均坐标即是聚类中心
    centroid= centroid ./ nCoord;
    SSC_centroids(i,:)= centroid;

    % Re-calculate the TDOA of the centroid -> save to TDOA_table_SSC.mat
    % 只对聚类中心求TDOA值，建立聚类中心TDOA表
    micPairCnt= 0;
    for m1=1:M-1
        for m2=m1+1:M
            d1= norm(mic(m1,:)-centroid(1,:),2);
            d2= norm(mic(m2,:)-centroid(1,:),2);
            dd= d1-d2;
            sd= round((dd/c)*Fs);
            micPairCnt= micPairCnt+1;
            TDOA_table_SSC(i,micPairCnt)= sd;
        end
    end
end
save ('TDOA_table_SSC.mat','TDOA_table_SSC');
save ('SSC_centroids.mat','SSC_centroids');
