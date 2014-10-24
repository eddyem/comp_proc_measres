%M-file = diabetic.m
%
% This data was obtained from 20 male insulin-dependent diabetics who
% had been on a high carbohydrate diet for 6 months.  Compliance with
% the regime is thought to be related to age (x1) in years, body weight
% relative to the 'ideal' weight for height (x2) and other components
% of diet such as percentage of calories as protein (x3). Using these three
% explanatory variables it is possible to the response (y) the percentage 
% of total calories obtained from complex carbohydrates,

disp('  diabetic.m - vectors y, x1, x2, x3 loaded ...')
diabeticdata=[
              33 33 100 14
              40 47  92 15
              37 49 135 18
              27 35 144 12
              30 46 140 15              
              43 52 101 15
              34 62  95 14
              48 23 101 17
              30 32  98 15
              38 42 105 14
              50 31 108 17
              51 61  85 19
              30 63 130 19
              36 40 127 20
              41 50 109 15
              42 64 107 16
              46 56 117 18
              24 61 100 13
              35 48 118 18
              37 28 102 14];

y=diabeticdata(:,1);
x1=diabeticdata(:,2);
x2=diabeticdata(:,3);
x3=diabeticdata(:,4);
