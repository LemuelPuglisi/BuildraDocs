USER=charlemagne
PASS=secret

# DDL import
mysql -u $USER -p$PASS buildra < ./schema/buildra-schema.sql
echo "[\e[32mOK\e[0m] schema imported"

mysql -u $USER -p$PASS buildra < ./schema/buildra-triggers.sql
echo "[\e[32mOK\e[0m] triggers imported"

mysql -u $USER -p$PASS buildra < ./schema/buildra-procedures.sql
echo "[\e[32mOK\e[0m] procedures imported"

# Dump import 
mysql -u $USER -p$PASS buildra < ./schema/buildra-data.sql
echo "[\e[32mOK\e[0m] dump imported"
