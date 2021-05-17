echo "=== Starting MariaDB Service ==="

PASS=$(sh ./decode.sh U2FsdGVkX1+7QmvSs5V1duRBr/qJCBOlBpJIoP/QFZM=)


echo "CREATE USER 'user'@'%' IDENTIFIED BY '$PASS';"