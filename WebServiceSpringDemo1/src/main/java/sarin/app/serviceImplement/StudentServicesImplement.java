package sarin.app.serviceImplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sarin.app.entitie.Student;
import sarin.app.service.StudentServices;

@Repository
public class StudentServicesImplement implements StudentServices {
	private Connection con;
	@Autowired
	private DataSource dataSource;
	
	/*public StudentServicesImplement(DataSource dataSource) {
		this.dataSource=dataSource;
	}*/

	public ArrayList<Student> list() throws SQLException {
	
		try {
			Student s;
			con=dataSource.getConnection();
			ResultSet rs = null;
			String sql = "SELECT * FROM  student";
			PreparedStatement ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<Student> a = new ArrayList<Student>();
			
			while(rs.next()){	
				s = new Student();
				s.setId(rs.getInt("id"));
				s.setFirst_name(rs.getString("first_name"));
				s.setLast_name(rs.getString("last_name"));
				s.setClassroom(rs.getString("classroom"));
				a.add(s);	
			}
			
			return a;
			}catch (SQLException e){
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return null;	
	}

	public boolean delete(int id) throws SQLException {
		try {	
			con=dataSource.getConnection();	
			String sql = "delete FROM student where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);	
			if(ps.executeUpdate()>0){return true;}
			else{return false;}	
			}catch (SQLException e){e.printStackTrace();}
			finally {
				con.close();
			}
			return false;
	}

	public boolean insert(Student stu) throws SQLException {
		try {		
			con=dataSource.getConnection();		
			String sql = "insert into student(first_name,last_name,classroom) VALUES( ?, ? , ?  )";
			PreparedStatement ps = con.prepareStatement(sql);		
			ps.setString(1, stu.getFirst_name());
			ps.setString(2, stu.getLast_name());		
			ps.setString(3, stu.getClassroom());
			if(ps.executeUpdate()>0){
				return true;
			}
			else{
				return false;
			}
			
			}catch (SQLException e){
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return false;
	}

	public boolean update(Student stu) throws SQLException {
		try {		
			con=dataSource.getConnection();		
			String sql = "UPDATE student set first_name = ? ,last_name = ?  ,classroom = ? WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);		
			ps.setString(1, stu.getFirst_name());
			ps.setString(2, stu.getLast_name());		
			ps.setString(3, stu.getClassroom());
			ps.setInt(4, stu.getId());
			if(ps.executeUpdate()>0){
				return true;
			}
			else{
				return false;
			}
			
			}catch (SQLException e){
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return false;
	}

	public ArrayList<Student> search(String keyword, String type, int row) throws SQLException {
		try {
			Student s;
			con=dataSource.getConnection();
			ResultSet rs = null;
			String sql = "SELECT * FROM  student where "+type+" like ? LIMIT  "+row;
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"%" +keyword+"%");
			rs=ps.executeQuery();
			ArrayList<Student> a = new ArrayList<Student>();
			
			while(rs.next()){	
				s = new Student();
				s.setId(rs.getInt("id"));
				s.setFirst_name(rs.getString("first_name"));
				s.setLast_name(rs.getString("last_name"));
				s.setClassroom(rs.getString("classroom"));
				a.add(s);	
			}
			
			return a;
			}catch (SQLException e){
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return null;
		// TODO Auto-generated method stub
	}
	

		
}
