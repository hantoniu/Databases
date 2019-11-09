--Left Join: Pacients to the IDs of the hospitals they are hospitalized in

Select P.pid, P.fname, P.fname, P.cnp, H.hospital
From Pacients P Right Outer Join HospitalizedAt H On P.pid = H.pacient