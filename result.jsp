<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.numbergame.GameSession" %>
<%
GameSession game = (GameSession) session.getAttribute("game");
if (game == null) {
    response.sendRedirect("index.jsp");
    return;
}

// Clear session after showing results
session.removeAttribute("game");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Game Results</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body style="background-image:url(./resultbg.jpg);">
    <div class="game-container" style="background-image:url(./resultbg1.jpg);">
        <h1>Game Results</h1>
        <div class="final-stats">
            <p>Total Rounds Played: <strong><%= game.getRound() %></strong></p>
            <p>Final Score: <strong><%= game.getTotalScore() %></strong></p>
        </div>
        
        <div class="actions" style=" background-color: lightseagreen;">
            <a href="index.jsp">Play Again</a>
        </div>
    </div>
</body>
</html>