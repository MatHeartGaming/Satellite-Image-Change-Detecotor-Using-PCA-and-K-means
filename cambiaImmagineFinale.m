%% Script eseguito quando l'utente seleziona un altro anno finale

%% Cambiamento Selezionato
cambiamento = app.CambiaDropDown.Value;

%% Anno Finale Selezionato
annoFinale = app.AnnoFinaleDropDown.Value;

%% Immagine 2 Pannello Immagini Originali
path = ['./immagini/', cambiamento, '/_', annoFinale, '.png'];
app.Image_2.ImageSource = path;
app.Immagine2Label.Text = extractBetween(path, "_", ".");
app.pathIm2 = path;

%% Pannello Detection

run pca_kmeans_gui;