import jakarta.servlet.http.*;  
import jakarta.servlet.*;  
import java.io.*; 
import java.sql.*; 

public class DemoServlet extends HttpServlet {  
    public void doGet(HttpServletRequest req, HttpServletResponse res)  
    throws ServletException, IOException {  
        res.setContentType("text/html"); // setting the content type  
        PrintWriter pw = res.getWriter(); // get the stream to write the data  
        pw.println("<html><body>");
        pw.println("Welcome to Pragati eBookShop");  
        pw.println("<table border='5'>");  
        pw.println("<tr><th>Book id</th><th>Book Title</th><th>Book Author</th><th>Book Price</th><th>Quantity</th></tr>");
        
        try { 
            // Load the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");
            // Establish the connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pragati", "root", "root");
            
            // Prepare statement for inserting data into the database
            String insertSQL = "INSERT INTO ebookshop (Book_Id, Book_Name, Book_author, Book_price, Quantity) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(insertSQL);

            // Set values for the PreparedStatement
            ps.setInt(1, 103); // Book ID
            ps.setString(2, "ML"); // Book Title
            ps.setString(3, "Thomas"); // Book Author
            ps.setDouble(4, 700.0); // Book Price
            ps.setInt(5, 15); // Quantity

            // Execute update and check if the record is inserted
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                pw.println("Record inserted successfully");
            } else {
                pw.println("Record not inserted");
            }

            // Now, retrieve and display all records from the ebookshop table
            String selectSQL = "SELECT * FROM ebookshop";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(selectSQL);

            while (rs.next()) {    
                pw.println("<tr><td>" + rs.getObject(1).toString() + "</td><td>" + rs.getString(2) + "</td><td>" 
                            + rs.getString(3) + "</td><td>" + rs.getDouble(4) + "</td><td>" + rs.getInt(5) + "</td></tr>");
            }
            
        } catch (Exception e) {
            pw.print(e);
        }
        
        pw.println("</table>");
        pw.println("</body></html>");    
        pw.close(); // closing the stream  
    }
}
