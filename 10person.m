training_set=[];
labels = [];

for i=1:10
    i
    for j=1:40               
        a=imread(strcat('/Users/lijingya/Desktop/mathematics_project/CroppedYale/0',num2str(i),'/','0',num2str(j),'.pgm'));
        b=a(1:192*168);  % N=32256    
                          
        b=double(b);
        temp = zeros(1,10);
        temp(1,i)=1;
        labels=[labels,temp];
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
subplot(1,2,2),imshow(mat2gray(reshape(X(1,:),192,168))); title('A1-Mean');
k=10;
Sigma = X*X'; 
[V,D]=eigs(Sigma,k); %D is the k*k diagonal matrix, the diagonal elements are the first kth elements in Sigma.
%V is the M*k matrix, each column is an eignvector.
E=X'*V;

figure;
Train_E=training_set*E;
%Reduced the traning set dimensionality, we get a M*k matrix ()
for i=1:10

subplot(1,10,i),imshow(mat2gray(reshape(E(:,i),196,168)));     

title(strcat('k=',num2str(i)));

%show the first 10 eigenfaces.

end
testing_set=[];             %creat an empty set, which include the test picture.

for i=1:10

    for j=41:65             

       a=imread(strcat('/Users/lijingya/Desktop/mathematics_project/CroppedYale/0',num2str(i),'/','0',num2str(j),'.pgm'));

       b=a(1:196*168);      %convert the picture into 1*N vector

                            %order from top to bottom, left to right

       b=double(b);      

       testing_set=[testing_set;b];


       %testing_set is an M×N matrix?each colomn is a picture M=10×25=250,
       %N=196*168

    end

end