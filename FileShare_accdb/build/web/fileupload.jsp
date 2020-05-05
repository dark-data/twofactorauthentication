<%-- 
    Document   : fileupload
    Created on : 1 Nov, 2019, 6:13:57 PM
    Author     : vivek
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!public java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
        public int uniq(){
        Random s = new Random();
        int a = s.nextInt(80000000 - 5000) + 25000;
        String key = a+"";
        try {
            Connection con;
            PreparedStatement ps;
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            con = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
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
        
        %>
        
<%
    String key = uniq()+"";
   PreparedStatement ps;
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = getServletContext().getRealPath("/")+"uploads\\";

   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File(getServletContext().getRealPath("/")+"temp\\"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               // Write the file
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               out.println("Uploaded Filename: " + getServletContext() + 
               fileName + "<br>");
               Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection conn = DriverManager.getConnection("jdbc:ucanaccess://"+getServletContext().getRealPath("/")+"/twofacauth.accdb");
            ps= conn.prepareStatement("insert into files(filename, file, size, date1, skey) values(?,?,?,?,?)");
            ps.setString(1,fileName);
            ps.setString(2,"uploads/"+fileName);
            ps.setString(3,(sizeInBytes/1000000)+" MB");
            ps.setDate(4,getCurrentDate());
            ps.setString(5,key);
            ps.executeUpdate();
            response.sendRedirect("authority.jsp?status=uploaded");
        
            }
         }
         out.println("</body>");
         out.println("</html>");
      } catch(Exception ex) {
         System.out.println(ex);
      }
   } else {
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>    </body>
</html>
