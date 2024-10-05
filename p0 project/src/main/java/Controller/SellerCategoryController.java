package Controller;

import java.io.IOException;
import java.util.List;

import dto.CategoryResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CategoryService;

@WebServlet("/SellerCategories")
public class SellerCategoryController extends HttpServlet {	
	
    private CategoryService categoryService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.categoryService = new CategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String action = req.getParameter("action");

        if ("Categories".equals(action)) {
            try {
                List<CategoryResponse> categories = categoryService.getAllCategories();
                req.setAttribute("categories", categories);  // Set categories in request
                req.getRequestDispatcher("/Sellercategories.jsp").forward(req, resp);  // Forward to JSP
            } catch (Exception e) {
                e.printStackTrace();
                resp.getWriter().println("Error: " + e.getMessage());
            }
        } else {
            resp.getWriter().println("Invalid action.");
        }
    }
}
