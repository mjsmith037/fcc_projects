#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  read SERVICE_ID_SELECTED
  # check if valid service
  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    REQUESTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
    if [[ -z $REQUESTED_SERVICE ]]
    then
      MAIN_MENU
    else
      GET_DETAILS
    fi
  else
    MAIN_MENU
  fi
}

GET_DETAILS() {
  # get customer, add if not already in table
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # get time for appointment
  echo -e "\nWhat time would you like your $REQUESTED_SERVICE, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # insert appointment
  INSERT_APPT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # send to main menu
  echo -e "\nI have put you down for a $REQUESTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME." 
}





EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU