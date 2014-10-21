function I = drawBB(I, bb, color, width)
% DRAWBB takes image I and bb (x_min, y_min, x_max, y_max) and draws onto I
% returns the resulting image
if nargin == 2
    color = [255, 0, 0]; % red
    if size(I, 3) == 1
        color = 255;
    end
    width = 2; % pixels
end

color = uint8(reshape(color, 1, 1, []));
x_min = bb(1); y_min = bb(2); x_max = bb(3); y_max = bb(4);
I(y_min : y_min + width - 1, x_min : x_max, :) = repmat(color, width, x_max - x_min + 1);
I(y_max : y_max + width - 1, x_min : x_max, :) = repmat(color, width, x_max - x_min + 1);
I(y_min : y_max, x_min : x_min + width - 1, :) = repmat(color, y_max - y_min + 1, width);
I(y_min : y_max, x_max : x_max + width - 1, :) = repmat(color, y_max - y_min + 1, width);

