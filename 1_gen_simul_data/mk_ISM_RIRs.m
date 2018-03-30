function []=mk_ISM_RIRs(Fs)

% 90
% 90代表90度，1m代表低圆半径为1m，100cm代表高度为100cm
% 角度为90度，距离变化：
% 1m 2m 3m 4m 5m
setSrc_90_1m_100cm_reverb020= ISM_setup(0, 1, 1.00, 0.020, Fs); % 初始化SetupStruc结构体，存放各种条件信息
setSrc_90_2m_100cm_reverb020= ISM_setup(0, 2, 1.00, 0.020, Fs);
setSrc_90_3m_100cm_reverb020= ISM_setup(0, 3, 1.00, 0.020, Fs);
% setSrc_90_4m_100cm_reverb020= ISM_setup(0, 4, 1.00, 0.020, Fs);
% setSrc_90_5m_100cm_reverb020= ISM_setup(0, 5, 1.00, 0.020, Fs);
% 距离不变，角度变化：0，45，90，135，180，225，270，315
% 0 45 90 135 180 225 270 315
setSrc_00_1m_100cm_reverb020= ISM_setup(1, 0, 1.00, 0.020, Fs);
setSrc_45_1m_100cm_reverb020= ISM_setup(cos(pi/4)*1, sin(pi/4)*1, 1.00, 0.020, Fs) ;
% 90 ------
setSrc_135_1m_100cm_reverb020= ISM_setup(cos(3*pi/4)*1, sin(3*pi/4)*1, 1.00, 0.020, Fs);
setSrc_180_1m_100cm_reverb020= ISM_setup(cos(4*pi/4)*1, sin(4*pi/4)*1, 1.00, 0.020, Fs);
setSrc_225_1m_100cm_reverb020= ISM_setup(cos(5*pi/4)*1, sin(5*pi/4)*1, 1.00, 0.020, Fs);
setSrc_270_1m_100cm_reverb020= ISM_setup(cos(6*pi/4)*1, sin(6*pi/4)*1, 1.00, 0.020, Fs);
setSrc_315_1m_100cm_reverb020= ISM_setup(cos(7*pi/4)*1, sin(7*pi/4)*1, 1.00, 0.020, Fs);


% setSrc_120_1m_170cm_reverb020= ISM_setup(, sin(pi/3)*1, 1.70, 0.020, Fs);

% setSrc_90_1m_170cm_reverb020= ISM_setup(0, 1, 1.70, 0.020, Fs) % 初始化SetupStruc结构体，存放各种条件信息
% setSrc_90_1m_170cm_reverb300= ISM_setup(0, 1, 1.70, 0.300, Fs);
% setSrc_90_1m_170cm_reverb500= ISM_setup(0, 1, 1.70, 0.500, Fs);
% setSrc_90_1m_170cm_reverb700= ISM_setup(0, 1, 1.70, 0.700, Fs);
% setSrc_90_1m_170cm_reverb900= ISM_setup(0, 1, 1.70, 0.900, Fs);
ISM_RIR_bank(setSrc_90_1m_100cm_reverb020,'ISM_RIRs_090_1m_100cm_reverb020.mat');
ISM_RIR_bank(setSrc_90_2m_100cm_reverb020,'ISM_RIRs_090_2m_100cm_reverb020.mat');
ISM_RIR_bank(setSrc_90_3m_100cm_reverb020,'ISM_RIRs_090_3m_100cm_reverb020.mat');
% ISM_RIR_bank(setSrc_90_4m_100cm_reverb020,'ISM_RIRs_090_4m_100cm_reverb020.mat');
% ISM_RIR_bank(setSrc_90_5m_100cm_reverb020,'ISM_RIRs_090_5m_100cm_reverb020.mat');

