function gnd_Test = predict_msvm(fit,fea_Test)
    [n,p] = size(fea_Test);
    proj = fea_Test*fit.beta;
    gnd_Test = zeros(n,1);
    for i = 1:n
        [trash,idx] = max(proj(i,:));
        gnd_Test(i) = fit.labels(idx);
    end
end