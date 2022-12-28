function [image] = myIDCT(transformed)
%Inputs:
%transformed which is the transformed image
%Outputs:
%image which is the image after reversing the DCT transform
%Note: this is not a generic IDCT, it is tailored for JPEG operation as it 
%splits the input transformed image into 8*8 blocks and perform IDCT on each block
[r,c]=size(transformed);
image=double(zeros(r,c));
for i=1:8:r-8
    for j=1:8:c-8
        block=transformed(i:i+7,j:j+7);
        newblock=zeros(8,8);
        newblock=Block8_IDCT(block);
        image(i:i+7,j:j+7)=double(newblock);
    end
end
end

