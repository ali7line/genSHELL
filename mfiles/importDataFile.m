function importDataFile(R,H)

[inputShaftNum,inputShaftText] = xlsread('../Inputs/input.xls','Shaft');
[inputPropNum,inputPropText] = xlsread('../Inputs/input.xls','Prop');
caseNumber = inputShaftNum(1);
modelNumber = inputShaftNum(2);

if (exist('R') == 1)
    shaftRadius = R;
else
    shaftRadius = inputShaftNum(3);
end

if (exist('H') == 1)
    shaftDepth = H;
else
    shaftDepth = inputShaftNum(4);
end

segmentGap = inputShaftNum(5);
segmentLength = inputShaftNum(6);
segmentAngle = inputShaftNum(7);
bucklingFactor = inputShaftNum(8);
pressureProfile = inputShaftNum(9);

propConcreteYoung = inputPropNum(1,1);
propConcretePoision = inputPropNum(1,2);
propConcreteDensi = inputPropNum(1,3);
propGroundmodYoung = inputPropNum(2,1);
propGroundmodPoision = inputPropNum(2,2);

springToWall = inputShaftNum(15);
segmentHeight = inputShaftNum(16);


% colors= [color_SEG,color_SPR,color_VJ,color_HJ];
colors= [inputShaftText(11,2),inputShaftText(12,2),inputShaftText(13,2),inputShaftText(14,2)];
colors= cell2mat(colors);
clearvars inputShaftNum inputShaftText inputPropNum inputPropText;

save('inputDataFile');

end
