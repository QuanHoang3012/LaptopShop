/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBUtils {
protected Connection connection;
public DBUtils()
{
try {
// Edit URL , username, password to authenticate with your MS SQL Server
String url = "jdbc:sqlserver://localhost:1433;databaseName= Laptop_Shop";
String username = "sa";
String password = "123456789Q";
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
connection = DriverManager.getConnection(url, username, password);
} catch (ClassNotFoundException | SQLException ex) {
System.out.println(ex);
}
}
}
