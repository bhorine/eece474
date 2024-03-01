%%
% Assignment 4: Digital Modulation and Demodulation
% EECE-474 Modern Communication Systems Spring 2024
% Brent Horine
close all; clear; clc;

%%
M_qam = 64;
k_qam = log2(M_qam);
N = 10000;

i_data = randi([0 1], [N*k_qam 1]);

tx_64qam = qammod(i_data, M_qam, 'gray', 'InputType','bit', 'UnitAveragePower',true);
SNR = 20;
rx_64qam = awgn(tx_64qam, SNR);
o_data = qamdemod(rx_64qam, M_qam, 'gray', 'OutputType','bit', 'UnitAveragePower', true);
fprintf('Number of errors for %i-QAM with %idB SNR: %i\n', M_qam, SNR, sum(i_data ~= o_data));
scatterplot(rx_64qam), title('64-QAM with 20dB SNR AWGN');

SNR = 12;
rx_64qam = awgn(tx_64qam, SNR);
o_data = qamdemod(rx_64qam, M_qam, 'gray', 'OutputType', 'bit', 'UnitAveragePower', true);
fprintf('Number of errors for %i-QAM with %idB SNR: %i\n', M_qam, SNR, sum(i_data ~= o_data));
scatterplot(rx_64qam), title('64-QAM with 12dB SNR AWGN');

M_psk = 8;
k_psk = log2(M_psk);

i_data = randi([0 1], [N*k_psk 1]);

tx_8psk = pskmod(i_data, M_psk, pi/M_psk, 'gray', 'InputType', 'bit');
SNR = 20;
rx_8psk = awgn(tx_8psk, SNR, 'measured');
o_data = pskdemod(rx_8psk, M_psk, pi/M_psk, 'gray', 'Outputtype', 'bit');
fprintf('Number of errors for %i-PSK with %idB SNR: %i\n', M_psk, SNR, sum(i_data ~= o_data));
scatterplot(rx_8psk), title('8-PSK with 20dB SNR AWGN');

SNR = 12;
rx_8psk = awgn(tx_8psk, SNR, 'measured');
o_data = pskdemod(rx_8psk, M_psk, pi/M_psk, 'gray', 'OutputType', 'bit');
fprintf('Number of errors for %i-PSK with %idB SNR: %i\n', M_psk, SNR, sum(i_data ~= o_data));
scatterplot(rx_8psk), title('8-PSK with 12dB SNR AWGN');