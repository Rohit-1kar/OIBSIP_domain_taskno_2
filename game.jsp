<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.numbergame.GameSession" %>
<%
// Get or create game session
GameSession game = (GameSession) session.getAttribute("game");
if (game == null || "true".equals(request.getParameter("reset"))) {
    game = new GameSession();
    session.setAttribute("game", game);
}

// Process guess if submitted
if (request.getParameter("guess") != null) {
    try {
        int guess = Integer.parseInt(request.getParameter("guess"));
        game.processGuess(guess);
    } catch (NumberFormatException e) {
        // Use the setter method
        game.setMessage("Please enter a valid number!");
    }
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Round <%= game.getRound() %> - Number Guessing Game</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body style="background-image:url(./gamebg.jpg);">
    <div class="game-container" style="background-image:url(./gamebg1.jpg);">
        <h1>Round <%= game.getRound() %></h1>
        <div class="game-stats">
            <p>Attempts Left: <%= game.getAttemptsLeft() %>/<%= game.getMaxAttempts() %></p>
            <p>Total Score: <%= game.getTotalScore() %></p>
        </div>
        
        <div class="message <%= game.isGameOver() ? "game-over" : "" %>">
            <%= game.getMessage() %>
        </div>
        
        <% if (!game.isGameOver()) { %>
            <form action="game.jsp" method="post">
                <input type="number" name="guess" min="1" max="100" 
                       required autofocus placeholder="Enter your guess (1-100)">
                <input type="submit" value="Submit Guess">
            </form>
        <% } else { %>
            <div class="actions">
                <form action="game.jsp" method="post">
                    <input type="hidden" name="reset" value="true">
                    <input type="submit" value="Play Next Round">
                </form>
                <a href="result.jsp">View Final Results</a>
            </div>
        <% } %>
    </div>
</body>
</html>