package com.numbergame;

import java.io.Serializable;
import java.util.Random;

public class GameSession implements Serializable {
    private int targetNumber;
    private int attemptsLeft;
    private int maxAttempts;
    private int round;
    private int totalScore;
    private String message;
    private boolean gameOver;
    
    public GameSession() {
        this.maxAttempts = 10;
        resetGame();
    }
    
    public void resetGame() {
        Random random = new Random();
        this.targetNumber = random.nextInt(100) + 1;
        this.attemptsLeft = maxAttempts;
        this.round++;
        this.message = "Guess a number between 1 and 100";
        this.gameOver = false;
    }
    
    public void processGuess(int guess) {
        attemptsLeft--;
        
        if (guess == targetNumber) {
            int roundScore = attemptsLeft * 10;
            totalScore += roundScore;
            gameOver = true;
            message = "Correct! " + targetNumber + " was the number. "
                    + "You earned " + roundScore + " points!";
        } else if (attemptsLeft <= 0) {
            gameOver = true;
            message = "Game over! The number was " + targetNumber;
        } else if (guess < targetNumber) {
            message = "Too low! Try a higher number. Attempts left: " + attemptsLeft;
        } else {
            message = "Too high! Try a lower number. Attempts left: " + attemptsLeft;
        }
    }

   
     
    // Getters and Setters
    public int getTargetNumber() { return targetNumber; }
    public int getAttemptsLeft() { return attemptsLeft; }
    public int getMaxAttempts() { return maxAttempts; }
    public int getRound() { return round; }
    public int getTotalScore() { return totalScore; }
    public String getMessage() { return message; }
    public boolean isGameOver() { return gameOver; }
    
    //setter
    public void setMessage(String message) {
    	this.message=message;
    }
}