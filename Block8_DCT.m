%This function computes the DCT of 8x8 Block. 
%It takes 8x8 Block and returns 8x8 DCT of that Block
function dct_result=Block8_DCT(block_8)
[R,C]=size(block_8);
%intialize the basis block
basis=zeros(R,C);
if R~=8 || C~=8
    disp('Error in block size');
end
%looping over the size of the basis and size of the input
dct_result=zeros(8,8);
for u=0:7
    for v=0:7
        for x=0:7
            for y=0:7
                % constructing the basis function
                basis(x+1,y+1)=(cos((1/16)*(2*x+1)*u*pi))*(cos((1/16)*(2*y+1)*v*pi));
            end
        end
        % multiplying each pixel to the corresponding basis block and averaging them then storing in dct_result
        dct_result(u+1,v+1)=sum(sum(block_8.*basis));
    end
end
% Scaling
dct_result(1,1)=(1/64)*dct_result(1,1);             %The first value in the block /64
dct_result(1,2:8)=(1/32)*dct_result(1,2:8);         %The first row /32
dct_result(2:8,1)=(1/32)*dct_result(2:8,1);         %The first column /32
dct_result(2:8,2:8)=(1/16)*dct_result(2:8,2:8);     % the rest of the block/16
end
