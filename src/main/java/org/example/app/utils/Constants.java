package org.example.app.utils;

import org.example.app.credentials.Credentials;

public final class Constants {

    private Constants() {
    }

    public final static String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    public final static String DB_URL = "jdbc:mysql://localhost:3306/";
    public final static String DB_NAME = "employees_db";
    public final static String DB_USER = "root";
    public final static String DB_PASS = Credentials.DB_PASS;
}