<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Book</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h2>Delete a Book</h2>
<form action="CRUDServlet" method="post">
    <input type="hidden" name="action" value="delete">
    <input type="number" name="id" placeholder="Book ID to Delete" required>
    <input type="submit" value="Delete">
</form>

<a href="index.jsp">← Back to Home</a>

</body>
</html>
