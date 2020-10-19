function cellp=FindCand(~,~)
%FINDCAND Summary of this function goes here
%   Detailed explanation goes here

    % R�cup�ration des donn�es et m�ta-donn�es li�es � l'interface
    % graphique
    uistruct=guidata(gcbf);
    hcell=uistruct.hcell;
    dim=uistruct.dim;

    matrix=zeros(sqrt(length(hcell)));
    % Cr�ation matrice
    for ind = 1:length(hcell)
        matrix(ind) = str2double(hcell(ind).String);
    end
        
    % Cr�ation et pr�-allocation des cellules interm�diaires
    cell_inter=cell(size(matrix,1),size(matrix,2));
    cell_lig=cell(size(matrix,1),size(matrix,2));
    cell_col=cell(size(matrix,1),size(matrix,2));
    cell_squ=cell(size(matrix,1),size(matrix,2));
    
    % Cr�ation de cellule des possibilit�s
    cellp=cell(size(matrix,1),size(matrix,2));
    numbers=1:dim^2;
        
    % Initialisation compteur chiffres ins�r�s
    fnd=0;
    
    % Recherche sur contraintes de bases
    for ind = 1:length(hcell)
        [lig,col,squ]=hcell2lcs(dim,ind);
        if ~isnan(matrix(ind))
            cellp{ind}=NaN;
        else
            cell_lig{ind}=setdiff(numbers,matrix(lig,:));
            cell_col{ind}=setdiff(numbers,matrix(:,col));
            
            cell_inter{ind}=intersect(cell_lig{ind},cell_col{ind});
            
            squmat=squ2hcells(dim,squ);
            cell_squ{ind}=setdiff(numbers,matrix(squmat));
            
            cellp{ind}=intersect(cell_inter{ind},cell_squ{ind});
            
        end
    end
end

