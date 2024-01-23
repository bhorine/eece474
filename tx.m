%% Transmitter
%% Brent Horine (c) 2024
%% Clear everything
clear; close all; clc;
%% Set parameters
M = 8;  % Optionally used to set the length of signals
T = 2.0E-7;  % Length of time domain analysis
OverSampling = 20;  % While technically 2X works, we get prettier plots with 20
freq = 100.0E6;  % Carrier frequency
amplitude = 10.0;  % Carrier amplitude

%% Create timebase
fs = OverSampling*max(freq);  % Claculate the sampling frequency
N = 2^M;  % Optionally used to set the length of signals
%t = 0:1/fs:(N - 1)/fs;
t = 0:1/fs:T - 1/fs;  % Create the time base sampled at fs

%% Create signal
sig = amplitude*cos(2.0*pi*freq*t);

%% Plot signal
plot(t, sig)
xlabel("Time (seconds)")
ylabel("Amplitude")
title("Carrier Time Domain")
axis([0 T -15 15])

