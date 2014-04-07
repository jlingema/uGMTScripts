-- -------------------------------------------------------------------
-- Design:
--
--    PACKAGE FOR VHDL text output
--
--     Note:
--     ----- 
--     This PACKAGE uses the VHDL 95 standard.
--     IF VHDL 95 is NOT supported by your simulator 
--     you need TO comment OUT the FILE ACCESS functions.
--
--    The PACKAGE provides a means TO output text AND
--    manipulate strings. 
--
--    The basic usage is like this: >> print(s); <<
--    (where s is any string)
--    TO print something which is NOT a string it has TO be converted
--    into a string first. FOR this purpose the PACKAGE contains
--    conversion functions called >> str(...) <<.
--    FOR example a std_logic_vector slv would be printed like this:
--    >> print(str(slv)); <<. TO print several items ON one line the
--    items have TO concatenated as strings WITH the "&" operator eg:
--    >> print("The value OF slv is "& str(slv)); <<
--    The string functions can also be used IN ASSERT statements as shown
--    IN the example below:
--    >> ASSERT DIN = "0101"  <<
--    >>   report "DIN = "& str(DIN)& " expected 0101 "  <<
--    >>   SEVERITY Error;  <<
--
--
--
-- -------------------------------------------------------------------



LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;


PACKAGE package_txt_util IS

    -- prints a message TO the screen
    PROCEDURE print(text: string);

    -- prints the message WHEN active
    -- useful FOR debug switches
    PROCEDURE print(active: boolean; text: string);

    -- converts std_logic into a character
    FUNCTION chr(sl: std_logic) RETURN character;

    -- converts std_logic into a string (1 TO 1)
    FUNCTION str(sl: std_logic) RETURN string;

    -- converts std_logic_vector into a string (binary base)
    FUNCTION str(slv: std_logic_vector) RETURN string;

    -- converts boolean into a string
    FUNCTION str(b: boolean) RETURN string;

    -- converts an integer into a single character
    -- (can also be used FOR hex conversion AND other bases)
    FUNCTION chr(int: integer) RETURN character;

    -- converts integer into string using specified base
    FUNCTION str(int: integer; base: integer) RETURN string;

    -- converts integer TO string, using base 10
    FUNCTION str(int: integer) RETURN string;

    -- convert std_logic_vector into a string IN hex format
    FUNCTION hstr(slv: std_logic_vector) RETURN string;


    -- functions TO manipulate strings
    -----------------------------------

    -- convert a character TO upper CASE
    FUNCTION to_upper(c: character) RETURN character;

    -- convert a character TO lower CASE
    FUNCTION to_lower(c: character) RETURN character;

    -- convert a string TO upper CASE
    FUNCTION to_upper(s: string) RETURN string;

    -- convert a string TO lower CASE
    FUNCTION to_lower(s: string) RETURN string;

   
    
    -- functions TO convert strings into other formats
    --------------------------------------------------
    
    -- converts a character into std_logic
    FUNCTION to_std_logic(c: character) RETURN std_logic; 
    
    -- converts a string into std_logic_vector
    FUNCTION to_std_logic_vector(s: string) RETURN std_logic_vector; 


  
    -- FILE I/O
    -----------
       
    -- read VARIABLE length string from input FILE
    PROCEDURE str_read(FILE in_file: TEXT; 
                       res_string: OUT string);
        
    -- print string TO a FILE AND start NEW line
    PROCEDURE print(FILE out_file: TEXT;
                    new_string: IN  string);
    
    -- print character TO a FILE AND start NEW line
    PROCEDURE print(FILE out_file: TEXT;
                    char:       IN  character);
                    
END package_txt_util;


-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------





