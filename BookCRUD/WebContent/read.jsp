<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Books</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h2>eBookShop Records</h2>
<table>
    <tr>
        <th>ID</th><th>Title</th><th>Author</th><th>Price</th><th>Quantity</th>
    </tr>

<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pragati", "root", "root");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM ebookshop");

    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getDouble(4) %></td>
        <td><%= rs.getInt(5) %></td>
    </tr>
<%
    }
    con.close();
} catch(Exception e) {
    out.println("<tr><td colspan='5'>Error: " + e + "</td></tr>");
}
%>
</table>

<a href="index.jsp">← Back to Home</a>

</body>
</html>
