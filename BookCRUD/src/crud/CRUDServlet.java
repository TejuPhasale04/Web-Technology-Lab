package crud;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class CRUDServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String url = "jdbc:mysql://localhost:3306/pragati";
        String user = "root";
        String password = "root";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            switch (action) {
                case "create":
                    PreparedStatement insert = con.prepareStatement("INSERT INTO ebookshop VALUES (?, ?, ?, ?, ?)");
                    insert.setInt(1, Integer.parseInt(req.getParameter("id")));
                    insert.setString(2, req.getParameter("title"));
                    insert.setString(3, req.getParameter("author"));
                    insert.setDouble(4, Double.parseDouble(req.getParameter("price")));
                    insert.setInt(5, Integer.parseInt(req.getParameter("quantity")));
                    insert.executeUpdate();
                    out.println("<h3>Record Inserted Successfully</h3>");
                    break;

                case "update":
                    PreparedStatement update = con.prepareStatement("UPDATE ebookshop SET Book_Name=?, Book_Author=?, Book_Price=?, Quantity=? WHERE Book_Id=?");
                    update.setString(1, req.getParameter("title"));
                    update.setString(2, req.getParameter("author"));
                    update.setDouble(3, Double.parseDouble(req.getParameter("price")));
                    update.setInt(4, Integer.parseInt(req.getParameter("quantity")));
                    update.setInt(5, Integer.parseInt(req.getParameter("id")));
                    update.executeUpdate();
                    out.println("<h3>Record Updated Successfully</h3>");
                    break;

                case "delete":
                    PreparedStatement delete = con.prepareStatement("DELETE FROM ebookshop WHERE Book_Id=?");
                    delete.setInt(1, Integer.parseInt(req.getParameter("id")));
                    delete.executeUpdate();
                    out.println("<h3>Record Deleted Successfully</h3>");
                    break;
            }

            out.println("<a href='index.jsp'>← Back to Home</a>");
            con.close();

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
