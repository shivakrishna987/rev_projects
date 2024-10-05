package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import service.ProductService;
import dto.ProductResponse;

@WebServlet("/SellerProducts")  // Maps to /SellerProducts
public class SellerProductController extends HttpServlet {

    private ProductService productService;

    public void init() {
        System.out.println("init");
        this.productService = new ProductService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        System.out.println("get method invoked");

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        // Retrieve sellerId from the session
        HttpSession session = req.getSession();
        Integer sellerId = (Integer) session.getAttribute("seller_id");

        if (sellerId == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Seller ID is required.");
            return;
        }

        // Fetch products by sellerId
        try {
            List<ProductResponse> products = productService.getProductsBySeller(sellerId);

            if (products == null || products.isEmpty()) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No products found for the seller.");
                return;
            }

            req.setAttribute("products", products);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/Sellerproducts.jsp");
            dispatcher.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching products.");
        }
    }
}
