<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>  
<head>
    <title>eBookShop Data</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 40px;
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td {
            font-size: 14px;
        }
    </style>
</head>
<body>  

<h2>eBookShop Records</h2>

<table>
    <tr>
        <th>Book ID</th>
        <th>Book Title</th>
        <th>Book Author</th>
        <th>Book Price</th>
        <th>Quantity</th>
    </tr>

<%
try { 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pragati", "root", "root");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM ebookshop");

    while (rs.next()) {    
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
} catch (Exception e) {
    out.println("<tr><td colspan='5'>Error: " + e + "</td></tr>");
}
%>
</table>

</body>  
</html>
