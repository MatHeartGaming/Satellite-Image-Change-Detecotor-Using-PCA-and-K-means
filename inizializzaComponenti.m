%% Sript richiamato all'avvio della GUI e quando l'utente 
%% cambia il cambiamento da analizzare

%% Cambiamento Selezionato

cambiamento = app.CambiaDropDown.Value;
%cambiamento = 'laghi';

%% Anni di Riferimento

files = dir(fullfile('./immagini/', cambiamento, '/', '*.png'));

lista_iniziale = string.empty;

for k=1:size(files)
    str_nome = files(k).name;
    nome = extractBetween(str_nome, "_", ".");
    lista_iniziale(k) = nome;
end

app.AnnoInizialeDropDown.Items = lista_iniziale;
lista_finale = fliplr(lista_iniziale);
app.AnnoFinaleDropDown.Items = lista_finale;

%% Pannello Immagini Originali

path = ['./immagini/', cambiamento, '/', files(1).name];
app.Image.ImageSource = path;
path2 = ['./immagini/', cambiamento, '/', files(k).name];
app.Image_2.ImageSource = path2;

label1 = extractBetween(files(1).name, "_", ".");
app.Immagine1Label.Text = label1;
label2 = extractBetween(files(k).name, "_", ".");
app.Immagine2Label.Text = label2;

%% Pannello Detection

run pca_kmeans_gui;