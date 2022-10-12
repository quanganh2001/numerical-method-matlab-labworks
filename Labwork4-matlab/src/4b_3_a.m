clc;
clear;
clf;

height = [176 167 182 174 164 183 152 164 168 156 155 178 159 161 175 168 185 162 164 175 159 154 153 190 166 172 184 159 170 169]

% a) Average
a = mean(height)

% b) The variance
b = var(height)

% c) The standard deviation of the distribution
c = std(height)

% d) The lowest
d = min(height)

% e) The highest heights of the student in this class
e = max(height)

% f) the mode
f = mode(height)

% g) the median height
g = median(height)

hist(height)
