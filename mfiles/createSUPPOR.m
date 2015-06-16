function createSUPPOR()

load inputDataFile;
load NODES;
%CREATESUPPOR Summary of this function goes here
%   Detailed explanation goes here
% 'SUPPOR'
% / 111-109(-1) 127-112(-1) 143-128(-1) 144 394-452 666 657 671-667(-1)
% 664-658(-1) 675 680 681 672 679-676(-1) 673 684 682 687-685(-1) 690 691 689 688
% 941-943 959 944-958 960 961 963-975 978 979 976 977 981-991 997 996 992-995 999
% 1213 1204 1215 1214 1211-1205(-1) 1222 1227 1228 1219 1218 1226 1217 1225 1216
% 1224 1223 1220 1231 1229 1237 1238 1236-1232(-1) 1488-1503 1507 1506 1508 1504
% 1505 1510-1519 1525 1526 1520-1524 1528-1535 1544 1543 1536-1542 1546 1751
% 1758-1752(-1) 1769 1760 1774 1775 1766 1765 1773 1764 1772 1763 1771 1762 1770
% 1761 1767 1778 1784 1785 1776 1783-1779(-1) 2035-2047 2054 2053 2055 2048-2052
% 2057-2063 2072 2073 2064-2071 2075-2079 2091 2090 2080-2089 2093 2298
% 2303-2299(-1) 2316 2307 2313-2311(-1) 2319 2310 2318 2309 2317 2308 2314 2305
% 2304 2321 2322 2320 2325 2331 2332 2323 2330-2326(-1) 2582-2591 2601 2600 2602
% 2592-2599 2604-2607 2619 2620 2608-2618 2622 2623 2638 2637 2624-2636 2640 2845
% 2847 2846 2863 2854 2860-2855(-1) 2861 2852-2848(-1) 2868 2869 2867-2864(-1)
% 2872 2878 2879 2870 2877-2873(-1) 3129-3135 3148 3147 3149 3136-3146 3151 3166
% 3167 3152-3165 3169-3183 3185 3184 3187 3401 3392 3407-3402(-1) 3399-3393(-1)
% 3410 3415 3416 3414-3411(-1) 3408 3419 3417 3423-3420(-1) 3425 3426 3424
% 3676-3679 3695 3694 3680-3693 3696 3698-3711 3713 3714 3712 3716-3727 3732 3731
% 3728-3730 3734 3948 3939 3951-3949(-1) 3946-3940(-1) 3957 3962 3963 3954 3953
% 3961 3952 3960-3958(-1) 3955 3966 3964 3967 3972 3973 3971-3968(-1) 4223-4239
% 196497 196505 196496 196504-196501(-1) 196767-196787 196789 196791-196805 196809
% 196810-196822(2) / TR 3
SPRING_RADIUS_HIG=shaftRadius+springToWall+12;
SPRING_RADIUS_LOW=shaftRadius+springToWall-12;

ringN=shaftDepth/segmentHeight;
FIXBOTTOM_LOW=(ringN)*(-segmentHeight-segmentGap)-segmentHeight/2-12;
FIXBOTTOM_HIG=(ringN)*(-segmentHeight-segmentGap)-segmentHeight/2+12;

disp(sprintf('''SUPPOR'''));

disp(sprintf('NAME FIXSPRING'));
[currentNODE] = searchNODE(NODES,'r',SPRING_RADIUS_LOW,SPRING_RADIUS_HIG);
[row, col] = size(currentNODE);
loopSize = row;
string2='/';
for i = 1:loopSize
    if rem(i,10) ~= 0
        string2 = sprintf('%s %i',string2,currentNODE(i));
    else
        string2 = sprintf('%s %i\n',string2,currentNODE(i));
    end
end
string2 = strcat(string2,' / TR 3 TR 2 TR 1');
disp(string2);

% 
% disp(sprintf('NAME FIXSEGMENTZ'));
% [currentNODE] = searchNODE('r',shaftRadius-12,shaftRadius+12);
% [row, col] = size(currentNODE);
% loopSize = row;
% string2='/';
% for i = 1:loopSize
%     if rem(i,10) ~= 0
%         string2 = sprintf('%s %i',string2,currentNODE(i));
%     else
%         string2 = sprintf('%s %i\n',string2,currentNODE(i));
%     end
% end
% string2 = strcat(string2,' / TR 3');
% disp(string2);





disp(sprintf('NAME BOTTOMNODES'));
[currentNODE] = searchNODE(NODES,'z',FIXBOTTOM_LOW,FIXBOTTOM_HIG);
[currentNODE] = searchNODE(NODES([currentNODE'],:),'r',shaftRadius-12,shaftRadius+12);
[row, col] = size(currentNODE);
loopSize = row;
string2='/';
for i = 1:loopSize
    if rem(i,10) ~= 0
        string2 = sprintf('%s %i',string2,currentNODE(i));
    else
        string2 = sprintf('%s %i\n',string2,currentNODE(i));
    end
end
string2 = strcat(string2,' / TR 3 TR 2 TR 1');
disp(string2);
DEBUG=1;
