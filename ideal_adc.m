function code = ideal_adc(vin, N, Vref)
% IDEAL_ADC  Ideal N-bit quantizer, code k for k*LSB <= vin < (k+1)*LSB.
LSB  = Vref / (2^N);
code = floor(vin / LSB);
code(code < 0) = 0;
code(code > (2^N-1)) = 1023;
end