ISM_RIR_bank(setSrc_00_1m_100cm_reverb020,'ISM_RIRs_000_1m_100cm_reverb020.mat');
ISM_RIR_bank(setSrc_45_1m_100cm_reverb020,'ISM_RIRs_045_1m_100cm_reverb020.mat');
% ISM_RIR_bank(setSrc_90_1m_100cm_reverb020,'ISM_RIRs_090_1m_100cm_reverb020.mat');
ISM_RIR_bank(setSrc_135_1m_100cm_reverb020,'ISM_RIRs_135_1m_100cm_reverb020.mat');
ISM_RIR_bank(setSrc_180_1m_100cm_reverb020,'ISM_RIRs_180_1m_100cm_reverb020.mat');
ISM_RIR_bank(setSrc_225_1m_100cm_reverb020,'ISM_RIRs_225_1m_100cm_reverb020.mat');
ISM_RIR_bank(setSrc_270_1m_100cm_reverb020,'ISM_RIRs_270_1m_100cm_reverb020.mat');
ISM_RIR_bank(setSrc_315_1m_100cm_reverb020,'ISM_RIRs_315_1m_100cm_reverb020.mat');
% ISM_RIR_bank(setSrc_90_1m_170cm_reverb020,'ISM_RIRs_090_1m_170cm_reverb020.mat');
% ISM_RIR_bank(setSrc_90_1m_170cm_reverb300,'ISM_RIRs_090_1m_170cm_reverb300.mat');
% ISM_RIR_bank(setSrc_90_1m_170cm_reverb500,'ISM_RIRs_090_1m_170cm_reverb500.mat');
% ISM_RIR_bank(setSrc_90_1m_170cm_reverb700,'ISM_RIRs_090_1m_170cm_reverb700.mat');
% ISM_RIR_bank(setSrc_90_1m_170cm_reverb900,'ISM_RIRs_090_1m_170cm_reverb900.mat');
% setSrc_90_2m_170cm_reverb020= ISM_setup(0, 2, 1.70, 0.020, Fs);
% setSrc_90_2m_170cm_reverb300= ISM_setup(0, 2, 1.70, 0.300, Fs);
% setSrc_90_2m_170cm_reverb500= ISM_setup(0, 2, 1.70, 0.500, Fs);
% setSrc_90_2m_170cm_reverb700= ISM_setup(0, 2, 1.70, 0.700, Fs);
% setSrc_90_2m_170cm_reverb900= ISM_setup(0, 2, 1.70, 0.900, Fs);
% ISM_RIR_bank(setSrc_90_2m_170cm_reverb020,'ISM_RIRs_090_2m_170cm_reverb020.mat');
% ISM_RIR_bank(setSrc_90_2m_170cm_reverb300,'ISM_RIRs_090_2m_170cm_reverb300.mat');
% ISM_RIR_bank(setSrc_90_2m_170cm_reverb500,'ISM_RIRs_090_2m_170cm_reverb500.mat');
% ISM_RIR_bank(setSrc_90_2m_170cm_reverb700,'ISM_RIRs_090_2m_170cm_reverb700.mat');
% ISM_RIR_bank(setSrc_90_2m_170cm_reverb900,'ISM_RIRs_090_2m_170cm_reverb900.mat');
% 
% % 120
% setSrc_120_1m_170cm_reverb020= ISM_setup(-cos(pi/3)*1, sin(pi/3)*1, 1.70, 0.020, Fs);
% setSrc_120_1m_170cm_reverb300= ISM_setup(-cos(pi/3)*1, sin(pi/3)*1, 1.70, 0.300, Fs);
% setSrc_120_1m_170cm_reverb500= ISM_setup(-cos(pi/3)*1, sin(pi/3)*1, 1.70, 0.500, Fs);
% setSrc_120_1m_170cm_reverb700= ISM_setup(-cos(pi/3)*1, sin(pi/3)*1, 1.70, 0.700, Fs);
% setSrc_120_1m_170cm_reverb900= ISM_setup(-cos(pi/3)*1, sin(pi/3)*1, 1.70, 0.900, Fs);
% ISM_RIR_bank(setSrc_120_1m_170cm_reverb020,'ISM_RIRs_120_1m_170cm_reverb020.mat');
% ISM_RIR_bank(setSrc_120_1m_170cm_reverb300,'ISM_RIRs_120_1m_170cm_reverb300.mat');
% ISM_RIR_bank(setSrc_120_1m_170cm_reverb500,'ISM_RIRs_120_1m_170cm_reverb500.mat');
% ISM_RIR_bank(setSrc_120_1m_170cm_reverb700,'ISM_RIRs_120_1m_170cm_reverb700.mat');
% ISM_RIR_bank(setSrc_120_1m_170cm_reverb900,'ISM_RIRs_120_1m_170cm_reverb900.mat');
% setSrc_120_2m_170cm_reverb020= ISM_setup(-cos(pi/3)*2, sin(pi/3)*2, 1.70, 0.020, Fs);
% setSrc_120_2m_170cm_reverb300= ISM_setup(-cos(pi/3)*2, sin(pi/3)*2, 1.70, 0.300, Fs);
% setSrc_120_2m_170cm_reverb500= ISM_setup(-cos(pi/3)*2, sin(pi/3)*2, 1.70, 0.500, Fs);
% setSrc_120_2m_170cm_reverb700= ISM_setup(-cos(pi/3)*2, sin(pi/3)*2, 1.70, 0.700, Fs);
% setSrc_120_2m_170cm_reverb900= ISM_setup(-cos(pi/3)*2, sin(pi/3)*2, 1.70, 0.900, Fs);
% ISM_RIR_bank(setSrc_120_2m_170cm_reverb020,'ISM_RIRs_120_2m_170cm_reverb020.mat');
% ISM_RIR_bank(setSrc_120_2m_170cm_reverb300,'ISM_RIRs_120_2m_170cm_reverb300.mat');
% ISM_RIR_bank(setSrc_120_2m_170cm_reverb500,'ISM_RIRs_120_2m_170cm_reverb500.mat');
% ISM_RIR_bank(setSrc_120_2m_170cm_reverb700,'ISM_RIRs_120_2m_170cm_reverb700.mat');
% ISM_RIR_bank(setSrc_120_2m_170cm_reverb900,'ISM_RIRs_120_2m_170cm_reverb900.mat');
% 
% % 150
% setSrc_150_1m_170cm_reverb020= ISM_setup(-cos(pi/6)*1, sin(pi/6)*1, 1.70, 0.020, Fs);
% setSrc_150_1m_170cm_reverb300= ISM_setup(-cos(pi/6)*1, sin(pi/6)*1, 1.70, 0.300, Fs);
% setSrc_150_1m_170cm_reverb500= ISM_setup(-cos(pi/6)*1, sin(pi/6)*1, 1.70, 0.500, Fs);
% setSrc_150_1m_170cm_reverb700= ISM_setup(-cos(pi/6)*1, sin(pi/6)*1, 1.70, 0.700, Fs);
% setSrc_150_1m_170cm_reverb900= ISM_setup(-cos(pi/6)*1, sin(pi/6)*1, 1.70, 0.900, Fs);
% ISM_RIR_bank(setSrc_150_1m_170cm_reverb020,'ISM_RIRs_150_1m_170cm_reverb020.mat');
% ISM_RIR_bank(setSrc_150_1m_170cm_reverb300,'ISM_RIRs_150_1m_170cm_reverb300.mat');
% ISM_RIR_bank(setSrc_150_1m_170cm_reverb500,'ISM_RIRs_150_1m_170cm_reverb500.mat');
% ISM_RIR_bank(setSrc_150_1m_170cm_reverb700,'ISM_RIRs_150_1m_170cm_reverb700.mat');
% ISM_RIR_bank(setSrc_150_1m_170cm_reverb900,'ISM_RIRs_150_1m_170cm_reverb900.mat');
% setSrc_150_2m_170cm_reverb020= ISM_setup(-cos(pi/6)*2, sin(pi/6)*2, 1.70, 0.020, Fs);
% setSrc_150_2m_170cm_reverb300= ISM_setup(-cos(pi/6)*2, sin(pi/6)*2, 1.70, 0.300, Fs);
% setSrc_150_2m_170cm_reverb500= ISM_setup(-cos(pi/6)*2, sin(pi/6)*2, 1.70, 0.500, Fs);
% setSrc_150_2m_170cm_reverb700= ISM_setup(-cos(pi/6)*2, sin(pi/6)*2, 1.70, 0.700, Fs);
% setSrc_150_2m_170cm_reverb900= ISM_setup(-cos(pi/6)*2, sin(pi/6)*2, 1.70, 0.900, Fs);
% ISM_RIR_bank(setSrc_150_2m_170cm_reverb020,'ISM_RIRs_150_2m_170cm_reverb020.mat');
% ISM_RIR_bank(setSrc_150_2m_170cm_reverb300,'ISM_RIRs_150_2m_170cm_reverb300.mat');
% ISM_RIR_bank(setSrc_150_2m_170cm_reverb500,'ISM_RIRs_150_2m_170cm_reverb500.mat');
% ISM_RIR_bank(setSrc_150_2m_170cm_reverb700,'ISM_RIRs_150_2m_170cm_reverb700.mat');
% ISM_RIR_bank(setSrc_150_2m_170cm_reverb900,'ISM_RIRs_150_2m_170cm_reverb900.mat');
% 
% % 180
% setSrc_180_1m_170cm_reverb020= ISM_setup(-1, 0, 1.70, 0.020, Fs);
% setSrc_180_1m_170cm_reverb300= ISM_setup(-1, 0, 1.70, 0.300, Fs);
% setSrc_180_1m_170cm_reverb500= ISM_setup(-1, 0, 1.70, 0.500, Fs);
% setSrc_180_1m_170cm_reverb700= ISM_setup(-1, 0, 1.70, 0.700, Fs);
% setSrc_180_1m_170cm_reverb900= ISM_setup(-1, 0, 1.70, 0.900, Fs);
% ISM_RIR_bank(setSrc_180_1m_170cm_reverb020,'ISM_RIRs_180_1m_170cm_reverb020.mat');
% ISM_RIR_bank(setSrc_180_1m_170cm_reverb300,'ISM_RIRs_180_1m_170cm_reverb300.mat');
% ISM_RIR_bank(setSrc_180_1m_170cm_reverb500,'ISM_RIRs_180_1m_170cm_reverb500.mat');
% ISM_RIR_bank(setSrc_180_1m_170cm_reverb700,'ISM_RIRs_180_1m_170cm_reverb700.mat');
% ISM_RIR_bank(setSrc_180_1m_170cm_reverb900,'ISM_RIRs_180_1m_170cm_reverb900.mat');
% setSrc_180_2m_170cm_reverb020= ISM_setup(-2, 0, 1.70, 0.020, Fs);
% setSrc_180_2m_170cm_reverb300= ISM_setup(-2, 0, 1.70, 0.300, Fs);
% setSrc_180_2m_170cm_reverb500= ISM_setup(-2, 0, 1.70, 0.500, Fs);
% setSrc_180_2m_170cm_reverb700= ISM_setup(-2, 0, 1.70, 0.700, Fs);
% setSrc_180_2m_170cm_reverb900= ISM_setup(-2, 0, 1.70, 0.900, Fs);
% ISM_RIR_bank(setSrc_180_2m_170cm_reverb020,'ISM_RIRs_180_2m_170cm_reverb020.mat');
% ISM_RIR_bank(setSrc_180_2m_170cm_reverb300,'ISM_RIRs_180_2m_170cm_reverb300.mat');
% ISM_RIR_bank(setSrc_180_2m_170cm_reverb500,'ISM_RIRs_180_2m_170cm_reverb500.mat');
% ISM_RIR_bank(setSrc_180_2m_170cm_reverb700,'ISM_RIRs_180_2m_170cm_reverb700.mat');
% ISM_RIR_bank(setSrc_180_2m_170cm_reverb900,'ISM_RIRs_180_2m_170cm_reverb900.mat');
