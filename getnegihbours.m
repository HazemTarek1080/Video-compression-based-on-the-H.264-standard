% This function returns all the possible neighbors of a given block in a frame.
% It takes four input arguments:
%   - r: the row index of the top left corner of the block
%   - c: the column index of the top left corner of the block
%   - rc: the number of rows in the frame
%   - cc: the number of columns in the frame
% It returns a matrix neighbours that contains the row and column indices of the neighboring blocks.
function neighbours = getnegihbours(r,c,rc,cc)
    
    % Initialize the neighbours matrix
    neighbours = [];
    
    % If the block is in the top left corner of the frame
    if r==1 && c==1
        % Include the blocks to the right, below, and bottom right of the given block
        neighbours = [[r,c]; [r+8,c]; [r,c+8]; [r+8,c+8]];
    % If the block is in the bottom left corner of the frame
    elseif r==rc && c==1
        % Include the blocks above, to the right, and top right of the given block
        neighbours = [[r,c]; [r-8,c]; [r,c+8]; [r-8,c+8]];
    % If the block is in the top right corner of the frame
    elseif r==1 && c==cc
        % Include the blocks below, to the left, and bottom left of the given block
        neighbours = [[r,c]; [r,c-8]; [r+8,c]; [r+8,c-8]];
    % If the block is in the bottom right corner of the frame
    elseif r==rc && c==cc
        % Include the blocks above, to the left, and top left of the given block
        neighbours= [[r,c]; [r-8,c]; [r,c-8];[r-8,c-8]];
    % If the block is in the top row of the frame (but not in a corner)
    elseif r==1
                % Include the blocks to the left, right, and below the given block, as well as the blocks to the bottom left and bottom right
        neighbours = [[r,c]; [r,c-8];[r,c+8]; [r+8,c]; [r+8,c-8]; [r+8,c+8]];
    % If the block is in the bottom row of the frame (but not in a corner)
    elseif r==rc
        % Include the blocks to the left, right, and above the given block, as well as the blocks to the top left and top right
        neighbours = [[r,c]; [r,c-8];[r,c+8]; [r-8,c]; [r-8,c-8]; [r-8,c+8]];
    % If the block is in the left column of the frame (but not in a corner or along the top or bottom edge)
    elseif c==1
        % Include the blocks above, below, and to the right of the given block, as well as the blocks to the top right and bottom right
        neighbours = [[r,c]; [r,c+8]; [r+8,c]; [r-8,c]; [r+8,c+8]; [r-8,c+8]];
    % If the block is in the right column of the frame (but not in a corner or along the top or bottom edge)
    elseif c==cc
        % Include the blocks above, below, and to the left of the given block, as well as the blocks to the top left and bottom left
        neighbours = [[r,c]; [r,c-8]; [r+8,c]; [r-8,c]; [r+8,c-8]; [r-8,c-8]];
    % If the block is not in a corner, along the top or bottom edge, or along the left or right edge
    else
        % Include all eight neighboring blocks
        neighbours = [[r,c]; [r+8,c]; [r-8,c]; [r,c+8]; [r,c-8]; [r-8,c-8]; [r-8,c+8]; [r+8,c-8]; [r+8,c+8]];
    end
end
