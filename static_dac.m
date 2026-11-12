function s = static_dac(v, N, Vref)
% STATIC_DAC  End-point static metrics from the DAC output for ALL codes.  
v = v(:);  
K = numel(v);
LSB = Vref./(power(2,N));
s.LSB_act     = (v(end) - v(1)) / (K-1);
s.offset_lsb  = v(1)/LSB;
s.gain_err_pct = (s.LSB_act/LSB - 1) * 100;
s.DNL         = (v(2:K) - v(1:(K-1))) - s.LSB_act;     % K-1 values
s.INL         = (v - v(1))./(s.LSB_act) - (0:(K-1))';      % K values
s.maxDNL      = max(s.DNL);
s.maxINL      = max(s.INL);
s.monotonic   = all(diff(v) >= 0);
end
