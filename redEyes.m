%%
%Function detect and darken red eyes
%This function generate a mask based on colormap and improving it through
%morphology operations to apply for input to generate output image.
%
%PARAMS:    <img> Imput image, original
%           <intensity> Value between [0,1] to filter color pixels in HSV colormap
%           <saturation> Value between [0,1] to filter saturation pixels in
%                       HSV colormap, apply combined to intensity
%           <filterSize> Value between [0,+inf] multiply mean area to
%                       remove too large regions. Bigger filter bigger regions only
%
function [image, mask, regions] = redEyes(img, intensity, saturation, filterSize)
    %%
    %INITIAL MASK based on colormap
    Ihsv=rgb2hsv(img);      %get HSV colormap image to work with red colors
    
    %preallocate matrix mask and initial configuration with very red pixels
    mask = zeros(length(img(:,1,:)),length(img(1,:,:)));
    for i=1:1:length(img(:,1,:))    %cross mask matrix row by row
        for j=1:1:length(img(1,:,:))
            %check color intensity and saturation = deep red
            if (Ihsv(i,j,1)>intensity || Ihsv(i,j,1)<0.02) && Ihsv(i,j,2)>saturation
                mask(i,j)=1;
            end
        end
    end
    
    %%
    %TUNE MASK through circular morphology
    form = strel('disk',2);     %circular form with 2 radio units
    %first, I perform a opening process that remove independent points,
    %after dilate rest ones to get forme similar to origianl
    maskOpen = imopen(mask, form);
    mask = imdilate(maskOpen, form);
    
    %there aren´t small points, I´ll detect large red areas, like hair or
    %clothes, linked and remove
    [imgLabeled, regions]=bwlabel(mask);    %label each region
    
    %get region features, mainly area
    featureRegions = regionprops(imgLabeled);
    areas = [featureRegions(:).Area];

    meanArea=mean(areas);   %mean area from detected regions
    tooLarge = find([featureRegions.Area] > filterSize*meanArea);   %label of too large regions

    for k=1:size(tooLarge,2)    %each region
        area2remove = floor(featureRegions(tooLarge(k)).BoundingBox);   %ronud real to integer indexes
        
        if area2remove(1)<1     %avoid 0 index by previous round
            area2remove(1)=1 
        end
        if area2remove(2)<1     %avoid 0 index by previous round
            area2remove(2)=1 
        end
        
        %remove from mask too large regions
        mask(area2remove(2):area2remove(2)+area2remove(4), area2remove(1):area2remove(1)+area2remove(3)) = 0;
    end
    
    
    %%
    %generate OUTPUT IMAGE applying mask
    image = img;    %output image
    
    %cross input image and modify based on mask and darken pixelsindex to
    %generate output image without red eyes
    for i=1:size(img,1)
        for j=1:size(img,2)
            if mask(i,j)==1
                %image(i,j,1) = 0;     %great change, bad result
                image(i,j,:) = mean([image(i,j,1),image(i,j,2),image(i,j,3)]);   %neutral value
            end
        end
    end
    
end