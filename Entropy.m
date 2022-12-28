function [entropy] = Entropy(prob)
%calculates the source entropy given the probability distibution of its
%symbols
entropy= -sum(prob.*log(prob)/log(2));
end

