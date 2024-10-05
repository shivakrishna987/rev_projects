package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dto.CategoryRequest;
import dto.CategoryResponse;
import exceptions.CategoryCreateException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CategoryService;

@WebServlet("/Categories")
public class CategoryController extends HttpServlet {
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
                req.getRequestDispatcher("/Buyercategories.jsp").forward(req, resp);  // Forward to JSP
            } catch (Exception e) {
                e.printStackTrace();
                resp.getWriter().println("Error: " + e.getMessage());
            }
        } else {
            resp.getWriter().println("Invalid action.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int category_id = Integer.parseInt(req.getParameter("category_id"));
        String category_name = req.getParameter("category_name");

        CategoryRequest category = new CategoryRequest(category_id, category_name);
        try {
            boolean response = categoryService.CreateCategory(category);
            if (response)
                resp.getWriter().println("Category with name " + category.getCategoryName() + " was created successfully.");
            else
                resp.getWriter().println("Category with name " + category.getCategoryName() + " was not created. Please check and try again.");
        } catch (SQLException | CategoryCreateException e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
