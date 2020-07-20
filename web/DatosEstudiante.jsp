<%-- 
    Document   : DatosEstudiante
    Created on : 19-jul-2020, 19:54:09
    Author     : User
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos estudiante</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
        %>
    </head>
    <body>
        <table border="1" cellspacing="1" cellpadding="1" align = "center" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Código</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>                
                <%
                    try {
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        consulta = " select idestudiante, nombre, apellidos, dni, codigo, estado"
                                + " from estudiante";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%out.print(rs.getString(1));%></td>
                    <td><%out.print(rs.getString(2));%></td>
                    <td><%out.print(rs.getString(3));%></td>
                    <td><%out.print(rs.getString(4));%></td>
                    <td><%out.print(rs.getString(5));%></td>
                    <td><%out.print(rs.getString(6));%></td>
                </tr>
                <%
                        }
                        rs.close();
                        pst.close();
                        cn.close();
                    } catch (Exception e) {
                        out.print("Error SQL");
                    }
                %>                
            </tbody>
        </table>
    </body>
</html>

