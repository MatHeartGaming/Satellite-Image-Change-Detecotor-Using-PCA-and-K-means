%% Script eseguito quando l'utente seleziona un altro anno iniziale

%% Cambiamento Selezionato
cambiamento = app.CambiaDropDown.Value;

%% Anno Iniziale Selezionato
annoIniziale = app.AnnoInizialeDropDown.Value;

%% Immagine 1 Pannello Immagini Originali
path = ['./immagini/', cambiamento, '/_', annoIniziale, '.png'];
app.Image.ImageSource = path;
app.Immagine1Label.Text = extractBetween(path, "_", ".");
app.pathIm1 = path;

%% Pannello Detection

run pca_kmeans_gui;