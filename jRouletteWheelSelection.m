
function Route=jRouletteWheelSelection(Prob)
% Cummulative summation
C=cumsum(Prob);
% Random one value, most probability value [0~1]
P=rand();
% Route wheel
for i=1:length(C)
	if C(i) > P
    Route=i; break;
  end
end
end