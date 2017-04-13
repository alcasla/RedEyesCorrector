%%
%Function compute quiality for red eyes correction
%This function is based on the mask applyed in red eyes correction and also
%the number of regions detected penalize the meassure wheter the number of
%regions is higher than 2 (eye regions).
%Measure range [0,1]. Higher is worse, greater error.
%
%The measure keeps in mind mean area from mask regions, number of wrong
%regions and image size, this values match measure between different
%scenes with different size areas.
%
%PARAMS:    <mask> Mask applyed in red eye correcton process
%           <regions> Integer value, number of regions detected in mask
%           <persons> Integer value, number of persons in the image
%
function [accuracy] = quality(mask, regions, individuals)
    if regions==0   %worst scene, detect nothing
        accuracy=Inf;
    else
        if regions<=(2*individuals) %detect a person multiple number of eyes, perfect
            accuracy=0;
        else
            meanArea = sum(sum(mask(:,:)==1))/regions;
            accuracy = (meanArea*(regions-(2*individuals)))/(size(mask,1)*size(mask,1));
        end
    end
end