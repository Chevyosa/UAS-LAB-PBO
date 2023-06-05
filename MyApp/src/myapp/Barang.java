/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package myapp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class Barang {
    public String id_item;
    public String nama_item;
    public float harga_item;
    
    static ArrayList<Barang> ListBarang;
    public static void loadBarangFromDB(){
       ListBarang = new ArrayList<Barang>();
       Barang barang;
        try {
            Statement stmt = DBConnector.connection.createStatement();  
            String sql = "SELECT * FROM items";
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                barang = new Barang();
                barang.id_item = rs.getString("id_item");  
                barang.nama_item = rs.getString("nama_item");
                barang.harga_item = rs.getFloat("harga_item"); 
                ListBarang.add(barang);
            }
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
    
    
}
}
