DO
 $code$
 DECLARE
   file_name text;
   file_size numeric;
   query_string text;
   file_type text;
 BEGIN
   file_type := 'txt';

   -- build the query to execute
   query_string := 'SELECT f_name, f_size FROM files WHERE f_type = $1 LIMIT 1';

   -- execute the query
   -- and get back the results
   EXECUTE query_string
   INTO STRICT file_name, file_size
   USING file_type;

   RAISE INFO 'File of type % has name % and size % bytes',
                                                  file_type,
                                                  file_name,
                                                  file_size;
 END
 $code$;
