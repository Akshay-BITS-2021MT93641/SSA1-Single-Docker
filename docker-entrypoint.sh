#! /bin/bash

java -jar -Dspring.profiles.active=$SPRING_PROFILE furniture-catalog-service.jar &
java -jar -Dspring.profiles.active=$SPRING_PROFILE furniture-inventory-service.jar &
java -jar -Dspring.profiles.active=$SPRING_PROFILE furniture-order-service.jar &

wait -n

exit $?