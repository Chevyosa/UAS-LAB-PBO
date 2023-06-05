/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package myapp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class Transaksi {
    public static int id_transaksi;
    public static float grand_total;
    public static float uang_dibayar;
    public static float kembalian;
      static ArrayList<itemTransaksi> itemTransaksi = new ArrayList<>();
    
    public Transaksi(int id_transaksi, float grand_total, float uang_dibayar, float kembalian){
        this.id_transaksi = id_transaksi;
        this.grand_total = grand_total;
        this.uang_dibayar = uang_dibayar;
        this.kembalian = kembalian;
    }
    
    public static void addItem(itemTransaksi item){
        itemTransaksi.add(item);
    }

     public static void simpanDatabase() throws SQLException{
        
        try{
            Connection conn = DBConnector.initDBConnection();
            String sql = "INSERT INTO total_transaksi(id_transaksi, grand_total, uang_dibayar, kembalian) VALUES(?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
           
            stmt.setInt(1,id_transaksi);
            stmt.setFloat(2, grand_total);
            stmt.setFloat(3, uang_dibayar);
            stmt.setFloat(4,kembalian);
            stmt.executeUpdate();
            
            sql = "INSERT INTO transaksi(id_transaksi, nama_item, id_item, total_item, harga_item, total_harga) VALUES(?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            for(itemTransaksi item : itemTransaksi){
                stmt.setInt(1,id_transaksi);
                stmt.setString(2,item.nama_item);
                stmt.setString(3, item.id_item);
                stmt.setInt(4, item.total_item);
                stmt.setFloat(5,item.harga_item);
                stmt.setFloat(6,item.total_harga);
                stmt.executeUpdate();
            }
            
            
        } catch(SQLException e){
            System.out.print(e);
        }
    }

    static class itemTransaksi {
        public String nama_item;
        public String id_item;
        public float harga_item;
        public int total_item;
        public float total_harga;

        public itemTransaksi(String nama_item, String id_item, int total_item, float harga_item, float total_harga) {
            this.nama_item = nama_item;
            this.id_item = id_item;
            this.total_item= total_item;
            this.harga_item = harga_item;
            this.total_harga = total_harga;
        }
    }
}
