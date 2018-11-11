% DESCRIPTION
% Generate the images by walking through the pca components
%
% INPUTS
% [data]     (vector [nxm]) Original data.
% [K1]       (vector [nx1]) Eigenvalues of PCA. 
% [P1]       (vetor [1xn])  Eigenvectors of PCA.
% [dim]      (scalar)       Image width.
% [n]        (scalar)       Number of components you want to show.
% @author: Pedro Augusto and Estela Ribeiro
% FEI - Centro Universitário FEI
% =========================================================================

function pca_walk(data, K1, P1, dim, n)
    media = mean(data);
    p = 3; passo = 1;
    vetor = {};
    figure(2)
    for i = 1:n
        for j = -p:passo:p
            yy = media' + (j*sqrt(K1(i,:))).*P1(:,i); 
            yy = vec2mat(yy,dim);
            vetor = [vetor, yy];
        end
    end
    montage(vetor, colormap(gray(256)), 'Size', [n 7], 'ThumbnailSize', [1200 NaN]);

%If Matlab version < 2018:
%     newimage = reshape(vetor, [n,7]);
%     newimage = cell2mat(newimage);   
%     figure()
%     imshow (newimage)
end

