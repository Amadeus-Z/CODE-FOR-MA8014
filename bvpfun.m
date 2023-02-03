% Inputs: interval inter, boundary values, grid points n, c: \epsilon 
% Output: solution u
function u = bvpfun(inter,bv,n,c) 
    a =inter(1); b = inter(2); % interval
    ua = bv(1); ub = bv(2); % boundary value
    h=(b-a)/n; % uniform mesh

    u = zeros(n+1,1);
    u(1)= ua; u(n+1)=ub;

    f=zeros(n-1,1);
    f(1)= -1-c/(h*h)*u(1)-1/(2*h)*u(1);
    f(n-1)= -1-c/(h*h)*u(n+1)+1/(2*h)*u(n+1);

    for i=2:n-2
        f(i) = -1;
    end
    
    A = c/(h*h)*udd(n)-1/(2*h)*ud(n); % the matrix A
    u1 = A\f; % Au=f

    for i = 2:n
        u(i)=u1(i-1);
    end

    e = zeros(n+1,1); % GTE
    for i=1:n+1
        e(i)=uexa(a+(i-1)*h,c,bv)-u(i);
    end


  % Different kinds of graphs:


      plot([a a+(1:n-1)*h b], uexa([a a+(1:n-1)*h b]',c,bv),'r',[a a+(1:n-1)*h b], u','-bo' );
     % plot([a a+(1:n-1)*h b], uexa([a a+(1:n-1)*h b]',c,bv)); % exact solution graphs
     % plot([a a+(1:n-1)*h b], u',"o"); % FDM solution graphs
     % plot([a a+(1:n-1)*h b], e' );
      hold on






end

    function u1 = udd(n) % U''
        u1 = zeros(n-1,n-1);
        for i=1:n-1
            u1(i,i) = -2;
        end
        for i=1:n-2
            u1(i,i+1) = 1;
        end
        for i=2:n-1
            u1(i,i-1) = 1;
        end
    end

    function u2 = ud(n) % U'
        u2 = zeros(n-1,n-1);
        for i=1:n-1
            u2(i,i) = 0;
        end
        for i=1:n-2
            u2(i,i+1) = 1;
        end
        for i=2:n-1
            u2(i,i-1) = -1;
        end
    end

    function u3 = uexa(x,c,bv) % exact solution
        u3 = bv(1)+x+(bv(2)-bv(1)-1)*(exp(x/c)-1)/(exp(1/c)-1);
    end
