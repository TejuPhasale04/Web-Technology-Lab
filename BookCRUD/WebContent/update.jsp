<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Book</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h2>Update Book Details</h2>
<form action="CRUDServlet" method="post">
    <input type="hidden" name="action" value="update">
    <input type="number" name="id" placeholder="Book ID to Update" required>
    <input type="text" name="title" placeholder="New Title">
    <input type="text" name="author" placeholder="New Author">
    <input type="number" step="0.01" name="price" placeholder="New Price">
    <input type="number" name="quantity" placeholder="New Quantity">
    <input type="submit" value="Update">
</form>

<a href="index.jsp">← Back to Home</a>

</body>
</html>
