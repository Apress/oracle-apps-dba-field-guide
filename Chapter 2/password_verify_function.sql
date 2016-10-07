CREATE OR REPLACE FUNCTION "SYS"."PASSWORD_VERIFY_FUNCTION" (
username varchar2,
password varchar2,
old_password varchar2)
RETURN boolean IS
n boolean;
m integer;
isspecial boolean;
specialarray varchar2(25);

BEGIN
specialarray:='#_';

-- Check for required special character
isspecial:=FALSE;
FOR i IN 1..length(specialarray) LOOP
FOR j IN 1..m LOOP
IF substr(password,j,1) = substr(specialarray,i,1) THEN
isspecial:=TRUE;
END IF;
END LOOP;
END LOOP;
IF isspecial = FALSE THEN
raise_application_error(-20001, 'The password should contain one of the following special characters # or _ ');
END IF;

-- Everything is fine, return TRUE ;
RETURN(TRUE);
END;
