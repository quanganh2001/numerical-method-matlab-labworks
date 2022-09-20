% ©2021 HP.
% Write a function that calculates the mean of a vector.
clc;
clear;

function [mean] = stats(x)
    Number_of_elements = length(x)
    mean = sum(x)/Number_of_elements;
end

x = [1:3:100]
mean = stats(x)