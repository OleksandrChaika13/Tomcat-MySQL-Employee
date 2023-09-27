package org.example.app.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.entity.Employee;
import org.example.app.repository.EmployeeRepository;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class EmployeeController extends HttpServlet {

    private final EmployeeRepository repository = new EmployeeRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new" -> showNewForm(request, response);
                case "/insert" -> insertUser(request, response);
                case "/delete" -> deleteUser(request, response);
                case "/edit" -> showEditForm(request, response);
                case "/update" -> updateUser(request, response);
                default -> listEmployee(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Employee> listEmployee = repository.readEmployees();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/employee_list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/employee_form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee existingEmployee = repository.getEmployeeById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/employee_form.jsp");
        request.setAttribute("employee", existingEmployee);
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String phone = request.getParameter("phone");
        Employee newEmployee = new Employee(name, position, phone);
        repository.createEmployee(newEmployee);
        response.sendRedirect("list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String phone = request.getParameter("phone");
        Employee employee = new Employee(id, name, position, phone);
        repository.updateEmployee(employee);
        response.sendRedirect("list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = new Employee(id);
        repository.deleteEmployee(employee);
        response.sendRedirect("list");
    }
}