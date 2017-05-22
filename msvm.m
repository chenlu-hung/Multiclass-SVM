function fit = msvm(gnd,fea,C)
    [n,p] = size(fea);
    [labels,junk,idx] = unique(gnd);
    c = length(labels);
    y = -ones(n,c)/(c-1);
    L = ones(n,c);
    for i = 1:n
        y(i,idx(i)) = 1;
        L(i,idx(i)) = 0;
    end
    cvx_begin quiet
        variable b(p,c)
        minimize( ones(1,n)*(max(0,fea*b-y).*L)*ones(c,1)+C*sum(norms(b))/2 )
        subject to
            sum(fea*b,2)==0    
    cvx_end
    fit.beta = b;
    fit.labels = labels;
end