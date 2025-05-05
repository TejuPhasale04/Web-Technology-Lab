<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Book</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h2>Add New Book</h2>
<form action="CRUDServlet" method="post">
    <input type="hidden" name="action" value="create">
    <input type="number" name="id" placeholder="Book ID" required>
    <input type="text" name="title" placeholder="Book Title" required>
    <input type="text" name="author" placeholder="Author" required>
    <input type="number" step="0.01" name="price" placeholder="Price" required>
    <input type="number" name="quantity" placeholder="Quantity" required>
    <input type="submit" value="Create">
</form>

<a href="index.jsp">← Back to Home</a>

</body>
</html>
