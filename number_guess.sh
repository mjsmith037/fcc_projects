#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER

USER_ID=$($PSQL "SELECT user_id from users WHERE name = '$USER'")
if [[ -z $USER_ID ]]
then
  # if not a return user, add to the database and welcome
  ADD_USER_RESULT=$($PSQL "INSERT INTO users (name) VALUES ('$USER')")
  USER_ID=$($PSQL "SELECT user_id from users WHERE name = '$USER'")
  echo "Welcome, $USER! It looks like this is your first time here."
else
  # otherwise, remind them of their past activity
  GAMES=$($PSQL "SELECT COUNT(*) FROM matches WHERE user_id = $USER_ID")
  RECORD=$($PSQL "SELECT MIN(guesses) FROM matches WHERE user_id = $USER_ID")
  echo "Welcome back, $USER! You have played $GAMES games, and your best game took $RECORD guesses."
fi

SECRET=$(( RANDOM % 1000 + 1))

echo "Guess the secret number between 1 and 1000:"
GUESS=0
while [[ $GUESS -ne $SECRET ]]
do
  read GUESS
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    NUM_GUESSES=$(( NUM_GUESSES + 1 ))
    if [[ GUESS -lt SECRET ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ GUESS -gt SECRET ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET. Nice job!"
      # and add this result to the matches table
      ADD_MATCH_RESULT=$($PSQL "INSERT INTO matches (user_id, guesses) VALUES ($USER_ID, $NUM_GUESSES)")
    fi
  fi
done
