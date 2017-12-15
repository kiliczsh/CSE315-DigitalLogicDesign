module 4BitComparator(a,b,aeqb,agtb,altb);
input [3:0] a,b;
output aeqb,agtb,altb;
reg aeqb,agtb,altb;

always @(a or b)
begin
aeqb=0; agtb=0; altb=0;
if(a==b)
aeqb=1;
else if (a>b)

agtb=1;
else
altb=1;
end
end module