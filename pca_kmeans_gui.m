%% PCA / K-MEANS Clustering

%% Script eseguito all' avvio della GUI e quando l'utente seleziona

%% - un altro cambiamento
%% - un altro anno iniziale
%% - un altro anno finale
%% - un altro valore di h nel pannello detection

fprintf('\nPCA / K-MEANS Clustering\n')

%% Cambiamento Selezionato

cambiamento = app.CambiaDropDown.Value;

%% Anno Iniziale Selezionato
annoIniziale = app.AnnoInizialeDropDown.Value;

%% Anno Finale Selezionato
annoFinale = app.AnnoFinaleDropDown.Value;


%% h selezionato Pannello Detection
h = round(app.hSlider.Value);

% Esegue il k_means solo quando h = 2,4,6,8,10:
 
f = waitbar(.10, 'Processing PCA/K-MEANS Clustering...');

%% Carichiamo le immagini im1 e im2

if app.isFileSystem == false
    path_im1 = ['./immagini/', cambiamento, '/_', annoIniziale, '.png'];
    path_im2 = ['./immagini/', cambiamento, '/_', annoFinale, '.png'];
    app.pathIm1 = path_im1;
    app.pathIm2 = path_im2;
    im1 = imread(app.pathIm1);
    im2 = imread(app.pathIm2);
else
    im1 = imread(fullfile(app.pathIm1, app.file1));
    im2 = imread(fullfile(app.pathIm2, app.file2));
end
    
%% Controllo sulgli Anni:
annoIniziale_num = str2double(annoIniziale);
annoFinale_num = str2double(annoFinale);

if annoIniziale_num <= annoFinale_num
    % im1 = im1
    % im2 = im2
    [change_map] = pca_kmeans(im1,im2,h);
    imshow(change_map, 'Parent' , app.UIAxes);
    img_title = ['h = ', num2str(h)];
    app.UIAxes.Title.String = img_title;
    imwrite(change_map,'change_map.png');
end

if annoFinale_num <= annoIniziale_num
    [change_map] = pca_kmeans(im2,im1,h);
    imshow(change_map, 'Parent' , app.UIAxes);
    img_title = ['h = ', num2str(h)];
    app.UIAxes.Title.String = img_title;
    imwrite(change_map,'change_map.png');
end

waitbar(.90, f, 'Finishing');
close(f); 

