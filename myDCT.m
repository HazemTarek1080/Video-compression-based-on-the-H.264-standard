function [transformed] = myDCT(image)
%Inputs: 
%image which is the image that is going to be transformed
%Outputs:
%transformed which is the transformed image
%Note: this is not a generic DCT, it is tailored for JPEG operation as it
%splits the input image into 8*8 blocks and perform DCT on each block
[r,c]=size(image);
transformed=zeros(r,c);
for i=1:8:r-8
    for j=1:8:c-8
        block=double(image(i:i+7,j:j+7));
        newblock=zeros(8,8);
        newblock=Block8_DCT(block);
        transformed(i:i+7,j:j+7)=newblock;
    end
end
end

