clc;
clear;
%subjects =  [25,33,35,63,66,69,76] %[20,21,22,23,26,28,29,31,36,37,38,39,40,41,42,43,44,45,46,47,50,51,52,53,54,55,56,57,58,59,64,65,67,68,70,71,72,73,74,75,77,78,79];
Main_path = 'G:\.shortcut-targets-by-id\1jDB8JHbPOHMicsIgpxLpEmcyL_p84mzr\Sample Data\Data by Subject\';

Ambient_path = 'G:\.shortcut-targets-by-id\1jDB8JHbPOHMicsIgpxLpEmcyL_p84mzr\Sample Data\Ambient\';

%% Best number for BVP envelope and median
%  for i = 1:8
%     subject = 83 %subjects(i)
%     BVP = csvread(fullfile(Main_path,num2str(subject),'\BVP.csv'));
%     BVP(1) = 0;
%     BVP(2) = 0;
%     BVP = BVP(~isnan(BVP));
% 
%     fid = fopen(fullfile([Ambient_path filesep num2str(subject) '_Env_1.txt']), 'rt');
%     output = textscan(fid, '%s %s %f %f %d', 'Delimiter',',');
%     %output = textscan(fid, '%s %f', 'Delimiter', ',', 'HeaderLines', 1);
%     fclose(fid);
%     Ambient = output{4};
%     [M,I] = max(Ambient);
%     Ambient = Ambient(1:I,1);
%     BVP = BVP(1: I*2*64,1);
%     x = [1:I]';
%     v = Ambient;
%     xq = [1:1/128:(I+1)]';
%     Ambient = interp1(x,v,xq);
%     Ambient = Ambient(~isnan(Ambient));
% 
%     [M,N] = size(Ambient);
%     BVP = BVP(1: M,1);
% 
%     %% Best number for median filtering
%     temp = medfilt1(BVP,1000);
%     Cor = corrcoef(temp,Ambient);
%     Cor = Cor(1,2);
%     Cor_max = Cor;
%     Step_max = 1000;
% 
%     for i = 1000:1000:50000
%         temp = medfilt1(BVP,i);
%         Cor = corrcoef(temp,Ambient);
%         Cor = Cor(1,2);
% 
%         if (Cor < 0) && (Cor_max >= Cor)
%            Step_max = i;
%            Cor_max = Cor;
%         end
%         if (Cor > 0) && (Cor >= Cor_max)
%            Step_max = i;
%            Cor_max = Cor;
%         end
%     end
%     Step_max_median = Step_max;
%     %% Best Number for enevelope
%     [Upper,Lower] = envelope(BVP,1000,'peak');
%     Cor = corrcoef(Upper,Ambient);
%     Cor = Cor(1,2);
%     Cor_max = Cor;
%     Step_max = 1000;
% 
%     for i = 1000:1000:50000
%         [Upper,Lower] = envelope(BVP,i,'peak');
%         Cor = corrcoef(Upper,Ambient);
%         Cor = Cor(1,2);
% 
%         if (Cor < 0) && (Cor_max >= Cor)
%            Step_max = i;
%            Cor_max = Cor;
%         end
%         if (Cor > 0) && (Cor >= Cor_max)
%            Step_max = i;
%            Cor_max = Cor;
%         end
%     end
%     
%     BVP = csvread(fullfile(Main_path,num2str(subject),'\BVP.csv'));
%     BVP(1) = 0;
%     BVP(2) = 0;
%     csvwrite(fullfile(Main_path,num2str(subject),'\BVP_median.csv'),medfilt1(BVP,Step_max_median));
%     
%     %csvwrite(fullfile(Main_path,num2str(subject),'\BVP_median_Normal.csv'),medfilt1(BVP,40000));
%     [Upper,Lower] = envelope(BVP,Step_max,'peak');
%     csvwrite(fullfile(Main_path,num2str(subject),'BVP_envelope.csv'),Upper);
%     %csvwrite(fullfile(Main_path,num2str(subject),'BVP_envelope_Normal.csv'),Upper);
%  end


