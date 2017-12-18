## 说明

### 全局搜索方法

1. 确定mic位置和坐标原点
2. 确定搜索空间（极坐标）
3. 将搜索空间用笛卡尔坐标系表示matrix[搜索点数，xyz坐标]
4. 每个搜索点对应着MIC对个TDOA值，建立该表格matrix[搜索点数，MIC对数]

### 反向映射表法

思路: 建立表格，已知target_TDOA值查找反向映射表就可以找到其在全局TDOA表中的位置，从而确定坐标；

#### 表格的建立

1. 确定MIC对，获得全局映射表中该MIC对应的所有TDOA值的最大值和最小值，以及max~min值的个数，建立[MIC对数，三行：max, min, n]
2. 建立反向映射表[MIC对数，1]的矩阵，里面每行存储一个反向映射表
3. 上述每个映射表对应一个某MIC对对应的TDOA值范围(索引值，对应到第一步中的表格)，其中的值为索引TDOA值在全局TDOA表格中的位置