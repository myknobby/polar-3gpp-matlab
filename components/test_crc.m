while 1
    
    P = randi([2,20]);
    
    crc_generator_pattern = round(rand([1,P]));
    crc_generator_pattern(1) = 1;
    crc_generator_pattern(end) = 1;
    
    
    A = randi([0,100]);
    
    [P,A]
    
    G_P = get_crc_generator_matrix(A, crc_generator_pattern);
    
    a = round(rand([1,A]));
    
    a2 = a;
    a2(1:A < P) = ~a2(1:A<P);
    
    crc1 = mod(a2*G_P,2);
    crc1((A+1:A+P) < P) = ~crc1((A+1:A+P) < P);
    
    crc2 = calculate_crc_ones(a,crc_generator_pattern);
    
    if ~isequal(crc1,crc2)
        [crc1;crc2]
        error('Rob');
    end
end