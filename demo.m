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
%GIF animated, show increment of saturation
figure(2)
subplot(3,1,1), imshow(image9), title('Original');

for i = 0.01:0.01:1.0
    [output, mask] = redEyes(image9, 0.9, i, 2);
    
    subplot(3,1,2), imshow(mask), title('Mask');
    subplot(3,1,3), imshow(output), title(['Modified image: saturation value ', num2str(i)]);
    pause(0.3);
end

%%
%GIF animated, show increment of filterSize
figure(2)
subplot(3,1,1), imshow(image9), title('Original');

for i = 0.5:0.01:2.0
    [output, mask] = redEyes(image9, 0.9, 0.5, i);
    
    subplot(3,1,2), imshow(mask), title('Mask');
    subplot(3,1,3), imshow(output), title(['Modified image: filter size multiplier ', num2str(i)]);
    pause(0.1);
end


%%
%Results with provided images
%gato1.jpg
[output1, mask1] = redEyes(image1, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image1),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojo1.jpg
[output1, mask1] = redEyes(image2, 0.9, 0.45, 2);
figure(1),
subplot(1,3,1),imshow(image2),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojo2.jpg
[output1, mask1] = redEyes(image3, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image3),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojo3.jpg
[output1, mask1] = redEyes(image4, 0.9, 0.6, 2);
figure(1),
subplot(1,3,1),imshow(image4),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojo4.jpg
[output1, mask1] = redEyes(image5, 0.9, 0.4, 2);
figure(1),
subplot(1,3,1),imshow(image5),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojo5.jpg
[output1, mask1] = redEyes(image6, 0.9, 0.6, 2);
figure(1),
subplot(1,3,1),imshow(image6),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojo6.jpg
[output1, mask1] = redEyes(image7, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image7),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojo7.jpg
[output1, mask1] = redEyes(image8, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image8),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojo8.jpg
[output1, mask1] = redEyes(image9, 0.9, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image9),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%pez.jpg
[output1, mask1] = redEyes(image10, 0.8, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image10),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');


%%
%Results with my own images
image100 = imread('mis_ojos_rojos/ojos100.jpg');
image101 = imread('mis_ojos_rojos/ojos101.jpg');
image102 = imread('mis_ojos_rojos/ojos102.jpg');
image103 = imread('mis_ojos_rojos/ojos103.jpg');

%ojos100.jpg
[output1, mask1] = redEyes(image100, 0.95, 0.7, 2);
figure(1),
subplot(1,3,1),imshow(image100),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojos101.jpg
[output1, mask1] = redEyes(image101, 0.8, 0.5, 2);
figure(1),
subplot(1,3,1),imshow(image101),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojos102.jpg
[output1, mask1] = redEyes(image102, 0.9, 0.6, 2);
figure(1),
subplot(1,3,1),imshow(image102),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
%ojos103.jpg
[output1, mask1] = redEyes(image103, 0.8, 0.4, 1);
figure(1),
subplot(1,3,1),imshow(image103),title('INPUT');
subplot(1,3,2),imshow(mask1),title('MASK');
subplot(1,3,3),imshow(output1),title('OUTPUT');
