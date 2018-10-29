training_set=[];           
for i=1:10
    for j=1:65               
        a=imread(strcat('/Users/lijingya/Desktop/mathematics_project/CroppedYale/0',num2str(i),'/','0',num2str(j),'.pgm'));
        b=a(1:192*168);      
                            
        b=double(b);        
        training_set=[training_set;b];
        X = zeros(10,650);
    end
end
Mean=mean(training_set);    

for i=1:10
    X(i,:)=training_set(i,:)-Mean;
end
figure;
subplot(1,2,1),imshow(mat2gray(reshape(Mean,192,168)));
title('Mean');   
subplot(1,2,2),imshow(mat2gray(reshape(X(1,:),192,168))); title('S1P1-Mean');

