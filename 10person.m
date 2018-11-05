training_set=[];           
for i=1:10
    i
    for j=1:65               
        a=imread(strcat('/Users/lijingya/Desktop/mathematics_project/CroppedYale/0',num2str(i),'/','0',num2str(j),'.pgm'));
        b=a(1:192*168);  % N=32256    
        j                   
        b=double(b);
        training_set=[training_set;b]; %M*N matrix M=650 the number of picture
        
    end
end   
X = zeros(size(training_set));
Mean=mean(training_set); % 1*N column vector
for i=1:10
    X(i,:)=training_set(i,:)-Mean; % X is an M*N matrix, every row stands for every picture - meanpicture
    
end
figure; %Average face
subplot(1,2,1),imshow(mat2gray(reshape(Mean,192,168))); title('Mean');  %Average face 
subplot(1,2,2),imshow(mat2gray(reshape(X(1,:),192,168))); title('S1P1-Mean');


for n=1:10

        eval(['a',num2str(n),'=','training_set(n:65:650,:,:)',';']);

end

