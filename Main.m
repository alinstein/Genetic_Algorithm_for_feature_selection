
%  Genetic Algorithm (GA)                %


clc, 
clear, 
close all 
%Ionosphere dataset
% Benchmark data set contains 351 instances and 34 features (binaryclass)
% Matlab also provides this dataset (load Ionosphere.mat)



%% Ionosphere -------------------------------------------------------------

load ionosphere.mat; 
feat = f;
label = l;




%% Spambase ---------------------------------------------------------------
% %Call features & labels

% load spambase.data
% A=spambase;
% feat=A(:,1:57); label=A(:,58); 

%% ------------------------------------------------------------------------


%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% label: labelling
% N:     Number of chromosomes
% T:     Maximum number of generations
% CR:    Crossover rate
% MR:    Mutation rate
% selclass:Classification
% *Note: k-value of KNN & k-fold setting can be modified in jFitnessFunction.m
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
% curve: Convergence curve
%--------------------------------------------------------------------------


%selclass - this variable chooses the Classifier
%for KNN-selclass=1
%for Logistic Regression-selclass-2
%for Decision tree-selclass-3
%for SVM-selclass-4
       
disp("Select the classifier:")
fprintf('\n');
disp("    KNN --------------------- 1")
disp("    Logistic Regression ----- 2")
disp("    Decision tree ----------- 3")
disp("    SVM --------------------- 4")
fprintf('\n');
selclass = input('Classifier: ');

%%GA 
close all; N=10; T=20; CR=0.8; MR=0.01;
[sFeat,Sf,Nf,curve]=GA(feat,label,N,T,CR,MR,selclass);

% Plot convergence curve
figure(); plot(1:T,curve); xlabel('Number of Iterations');
ylabel('Fitness Value'); 


if selclass == 1

    title('Genetic Algorithm using KNN Classifier');
    curve_01 = curve;
    
end


if selclass == 2

    title('Genetic Algorithm using Logistic Regression Classifier'); 
    curve_02 = curve;
    
end


if selclass == 3

    title('Genetic Algorithm using Decision Tree Classifier');
    curve_03 = curve;
    
end


if selclass == 4

    title('Genetic Algorithm using SVM Classifier'); 
    curve_04 = curve;
    
end



grid on;


disp("Number of intial features ")
size(feat,2)
disp("Number of features after optimization using GA")
Nf





