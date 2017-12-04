function X = generate_alpha_stable(alpha, beta, uniform, expo) 
% generate_alpha_stable  Generates an alpha stable distribution.
%   X = generate_alpha_stable(alpha, beta, uniform, expo)
%   alpha and beta are the parameters of the distribution.
%   uniform and expo should be identically sized vectors of uniform and
%       exponentially distributed random numbers which will be used to 
%       generate x.
%   X is a vector of random variables of length equal to the length of 
%       uniform and expo.

    b = 1/alpha * atan(beta * tan(pi * alpha / 2));
    s = (1 + beta^2 * tan(pi * alpha /2)^2)^(1 / (2*alpha));
    
        
    X = s * sin(alpha * (uniform + b)) ./ ...
        cos(uniform).^(1 / alpha) .* ...
        (cos(uniform  - alpha * (uniform + b)) ./ expo).^((1 - alpha) / alpha);
end