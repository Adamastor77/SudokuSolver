function [lig,col] = hcell2lcsub( dim,hcellnb )
%HCELL2LCS Summary of this function goes here
%   Detailed explanation goes here

    % Test sur hcellnb vs. dim
    if hcellnb < 1 || dim^2 < hcellnb
        h_err = errordlg('num�ro de case impossible par rapport � dimension de la grille','SDKR');
        uiwait(h_err)
        return
    end
    % D�termination des num�ros de lignes et colonnes
    lig=mod(hcellnb,dim);
    if lig==0
        lig=dim;
        col=hcellnb/dim;
    else
        col=floor(hcellnb/dim)+1;
    end
    
end

