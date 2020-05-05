/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FileUpload;

import EncryptionDecryption.TrippleDes;
import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author vivek
 */
public class Upload extends HttpServlet {

    public java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        @Override

        
        
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //db con init
        
        String key = uniq()+"";
        
        
        
        
        Connection con;
        PreparedStatement ps;
        //file
        File f = null;
        DiskFileItemFactory diskFile = new DiskFileItemFactory();
        diskFile.setSizeThreshold(5 * 1024 * 1024);
        diskFile.setRepository(f);
        //sfu
        ServletFileUpload sfu = new ServletFileUpload(diskFile);
        
        //unique key generation
        
        
        try {
            List item = sfu.parseRequest(request);
            Iterator itr = item.iterator();
            FileItem items = (FileItem) itr.next();
            InputStream input = items.getInputStream();
            int size=input.available();
            System.out.println("file name is " +items.getName());

            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection conn = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= conn.prepareStatement("insert into files(filename, file, size, date1, skey) values(?,?,?,?,?,?)");
            ps.setString(1,items.getName());
            ps.setString(2,"ddfs");
            ps.setString(3,size+"");
            ps.setString(5,getCurrentDate().toString());
            ps.setString(6,key);
            ps.executeUpdate();
            File f1 = new File(items.getName());
            response.sendRedirect("authority.jsp?status=uploaded");
        } catch (Exception ex) {
            out.print(ex);
        }
        
        
        
        
    }
    
    public int uniq(){
        Random s = new Random();
        int a = s.nextInt(80000000 - 5000) + 25000;
        String key = a+"";
        try {
            Connection con;
            PreparedStatement ps;

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost/twofacauth","root","");
            ps= con.prepareStatement("select * from files where skey like %?%");
            ps.setString(1,key);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                    uniq();
            }else{
                return a;

            }
        }catch(Exception e){}
        return a;
    }
    
}

