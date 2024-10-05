package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dto.OrdersResponse;
import service.OrdersService;
import dao.UserRegistrationDAOClass;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebServlet("/sellerOrders")
@WebServlet("/sellerOrders")
public class SellerOrdersServlet extends HttpServlet {

    private OrdersService orderService;

    @Override
    public void init() {
        this.orderService = new OrdersService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        HttpSession session = req.getSession();
        Integer sellerId = (Integer) session.getAttribute("seller_id");
        
        if (sellerId == null) {
            resp.sendRedirect("login.jsp?error=Session expired or Seller ID not found");
            return;
        }

        try {
            List<OrdersResponse> orders = orderService.getOrdersBySellerId(sellerId);
            req.setAttribute("orders", orders);
            req.getRequestDispatcher("Sellerorders.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unexpected error");
        }
    }
}