%% Best number for Hearth rate
% for i = 1:43
%     subject = 66 %subjects(i)
%     HR = csvread(fullfile(Main_path,num2str(subject),'\HR.csv'));
%     HR(1) = 0;
%     HR(2) = 0;
% 
%     fid = fopen(fullfile([Ambient_path filesep num2str(subject) '_Env_1.txt']), 'rt');
%     %output = textscan(fid, '%s %s %f %f %d','Delimiter',',');
%     output = textscan(fid, '%s %f', 'Delimiter', ',', 'HeaderLines', 1);
%     fclose(fid);
%     Ambient = output{2};
%     
%     [M,I] = max(Ambient);
%     Ambient = Ambient(1:I,1);
%     HR = HR(1: I*2,1);
%     x = [1:I]';
%     v = Ambient;
%     xq = [1:1/2:(I+1)]';
%     Ambient = interp1(x,v,xq);
%     Ambient = Ambient(~isnan(Ambient));
% 
%     [M,N] = size(Ambient);
%     HR = HR(1: M,1);
% 
%     temp = medfilt1(HR,100);
%     Cor = corrcoef(temp,Ambient);
%     Cor = Cor(1,2);
%     Cor_max = Cor;
%     Step_max = 100;
% 
%     for i = 100:100:3000
%         temp = medfilt1(HR,i);
%         Cor = corrcoef(temp,Ambient);
%         Cor = Cor(1,2);
% 
%         if (Cor < 0) && (Cor_max >= Cor)
%            Step_max = i;
%            Cor_max = Cor;
%         end
%         if (Cor > 0) && (Cor >= Cor_max)
%            Step_max = i;
%            Cor_max = Cor;
%         end
%     end
%    HR = csvread(fullfile(Main_path,num2str(subject),'\HR.csv'));
%    HR(1) = 0;
%    HR(2) = 0;
%    csvwrite(fullfile(Main_path,num2str(subject),'\HR_median.csv'),medfilt1(HR,Step_max));
%    csvwrite(fullfile(Main_path,num2str(subject),'\HR_median_Normal.csv'),medfilt1(HR,500));
%  end
%% Best number of EDA enevelope
%  for i = 1:43
    subject = 76%subjects(i)
    EDA = csvread(fullfile(Main_path,num2str(subject),'\EDA.csv'));
    EDA(1) = 0;
    EDA(2) = 0;
    EDA = EDA(~isnan(EDA));

    fid = fopen(fullfile([Ambient_path filesep num2str(subject) '_Env_1.txt']), 'rt');
    %output = textscan(fid, '%s %s %f %f %d');
    output = textscan(fid, '%s %f', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
    Ambient = output{2};
    
    [M,I] = max(Ambient);
    Ambient = Ambient(1:I,1);
    EDA = EDA(1: I*2*4,1);
    x = [1:I]';
    v = Ambient;
    xq = [1:1/8:(I+1)]';
    Ambient = interp1(x,v,xq);
    Ambient = Ambient(~isnan(Ambient));

    [M,N] = size(Ambient);
    EDA = EDA(1: M,1);

 %% Best Number for enevelope
    [Upper,Lower] = envelope(EDA,100,'peak');
    Cor = corrcoef(Upper,Ambient);
    Cor = Cor(1,2);
    Cor_max = Cor;
    Step_max = 1000;

    for i = 100:100:2000
        [Upper,Lower] = envelope(EDA,i,'peak');
        Cor = corrcoef(Upper,Ambient);
        Cor = Cor(1,2);

        if (Cor < 0) && (Cor_max >= Cor)
           Step_max = i;
           Cor_max = Cor;
        end
        if (Cor > 0) && (Cor >= Cor_max)
           Step_max = i;
           Cor_max = Cor;
        end
    end
    
    EDA = csvread(fullfile(Main_path,num2str(subject),'\EDA.csv'));
    EDA(1) = 0;
    EDA(2) = 0;
    
    [Upper,Lower] = envelope(EDA,Step_max,'peak');
    csvwrite(fullfile(Main_path,num2str(subject),'EDA_envelope.csv'),Upper);
%  end

