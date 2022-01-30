**free

dcl-f test20 workstn
    extdesc('CLV1/TEST20')
    extfile(*extdesc)
    indds(wsind);

dcl-c OK 'S';
dcl-s exit00 char(1);
dcl-ds wsind qualified;
    f3 ind pos(3);
end-ds;

// Main 
wsmessage = 'Hello world, from IBM i';

dou (exit00 = OK);

    exfmt DATA00;

    select;
        when (wsind.f3);
            exit00 = OK;
    endsl;
enddo;

*inlr = '1';
return;
