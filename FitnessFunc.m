%-----------------------------Fitness Function--------------------------------------------%



function fitness=FitnessFunc(feat,label,X,selclass)
% Parameter setting for k-value of KNN
k=5; 
% Parameter setting for number of cross-validation
kfold=2;
% Error rate
fitness=jwrapper(feat(:,X==1),label,k,kfold,selclass);
end

% Perform KNN with k-folds cross-validation
function ER=jwrapper(feat,label,k,kfold,selclass)


switch selclass
    case 1
        %%KNN
        Model=fitcknn(feat,label,'NumNeighbors',k,'Distance','euclidean'); 
        C=crossval(Model,'KFold',kfold);
        ER=kfoldLoss(C);
    case 2
       % Logistic Classifer
        Model=fitclinear(feat,label,'KFold',kfold,'Learner','logistic'); 
        numCLModels = numel(Model.Trained);
        %Mdl1 = Model.Trained{1}
        ER = kfoldLoss(Model);
    case 3
        %Decision tree
        Model=fitctree(feat,label);
        C=crossval(Model);
        ER = kfoldLoss(C);
        
    case 4
        %SVM
        %Model1=fitcsvm(feat,label,'KFold',kfold,'Standardize',true)
        Model1=fitcsvm(feat,label);
        C1=crossval(Model1);
        ER=kfoldLoss(C1);
    end 
end







