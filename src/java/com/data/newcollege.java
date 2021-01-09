

package com.data;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class newcollege extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            String cname=request.getParameter("cname");
            String email=request.getParameter("email");
            String webapp=request.getParameter("webadd");
            String pcperson=request.getParameter("pcperson");
            String pcpersondesignation=request.getParameter("pcpersondesignation");
            String pcpersonno=request.getParameter("pcpersonno");
            String scperson=request.getParameter("scperson");
            String scpersondesignation=request.getParameter("scpersondesignation");
            String scpersonno=request.getParameter("scpersonno");
            String address=request.getParameter("address");
            String state=request.getParameter("state");
            String sql="insert into collegedetails(cname,email,webadd,primary_cperson,primary_cperson_designation,primary_cperson_ph,secondary_cperson,secondary_cperson_designation,secondary_cperson_ph,address,state) values(?,?,?,?,?,?,?,?,?,?,?)";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/collegeinfo", "root", "");
            PreparedStatement ps=conn.clientPrepareStatement(sql);
            ps.setString(1, cname);
            ps.setString(2, email);
            ps.setString(3, webapp);
            ps.setString(4, pcperson);
            ps.setString(5, pcpersondesignation);
            ps.setString(6, pcpersonno);
            ps.setString(7, scperson);
            ps.setString(8, scpersondesignation);
            ps.setString(9, scpersonno);
            ps.setString(10, address);
            ps.setString(11, state);
            ps.executeUpdate();
           System.out.println("Registration Sussesfull");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(newcollege.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(newcollege.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
