% This function performs motion estimation and compensation on a video sequence.
% It takes two input arguments:
%   - inference: a frame from a previous time point in the video
%   - current: the frame at the current time point
% It returns two output arguments:
%   - motion_vector: a matrix containing the motion vectors for each 8x8 block of pixels in the current frame
%   - difference_frame: a matrix containing the difference between the corresponding blocks in the current and inference frames
function [motion_vector,difference_frame] = estimation(inference,current)
    
    % Get the size of the current frame
    [rc,cc] = size(current);
    
    % Initialize the motion_vector and difference_frame matrices
    motion_vector = [];
    difference_frame = zeros(rc, cc);
    
    % Loop over the current frame in 8x8 blocks
    for i = 1:8:rc-8
        for j = 1:8:cc-8
            
            % Construct the current block to find its match
            current_block = double(current(i:i+7,j:j+7));
            
            % Initialize the residual error to infinity
            residual = inf;
            
            % Get the neighboring blocks of the current block in the inference frame (the "searching area")
            neighbours = getnegihbours(i,j,rc,cc);
            
            % Get the number of neighboring blocks
            rn = size(neighbours,1);
            
            % Loop over the neighbors to find the best match
            for k = 1:rn
                
                % Get the row and column indices of the current neighbor
                ri = neighbours(k,1);
                ci = neighbours(k,2);
                
                % Construct the inference block
                infer_block = double(inference(ri:ri+7,ci:ci+7));
                
                % Calculate the residual error between the current block and the current neighbor
                residual_new = sum(sum((current_block-infer_block).^2));
                
                % If the current neighbor has a lower residual error than the current best match, update the best match
                if residual_new < residual
                    best_match = current_block - infer_block;
                    residual = residual_new;
                    r = ri;
                    c = ci;         
                end
            end
            
            % Append the best match block by block to construct the difference_frame
            difference_frame(i:i+7, j:j+7) = best_match;
            
            % Construct the motion vector
            motion_vector = [motion_vector [r,c]];
            
        end
    end

end