PACKAGE BODY package_txt_util IS

   -- prints text TO the screen

   PROCEDURE print(text: string) IS
     VARIABLE msg_line: line;
     BEGIN
       write(msg_line, text);
       writeline(output, msg_line);
   END print;


   -- prints text TO the screen WHEN active

   PROCEDURE print(active: boolean; text: string)  IS
     BEGIN
      IF active THEN
         print(text);
      END IF;
   END print;


   -- converts std_logic into a character

   FUNCTION chr(sl: std_logic) RETURN character IS
    VARIABLE c: character;
    BEGIN
      CASE sl IS
         WHEN 'U' => c:= 'U';
         WHEN 'X' => c:= 'X';
         WHEN '0' => c:= '0';
         WHEN '1' => c:= '1';
         WHEN 'Z' => c:= 'Z';
         WHEN 'W' => c:= 'W';
         WHEN 'L' => c:= 'L';
         WHEN 'H' => c:= 'H';
         WHEN '-' => c:= '-';
      END CASE;
    RETURN c;
   END chr;



   -- converts std_logic into a string (1 TO 1)

   FUNCTION str(sl: std_logic) RETURN string IS
    VARIABLE s: string(1 TO 1);
    BEGIN
        s(1) := chr(sl);
        RETURN s;
   END str;



   -- converts std_logic_vector into a string (binary base)
   -- (this also takes care OF the fact that the RANGE OF
   --  a string is natural WHILE a std_logic_vector may
   --  have an integer RANGE)

   FUNCTION str(slv: std_logic_vector) RETURN string IS
     VARIABLE result : string (1 TO slv'length);
     VARIABLE r : integer;
   BEGIN
     r := 1;
     FOR i IN slv'range LOOP
        result(r) := chr(slv(i));
        r := r + 1;
     END LOOP;
     RETURN result;
   END str;


   FUNCTION str(b: boolean) RETURN string IS

    BEGIN
       IF b THEN
          RETURN "true";
      ELSE
        RETURN "false";
       END IF;
    END str;


   -- converts an integer into a character
   -- FOR 0 TO 9 the obvious mapping is used, higher
   -- values are mapped TO the characters A-Z
   -- (this is usefull FOR systems WITH base > 10)
   -- (adapted from Steve Vogwell's posting IN comp.lang.vhdl)

   FUNCTION chr(int: integer) RETURN character IS
    VARIABLE c: character;
   BEGIN
        CASE int IS
          WHEN  0 => c := '0';
          WHEN  1 => c := '1';
          WHEN  2 => c := '2';
          WHEN  3 => c := '3';
          WHEN  4 => c := '4';
          WHEN  5 => c := '5';
          WHEN  6 => c := '6';
          WHEN  7 => c := '7';
          WHEN  8 => c := '8';
          WHEN  9 => c := '9';
          WHEN 10 => c := 'A';
          WHEN 11 => c := 'B';
          WHEN 12 => c := 'C';
          WHEN 13 => c := 'D';
          WHEN 14 => c := 'E';
          WHEN 15 => c := 'F';
          WHEN 16 => c := 'G';
          WHEN 17 => c := 'H';
          WHEN 18 => c := 'I';
          WHEN 19 => c := 'J';
          WHEN 20 => c := 'K';
          WHEN 21 => c := 'L';
          WHEN 22 => c := 'M';
          WHEN 23 => c := 'N';
          WHEN 24 => c := 'O';
          WHEN 25 => c := 'P';
          WHEN 26 => c := 'Q';
          WHEN 27 => c := 'R';
          WHEN 28 => c := 'S';
          WHEN 29 => c := 'T';
          WHEN 30 => c := 'U';
          WHEN 31 => c := 'V';
          WHEN 32 => c := 'W';
          WHEN 33 => c := 'X';
          WHEN 34 => c := 'Y';
          WHEN 35 => c := 'Z';
          WHEN OTHERS => c := '?';
        END CASE;
        RETURN c;
    END chr;



   -- convert integer TO string using specified base
   -- (adapted from Steve Vogwell's posting IN comp.lang.vhdl)

   FUNCTION str(int: integer; base: integer) RETURN string IS

    VARIABLE temp:      string(1 TO 10);
    VARIABLE num:       integer;
    VARIABLE abs_int:   integer;
    VARIABLE len:       integer := 1;
    VARIABLE power:     integer := 1;

   BEGIN

    -- bug fix FOR negative numbers
    abs_int := ABS(int);

    num     := abs_int;

    WHILE num >= base LOOP                     -- Determine how many
      len := len + 1;                          -- characters required
      num := num / base;                       -- TO represent the
    END LOOP ;                                 -- number.

    FOR i IN len DOWNTO 1 LOOP                 -- Convert the number TO
      temp(i) := chr(abs_int/power MOD base);  -- a string starting
      power := power * base;                   -- WITH the right hand
    END LOOP ;                                 -- side.

    -- RETURN result AND add sign IF required
    IF int < 0 THEN
       RETURN '-'& temp(1 TO len);
     ELSE
       RETURN temp(1 TO len);
    END IF;

   END str;


  -- convert integer TO string, using base 10
  FUNCTION str(int: integer) RETURN string IS

   BEGIN

    RETURN str(int, 10) ;

   END str;



   -- converts a std_logic_vector into a hex string.
   FUNCTION hstr(slv: std_logic_vector) RETURN string IS
       VARIABLE hexlen: integer;
       VARIABLE longslv : std_logic_vector(67 DOWNTO 0) := (OTHERS => '0');
       VARIABLE hex : string(1 TO 16);
       VARIABLE fourbit : std_logic_vector(3 DOWNTO 0);
     BEGIN
       hexlen := (slv'left+1)/4;
       IF (slv'left+1) MOD 4 /= 0 THEN
         hexlen := hexlen + 1;
       END IF;
       longslv(slv'left DOWNTO 0) := slv;
       FOR i IN (hexlen -1) DOWNTO 0 LOOP
         fourbit := longslv(((i*4)+3) DOWNTO (i*4));
         CASE fourbit IS
           WHEN "0000" => hex(hexlen -I) := '0';
           WHEN "0001" => hex(hexlen -I) := '1';
           WHEN "0010" => hex(hexlen -I) := '2';
           WHEN "0011" => hex(hexlen -I) := '3';
           WHEN "0100" => hex(hexlen -I) := '4';
           WHEN "0101" => hex(hexlen -I) := '5';
           WHEN "0110" => hex(hexlen -I) := '6';
           WHEN "0111" => hex(hexlen -I) := '7';
           WHEN "1000" => hex(hexlen -I) := '8';
           WHEN "1001" => hex(hexlen -I) := '9';
           WHEN "1010" => hex(hexlen -I) := 'A';
           WHEN "1011" => hex(hexlen -I) := 'B';
           WHEN "1100" => hex(hexlen -I) := 'C';
           WHEN "1101" => hex(hexlen -I) := 'D';
           WHEN "1110" => hex(hexlen -I) := 'E';
           WHEN "1111" => hex(hexlen -I) := 'F';
           WHEN "ZZZZ" => hex(hexlen -I) := 'z';
           WHEN "UUUU" => hex(hexlen -I) := 'u';
           WHEN "XXXX" => hex(hexlen -I) := 'x';
           WHEN OTHERS => hex(hexlen -I) := '?';
         END CASE;
       END LOOP;
       RETURN hex(1 TO hexlen);
     END hstr;



   -- functions TO manipulate strings
   -----------------------------------


   -- convert a character TO upper CASE

   FUNCTION to_upper(c: character) RETURN character IS

      VARIABLE u: character;

    BEGIN

       CASE c IS
        WHEN 'a' => u := 'A';
        WHEN 'b' => u := 'B';
        WHEN 'c' => u := 'C';
        WHEN 'd' => u := 'D';
        WHEN 'e' => u := 'E';
        WHEN 'f' => u := 'F';
        WHEN 'g' => u := 'G';
        WHEN 'h' => u := 'H';
        WHEN 'i' => u := 'I';
        WHEN 'j' => u := 'J';
        WHEN 'k' => u := 'K';
        WHEN 'l' => u := 'L';
        WHEN 'm' => u := 'M';
        WHEN 'n' => u := 'N';
        WHEN 'o' => u := 'O';
        WHEN 'p' => u := 'P';
        WHEN 'q' => u := 'Q';
        WHEN 'r' => u := 'R';
        WHEN 's' => u := 'S';
        WHEN 't' => u := 'T';
        WHEN 'u' => u := 'U';
        WHEN 'v' => u := 'V';
        WHEN 'w' => u := 'W';
        WHEN 'x' => u := 'X';
        WHEN 'y' => u := 'Y';
        WHEN 'z' => u := 'Z';
        WHEN OTHERS => u := c;
    END CASE;

      RETURN u;

   END to_upper;


   -- convert a character TO lower CASE

   FUNCTION to_lower(c: character) RETURN character IS

      VARIABLE l: character;

    BEGIN

       CASE c IS
        WHEN 'A' => l := 'a';
        WHEN 'B' => l := 'b';
        WHEN 'C' => l := 'c';
        WHEN 'D' => l := 'd';
        WHEN 'E' => l := 'e';
        WHEN 'F' => l := 'f';
        WHEN 'G' => l := 'g';
        WHEN 'H' => l := 'h';
        WHEN 'I' => l := 'i';
        WHEN 'J' => l := 'j';
        WHEN 'K' => l := 'k';
        WHEN 'L' => l := 'l';
        WHEN 'M' => l := 'm';
        WHEN 'N' => l := 'n';
        WHEN 'O' => l := 'o';
        WHEN 'P' => l := 'p';
        WHEN 'Q' => l := 'q';
        WHEN 'R' => l := 'r';
        WHEN 'S' => l := 's';
        WHEN 'T' => l := 't';
        WHEN 'U' => l := 'u';
        WHEN 'V' => l := 'v';
        WHEN 'W' => l := 'w';
        WHEN 'X' => l := 'x';
        WHEN 'Y' => l := 'y';
        WHEN 'Z' => l := 'z';
        WHEN OTHERS => l := c;
    END CASE;

      RETURN l;

   END to_lower;



   -- convert a string TO upper CASE

   FUNCTION to_upper(s: string) RETURN string IS

     VARIABLE uppercase: string (s'range);

   BEGIN

     FOR i IN s'range LOOP
        uppercase(i):= to_upper(s(i));
     END LOOP;
     RETURN uppercase;

   END to_upper;



   -- convert a string TO lower CASE

   FUNCTION to_lower(s: string) RETURN string IS

     VARIABLE lowercase: string (s'range);

   BEGIN

     FOR i IN s'range LOOP
        lowercase(i):= to_lower(s(i));
     END LOOP;
     RETURN lowercase;

   END to_lower;



-- functions TO convert strings into other types


-- converts a character into a std_logic

FUNCTION to_std_logic(c: character) RETURN std_logic IS 
    VARIABLE sl: std_logic;
    BEGIN
      CASE c IS
        WHEN 'U' => 
           sl := 'U'; 
        WHEN 'X' =>
           sl := 'X';
        WHEN '0' => 
           sl := '0';
        WHEN '1' => 
           sl := '1';
        WHEN 'Z' => 
           sl := 'Z';
        WHEN 'W' => 
           sl := 'W';
        WHEN 'L' => 
           sl := 'L';
        WHEN 'H' => 
           sl := 'H';
        WHEN '-' => 
           sl := '-';
        WHEN OTHERS =>
           sl := 'X'; 
    END CASE;
   RETURN sl;
  END to_std_logic;


-- converts a string into std_logic_vector

FUNCTION to_std_logic_vector(s: string) RETURN std_logic_vector IS 
  VARIABLE slv: std_logic_vector(s'high-s'low DOWNTO 0);
  VARIABLE k: integer;
begin
   k := s'high-s'low;
  FOR i IN s'range LOOP
     slv(k) := to_std_logic(s(i));
     k      := k - 1;
  END LOOP;
  RETURN slv;
END to_std_logic_vector;                                       
                                       
                                       
                                       
                                       
                                       
                                       
----------------
--  FILE I/O  --
----------------



-- read VARIABLE length string from input FILE
     
PROCEDURE str_read(FILE in_file: TEXT; 
                   res_string: OUT string) IS
       
       VARIABLE l:         line;
       VARIABLE c:         character;
       VARIABLE is_string: boolean;
       
   BEGIN
           
     readline(in_file, l);
     -- clear the contents OF the result string
     FOR i IN res_string'range LOOP
         res_string(i) := ' ';
     END LOOP;   
     -- read ALL characters OF the line, up TO the length  
     -- OF the results string
     FOR i IN res_string'range LOOP
        read(l, c, is_string);
        res_string(i) := c;
        IF NOT is_string THEN -- found END OF line
           EXIT;
        END IF;   
     END LOOP; 
                     
END str_read;


-- print string TO a FILE
PROCEDURE print(FILE out_file: TEXT;
                new_string: IN  string) IS
       
       VARIABLE l: line;
       
   BEGIN
      
     write(l, new_string);
     writeline(out_file, l);
                     
END print;


-- print character TO a FILE AND start NEW line
PROCEDURE print(FILE out_file: TEXT;
                char: IN  character) IS
       
       VARIABLE l: line;
       
   BEGIN
      
     write(l, char);
     writeline(out_file, l);
                     
END print;



-- appends contents OF a string TO a FILE UNTIL line feed occurs
-- (LF is considered TO be the END OF the string)

PROCEDURE str_write(FILE out_file: TEXT; 
                    new_string: IN  string) IS
 BEGIN
      
   FOR i IN new_string'range LOOP
      print(out_file, new_string(i));
      IF new_string(i) = LF THEN -- END OF string
         EXIT;
      END IF;
   END LOOP;               
                     
END str_write;




END package_txt_util;





