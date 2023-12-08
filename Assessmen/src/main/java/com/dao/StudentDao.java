package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.Student;
import com.util.StudentUtil;

public class StudentDao {
	public static void insert(Student s) {
		try {
			Connection conn = StudentUtil.createConnection();
			String sql = "insert into assessment(fname,lname,email,mobile,address,gender,password) values(?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getFname());
			pst.setString(2, s.getLname());
			pst.setString(3, s.getEmail());
			pst.setString(4, s.getMobile());
			pst.setString(5, s.getAddress());
			pst.setString(6, s.getGender());
			pst.setString(7, s.getPassword());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static boolean checkLogin(String email) {
		boolean flag = false;
		{
			try {
				Connection conn = StudentUtil.createConnection();
				String sql = "select * from assessment where email=?";
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setString(1, email);
				ResultSet rs = pst.executeQuery();
				if (rs.next()) {
					flag = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag;
		}
	}

	public static Student login(String email,String password) {
		Student s = null;
		{
			try {
				Connection conn = StudentUtil.createConnection();
				String sql = "select * from assessment where email=? and password=?";
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setString(1, email);
				pst.setString(2, password);
				ResultSet rs = pst.executeQuery();
				if (rs.next()) {
					s = new Student();
					s.setId(rs.getInt("id"));
					s.setFname(rs.getString("fname"));
					s.setLname(rs.getString("lname"));
					s.setEmail(rs.getString("email"));
					s.setMobile(rs.getString("mobile"));
					s.setAddress(rs.getString("address"));
					s.setGender(rs.getString("gender"));
					s.setPassword(rs.getString("password"));

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return s;
		}

	}
	public static void change_password(Student s)
	{
		try {
			Connection conn=StudentUtil.createConnection();
			 String sql="update assessment set password=? where id=?";
			 PreparedStatement pst=conn.prepareStatement(sql);
			 pst.setString(1, s.getPassword());
			 pst.setInt(2, s.getId());
			 pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void reset_password(String email,String password)
	{
		try {
			Connection conn=StudentUtil.createConnection();
			 String sql="update assessment set password=? where email=?";
			 PreparedStatement pst=conn.prepareStatement(sql);
			 pst.setString(1, password);
			 pst.setString(2, email);
			 pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void updateProile(Student s)
	{
		try {
			Connection conn=StudentUtil.createConnection();
			 String sql="update assessement set fname=?,lname=?,email=?,mobile=?,address=?,gender=? where id=?";
			 PreparedStatement pst=conn.prepareStatement(sql);
			 pst.setString(1, s.getFname());
			 pst.setString(2, s.getLname());
			 pst.setString(3, s.getEmail());
			 pst.setString(4, s.getMobile());
			 pst.setString(5, s.getAddress());
			 pst.setString(6, s.getGender());
			 pst.setInt(7, s.getId());
			 pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static Student getStudent(int id)
	{
		Student s=null;
		try {
			Connection conn=StudentUtil.createConnection();
			String sql="select * from assessment where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				s=new Student();
				s.setId(rs.getInt("id"));
				s.setFname(rs.getString("fname"));
				s.setLname(rs.getString("lname"));
				s.setEmail(rs.getString("email"));
				s.setMobile(rs.getString("mobile"));
				s.setAddress(rs.getString("address"));
				s.setGender(rs.getString("gender"));
				
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
}


