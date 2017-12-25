# Fast Sound Source Localization Using Two-Level Search Space Clustering
Simple demonstration using simulated data

### Execution
On Windows and MATLAB, (the codes were tested on Windows7 64-bit and MATLAB2009b).

On Windows and MATLAB, (the codes were tested on Windows7 64-bit and MATLAB2014b).
 1. Download `LDC93S1.wav` file from [here](https://www.google.com/url?q=https%3A%2F%2Fcatalog.ldc.upenn.edu%2Fdesc%2Faddenda%2FLDC93S1.wav&sa=D&sntz=1&usg=AFQjCNE1QtQownD3lvimnRxuWBXkutWotg). Copy the file into `1_gen_simul_data` folder.
 2. Execute `./1_gen_simul_data/main.m`.
 3. Execute `./2_data_preprocessing/main.m`.
 4. Execute `./3_gen_TLSSC_TDOA_table/main.m`.
 5. Execute `./4_TLSSC_SRP-PHAT/main.m`.

Experiment result log files are saved in `./4_TLSSC_SRP-PHAT/log`. For more detailed explanation, please refer to the paper below.

### Reference
Dongsuk Yook, Taewoo Lee, and Youngkyu Cho, ["Fast Sound Source Localization Using Two-Level Search Space Clustering,"](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=7039285&sortType=asc_p_Sequence&filter=AND(p_IS_Number:6352949)) IEEE Transactions on Cybernetics, In Press, Feb. 2015

## 修改声源位置

1. 修改1_gen_simul_data/mk_ISM_RIRs.m配置结构体
2. 修改1_gen_simul_data/mk_dir.m创建音频目录
3. 修改1_gen_simul_data/ld_RIRlist.m后面所采用的参数
4. 修改2_data_preproceesing/ld_vadlist.m 2中的配置文件
4. 修改4_TLSSC_SRP-PHAT/ld_vadlist.m 4中的配置文件

