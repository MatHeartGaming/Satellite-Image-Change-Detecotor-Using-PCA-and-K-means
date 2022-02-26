function [file, path] = cambiaImmagineFileSystem(image)

    [file, path] = uigetfile({'*.*;*.jpg;*.png'}, 'Select File to Open');
    fullname = [path, file];  % Get path and file to allow the UI Image Component to render the choosen image
    if ~isequal(file,0)
        image.ImageSource = fullname; % Load the image into the UI Image Component
        I = imread(fullfile(path, file));
    end
end