-- if vim.cmd 'echo system(\'setxkbmap -query | awk \'\'/layout/ {print $2}\'\'\')' == 'dvorak' then
--   print 'is dvorak'
--   vim.cmd "set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?"
-- else
--   print 'not dvorak'
-- end

-- function trim(s)
--   return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
-- end

-- if trim(vim.cmd [[silent! exec 'setxkbmap -query | awk \'\'/layout/ {print $2}\'\'']]) == 'us' then
--   print 'dvorak!'
-- else
--   print 'not dvorak'
-- end


