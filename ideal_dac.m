function v = ideal_dac(code, N, Vref)
% IDEAL_DAC  Ideal binary-weighted DAC.
%   code : integer vector, 0 ... 2^N-1
%   v    : analog output in volts
LSB = 1/(power(2, N));
code = code(:);

% Method A: direct formula
vA = (code.*LSB)*Vref;

% Method B: sum of binary-weighted bit contributions
w    = (Vref)./power(2, 1:1:N); % MSB weight = Vref/2, ..., LSB weight = Vref/2^N
bits = w.*de2bi(code, N, 'left-msb');
vB = sum(bits, 2);

assert(max(abs(vA - vB)) < 1e-12, 'Methods disagree!');
v = vA;
end
