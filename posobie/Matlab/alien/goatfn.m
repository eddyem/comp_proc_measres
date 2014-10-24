        % This is the function which arises in the problem
        % of the goat grazing over half the area of a circular
        % field.  It is written so that x can be a vector
        % of values as well as just a single value; hence
        % the use of .* in the multiplications.  Note
        % however that there is no need for ./ in x/20,
        % nor for .* in the multiplication by 2.
        
        function y=goatfn(x)
        y=2*(x.*x-200).*acos(x/20)-x.*sqrt(400-x.*x) + 100*pi;
        end;
