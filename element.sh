#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

SUCCESS() {
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $1")
  SYM=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $1")
  TYPE=$($PSQL "SELECT type FROM properties LEFT JOIN types USING (type_id)
                  WHERE atomic_number = $1")
  MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $1")
  MELT=$($PSQL "SELECT melting_point_celsius FROM properties
                  WHERE atomic_number = $1")
  BOIL=$($PSQL "SELECT boiling_point_celsius FROM properties
                  WHERE atomic_number = $1")
  echo "The element with atomic number $1 is $NAME ($SYM). It's a $TYPE, \
with a mass of $MASS amu. $NAME has a melting point of $MELT celsius \
and a boiling point of $BOIL celsius."
}
FAILURE() {
  echo "I could not find that element in the database."
}

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
elif [[ $1 =~ ^[0-9]+$ ]]
then
  # we have been given an atomic number, check if it is in the database
  NUM=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
  if [[ -z $NUM ]]
  then
    FAILURE
  else
    SUCCESS $NUM
  fi
elif [[ ${#1} -le 2 ]]
then
  # we have been given a symbol, check if it is in the database
  NUM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
  if [[ -z $NUM ]]
  then
    FAILURE
  else
    SUCCESS $NUM
  fi
else
  # we have been given a name, check if it is in the database
  NUM=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
  if [[ -z $NUM ]]
  then
    FAILURE
  else
    SUCCESS $NUM
  fi
fi