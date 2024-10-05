package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.UserRegistrationDAOClass;
import dto.UserRegistrationResponse;
import dto.Role;

@WebServlet("/Profile")
public class ProfileServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userEmail = req.getParameter("user_email");
        
        if (userEmail == null || userEmail.isEmpty()) {
            resp.sendRedirect("login.jsp?error=User email is missing");
            return;
        }

        try {
            UserRegistrationDAOClass userDAO = new UserRegistrationDAOClass();
            UserRegistrationResponse user = userDAO.getUserByEmail(userEmail);
            
            if (user != null) {
                Role role = user.getRole();
                if ("SELLER".equals(role.name())) {
                    req.setAttribute("user", user);
                    req.getRequestDispatcher("Sellerprofile.jsp").forward(req, resp);
                } else {
                    req.setAttribute("user", user);
                    req.getRequestDispatcher("Buyerprofile.jsp").forward(req, resp);
                }
            } else {
                resp.sendRedirect("login.jsp?error=User not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=Unable to retrieve user details");
        }
    }
}
