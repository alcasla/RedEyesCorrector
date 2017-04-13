image1 = imread('ojos_rojos/gato1.jpg');
image2 = imread('ojos_rojos/ojo1.jpg');
image3 = imread('ojos_rojos/ojo2.jpg');
image4 = imread('ojos_rojos/ojo3.jpg');
image5 = imread('ojos_rojos/ojo4.jpg');
image6 = imread('ojos_rojos/ojo5.jpg');
image7 = imread('ojos_rojos/ojo6.jpg');
image8 = imread('ojos_rojos/ojo7.jpg');
image9 = imread('ojos_rojos/ojo8.jpg');
image10 = imread('ojos_rojos/pez.jpg');


%%
%GIF animated, show increment of intensity red
figure(1)
subplot(3,1,1), imshow(image11), title('Original');

for i = 0.01:0.01:1.0
    [output, mask] = redEyes(image11, i, 0.5, 2);
    
    subplot(3,1,2), imshow(mask), title('Mask');
    subplot(3,1,3), imshow(output), title(['Modified image: intensity red value ', num2str(i)]);
    pause(0.25);
end

%%
%GIF animated, show increment of saturation
figure(1)
subplot(3,1,1), imshow(image11), title('Original');

for i = 0.01:0.01:1.0
    [output, mask] = redEyes(image11, 0.9, i, 2);
    
    subplot(3,1,2), imshow(mask), title('Mask');
    subplot(3,1,3), imshow(output), title(['Modified image: saturation value ', num2str(i)]);
    pause(0.25);
end

%%
%GIF animated, show increment of filterSize
figure(1)
subplot(3,1,1), imshow(image11), title('Original');

for i = 0.5:0.01:2.0
    [output, mask] = redEyes(image11, 0.9, 0.5, i);
    
    subplot(3,1,2), imshow(mask), title('Mask');
    subplot(3,1,3), imshow(output), title(['Modified image: filter size multiplier ', num2str(i)]);
    pause(0.1);
end



%%
%Results with provided images
%
%gato1.jpg
[output, mask, regions] = redEyes(image1, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image1),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);  % 0

%ojo1.jpg
[output, mask, regions] = redEyes(image2, 0.9, 0.45, 2);
figure(1),
subplot(1,3,1),imshow(image2),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 2);  % 0.00346

%ojo2.jpg
[output, mask, regions] = redEyes(image3, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image3),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);  % 0

%ojo3.jpg
[output, mask, regions] = redEyes(image4, 0.9, 0.6, 2);
figure(1),
subplot(1,3,1),imshow(image4),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 2);  % 0

%ojo4.jpg
[output, mask, regions] = redEyes(image5, 0.9, 0.4, 2);
figure(1),
subplot(1,3,1),imshow(image5),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);  % 0

%ojo5.jpg
[output, mask, regions] = redEyes(image6, 0.9, 0.6, 2);
figure(1),
subplot(1,3,1),imshow(image6),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);  % 0

%ojo6.jpg
[output, mask, regions] = redEyes(image7, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image7),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);   % 0.00140

%ojo7.jpg
[output, mask, regions] = redEyes(image8, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image8),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);   % 0

%ojo8.jpg
[output, mask, regions] = redEyes(image9, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image9),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);  % 0

%pez.jpg
[output, mask, regions] = redEyes(image10, 0.8, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image10),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);   % 0



%%
%Results with my own images
image100 = imread('mis_ojos_rojos/ojos100.jpg');
image101 = imread('mis_ojos_rojos/ojos101.jpg');
image102 = imread('mis_ojos_rojos/ojos102.jpg');
image103 = imread('mis_ojos_rojos/ojos103.jpg');

%ojos100.jpg
[output, mask, regions] = redEyes(image100, 0.95, 0.7, 2);
figure(1),
subplot(1,3,1),imshow(image100),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);   % 0.00250

%ojos101.jpg
[output, mask, regions] = redEyes(image101, 0.8, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image101),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);   % 0

%ojos102.jpg
[output, mask, regions] = redEyes(image102, 0.9, 0.6, 2);
figure(1),
subplot(1,3,1),imshow(image102),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);   % 0.00361

%ojos103.jpg
[output, mask, regions] = redEyes(image103, 0.8, 0.4, 1);
figure(1),
subplot(1,3,1),imshow(image103),title('INPUT');
subplot(1,3,2),imshow(mask),title('MASK');
subplot(1,3,3),imshow(output),title('OUTPUT');
accuracy = quality(mask, regions, 1);   % 0.01969

