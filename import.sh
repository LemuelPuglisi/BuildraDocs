mysql -u charlemagne -psecret buildra < ./schema/buildra-schema.sql

# university dump
# mysql -u charlemagne -psecret buildra < ./schema/000-buildra-dump.sql 

# working dump
mysql -u charlemagne -psecret buildra < ./schema/001-buildra-dump.sql

# redump

# mysql -u charlemagne -psecret buildra < ./schema/buildra-data.sql

# cd parsing/

# php parser.php