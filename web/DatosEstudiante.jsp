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
            String s_accion;
        %>
    </head>
    <body>
        <table border="1" cellspacing="1" cellpadding="1" align = "center" >
            <thead>
                <tr>
                    <th colspan="8">
                        Datos Estudiante
                    </th>
                </tr>
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Código</th>
                    <th>Estado</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
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
                        int num = 0;
                        String ide;
                        while (rs.next()) {
                            ide = rs.getString(1);
                            num++;
                %>
                <tr>
                    <td><%out.print(num);%></td>
                    <td><%out.print(rs.getString(2));%></td>
                    <td><%out.print(rs.getString(3));%></td>
                    <td><%out.print(rs.getString(4));%></td>
                    <td><%out.print(rs.getString(5));%></td>
                    <td><%out.print(rs.getString(6));%></td>
                    <td><a href="DatosEstudiante.jsp?f_accion=E&f_idestudiante=<%out.print(ide);%>">Eliminar</a></td>
                    <td>Modificar</td>
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

