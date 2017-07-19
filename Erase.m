function Erase(~,~)
%ERASE Summary of this function goes here
%   Detailed explanation goes here

    answer=questdlg({'�tes-vous s�r de vouloir effacer la grille ?';'Cette action est irr�versible.'},'SDKR', 'Oui','Non','Non');
    switch answer
        case 'Oui'
            uistruct=guidata(gcbf);
            hcell=uistruct.hcell;
    
            for ind = 1:length(hcell)
                hcell(ind).String='';
                hcell(ind).ForegroundColor = [0 0 0];
                hcell(ind).Enable = 'on';
            end
        case 'Non'
            return
    end
    
    uidata=guihandles(gcbf);
    uidata.StartConfButton.Enable = 'on';
    uidata.ResetButton.Enable = 'off';
    
end

