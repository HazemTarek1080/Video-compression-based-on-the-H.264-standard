function [decoded] = HuffDecode(encoded,dict)
%encoded is the encoded date
%dict is the Huffman dictionary
[r,~]=size(dict);
L=length(encoded);
decoded=string(L);
%looks up the encoded symbol in the huffman dictionary
for i=1:L
    for j=1:r
        if strcmp(encoded(i),dict(j).codeword)
            decoded(i)=dict(j).symbol;
        end
    end
end
end

