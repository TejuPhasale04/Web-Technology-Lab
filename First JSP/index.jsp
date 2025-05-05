<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>  
<head>
    <title>eBookShop Data</title>
    <style>
        /* CSS remains unchanged */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 40px;
        }
        h1, h2 { text-align: center; color: #333; }
        table {
            margin: auto; border-collapse: collapse; width: 90%;
            background-color: #ffffff; box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        th, td { border: 1px solid #ddd; padding: 12px 15px; text-align: center; }
        th { background-color: #4CAF50; color: white; font-size: 16px; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        tr:hover { background-color: #f1f1f1; }
        td { font-size: 14px; }
        .delete-button {
            background-color: #ff4d4d; color: white; padding: 6px 12px;
            border: none; border-radius: 4px; cursor: pointer;
        }
        .delete-button:hover { background-color: #cc0000; }
        .insert-form {
            margin: auto; width: 50%; padding: 20px; background-color: #ffffff;
            margin-top: 30px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); border-radius: 8px;
        }
        .insert-form input[type="text"],
        .insert-form input[type="number"],
        .insert-form input[type="submit"] {
            width: 90%; padding: 10px; margin: 10px 0;
            display: block; margin-left: auto; margin-right: auto;
        }
        .insert-form input[type="submit"] {
            background-color: #4CAF50; color: white; border: none;
            cursor: pointer; border-radius: 5px;
        }
        .insert-form input[type="submit"]:hover { background-color: #45a049; }
    </style>
</head>
<body>  

<h2>eBookShop Records</h2>

<%
    // Database connection variables
    String dbURL = "jdbc:mysql://localhost:3306/pragati";
    String dbUser = "root";
    String dbPass = "root";

    // Load MySQL driver
    Class.forName("com.mysql.jdbc.Driver");

    // Handle deletion
    String deleteId = request.getParameter("deleteId");
    if (deleteId != null) {
        try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
             PreparedStatement ps = con.prepareStatement("DELETE FROM ebookshop WHERE book_id = ?")) {

            ps.setInt(1, Integer.parseInt(deleteId));
            ps.executeUpdate();
%>
            <p style="text-align:center; color: green;">Record deleted successfully!</p>
<%
        } catch (Exception e) {
            out.println("<p style='color:red;text-align:center;'>Error deleting record: " + e.getMessage() + "</p>");
        }
    }

    // Handle insertion
    String insertBookId = request.getParameter("insertBookId");
    String insertTitle = request.getParameter("insertTitle");
    String insertAuthor = request.getParameter("insertAuthor");
    String insertPrice = request.getParameter("insertPrice");
    String insertQty = request.getParameter("insertQty");

    if (insertBookId != null && insertTitle != null && insertAuthor != null && insertPrice != null && insertQty != null) {
        try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
             PreparedStatement ps = con.prepareStatement(
                "INSERT INTO ebookshop (book_id, book_Name, book_author, book_price, Quantity) VALUES (?, ?, ?, ?, ?)")) {

            ps.setInt(1, Integer.parseInt(insertBookId));
            ps.setString(2, insertTitle);
            ps.setString(3, insertAuthor);
            ps.setDouble(4, Double.parseDouble(insertPrice));
            ps.setInt(5, Integer.parseInt(insertQty));
            ps.executeUpdate();
%>
            <p style="text-align:center; color: green;">Record inserted successfully!</p>
<%
        } catch (Exception e) {
            out.println("<p style='color:red;text-align:center;'>Error inserting record: " + e.getMessage() + "</p>");
        }
    }
%>

<table>
    <tr>
        <th>Book ID</th>
        <th>Book Title</th>
        <th>Book Author</th>
        <th>Book Price</th>
        <th>Quantity</th>
        <th>Action</th>
    </tr>

<%
try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery("SELECT * FROM ebookshop")) {

    while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("book_Name") %></td> <!-- Corrected column name -->
            <td><%= rs.getString("book_author") %></td>
            <td><%= rs.getDouble("book_price") %></td>
            <td><%= rs.getInt("Quantity") %></td> <!-- Corrected column name -->
            <td>
                <form method="post" action="">
                    <input type="hidden" name="deleteId" value="<%= rs.getInt("book_id") %>">
                    <input type="submit" class="delete-button" value="Delete"
                           onclick="return confirm('Are you sure you want to delete this record?');">
                </form>
            </td>
        </tr>
<%
    }
} catch (Exception e) {
    out.println("<tr><td colspan='6' style='color:red;'>Error loading records: " + e.getMessage() + "</td></tr>");
}
%>
</table>

<!-- Insert Form -->
<div class="insert-form">
    <h2 style="text-align:center;">Insert New Book</h2>
    <form method="post" action="">
        <input type="number" name="insertBookId" placeholder="Enter Book ID" required>
        <input type="text" name="insertTitle" placeholder="Enter Book Title" required>
        <input type="text" name="insertAuthor" placeholder="Enter Author Name" required>
        <input type="number" step="0.01" name="insertPrice" placeholder="Enter Book Price" required>
        <input type="number" name="insertQty" placeholder="Enter Quantity" required>
        <input type="submit" value="Insert Book">
    </form>
</div>

</body>  
</html>
