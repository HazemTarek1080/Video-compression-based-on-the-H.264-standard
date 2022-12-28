function idct_result=Block8_IDCT(block_8)
[R,C]=size(block_8);
%intialize the basis block
basis=zeros(R,C);
if R~=8 || C~=8
    disp('Error in block size');
end
%looping over the size of the basis and size of the input
idct_result=zeros(8,8);
for u=0:7
    for v=0:7
        for x=0:7
            for y=0:7
                % constructing the basis function
                basis(x+1,y+1)=(cos((1/16)*(2*x+1)*u*pi))*(cos((1/16)*(2*y+1)*v*pi));
            end
        end
        % multiplying each pixel to the corresponding basis block and averaging them then storing in dct_result
        idct_result= idct_result + block_8(u+1, v+1)*basis;
    end
end

end

