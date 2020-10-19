function ShHiCand(hobj,~)
%SHHICAND Summary of this function goes here
%   Detailed explanation goes here

% R�cup�ration des donn�es et meta-donn�es de l'UI
uidata=guihandles(gcbf);
uidata.EraseButton.Enable='On';

uistruct=guidata(gcbf);
hcell=uistruct.hcell;
dim=uistruct.dim; % A contr�ler si n�cessaire
h_candcell=uistruct.h_candcell;

candVisible=false;
% Recherche si candidats d�j� affich�s
for ind = 1:length(hcell)
    for jnd = 1:dim^2
        if strcmp(h_candcell(ind,jnd).Visible,'on')
            candVisible=true;
            break
        end
    end
end

if candVisible==true
    for ind=1:length(hcell)
        for jnd = 1:dim^2
            h_candcell(ind,jnd).Visible='off';
        end
    end
    return
end

matrix=zeros(sqrt(length(hcell)));
% Cr�ation matrice
for ind = 1:length(hcell)
    matrix(ind) = str2double(hcell(ind).String);
end
 
cellPossible=FindCand;

% Affichage candidats si cellule vide
for ind =1:length(hcell)
    if isnan(matrix(ind))
        subMat=cell2mat(cellPossible(ind));
        for jnd=1:dim^2
            if sum(subMat==jnd)==1
                h_candcell(ind,jnd).Visible='on';
            end     
        end
    end
end

end

