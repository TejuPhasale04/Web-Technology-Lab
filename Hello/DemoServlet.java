import jakarta.servlet.http.*;  
import jakarta.servlet.*;  
import java.io.*; 

public class DemoServlet extends HttpServlet {  
    public void doGet(HttpServletRequest req, HttpServletResponse res)  
    throws ServletException, IOException {  
        res.setContentType("text/html"); 
        PrintWriter pw = res.getWriter(); 
        pw.println("<html><body>");
        pw.println("Hello World");  
        pw.println("</body></html>");    
    }
}
