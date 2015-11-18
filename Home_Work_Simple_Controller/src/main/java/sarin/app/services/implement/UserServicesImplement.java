package sarin.app.services.implement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sarin.app.entities.UserDTO;
import sarin.app.services.UserServices;





@Repository
public class UserServicesImplement implements UserServices {
	private Connection con;
	@Autowired
	private DataSource dataSource;
	
	
	/*function list data*/
	public ArrayList<UserDTO> list(int limit,int page) throws SQLException {
	
			int offset = (limit*page)-limit;
		try {
			UserDTO s;
			con=dataSource.getConnection();
			ResultSet rs = null;
			String sql = "SELECT * FROM  tbuser Limit ? offset ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, limit);
			ps.setInt(2, offset);
			rs=ps.executeQuery();
			ArrayList<UserDTO> a = new ArrayList<UserDTO>();
			
			while(rs.next()){	
				s = new UserDTO();
				s.setId(rs.getInt("id"));
				s.setUser_name(rs.getString("username"));
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
				s.setBirthdate(rs.getDate("birthdate"));
				s.setRegisterdate(rs.getDate("registerdate"));
				s.setImage(rs.getString("image"));
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

		/*function for delete data*/
	public boolean delete(int id) throws SQLException {
		try {	
			con=dataSource.getConnection();	
			String sql = "delete FROM tbuser where id = ?";
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

	/*function for insert data*/
	public boolean insert(UserDTO user) throws SQLException {
		try {		
			con=dataSource.getConnection();		
			String sql = "insert into tbuser(username,email,password,birthdate,registerdate,image) VALUES( ? , ? , ? , ? , ? , ?  )";
			PreparedStatement ps = con.prepareStatement(sql);		
			ps.setString(1, user.getUser_name());
			ps.setString(2, user.getEmail());		
			ps.setString(3, user.getPassword());
			ps.setDate(4, user.getBirthdate());
			ps.setDate(5, user.getRegisterdate());
			ps.setString(6, user.getImage());					
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

	/*function for update*/
	public boolean update(UserDTO user) throws SQLException {
		try {		
			con=dataSource.getConnection();		
			String sql = "UPDATE tbuser set username = ? ,email = ? ,password = ?,birthdate = ?,registerdate = ?,image = ? WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);		
			ps.setString(1, user.getUser_name());
			ps.setString(2, user.getEmail());		
			ps.setString(3, user.getPassword());
			ps.setDate(4, user.getBirthdate());
			ps.setDate(5, user.getRegisterdate());
			ps.setString(6, user.getImage());
			ps.setInt(7, user.getId());
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

		/*function for search data*/
	public ArrayList<UserDTO> search(String keyword, String type, int row) throws SQLException {
		try {
			UserDTO s;
			con=dataSource.getConnection();
			ResultSet rs = null;
			String sql = "SELECT * FROM  tbuser where "+type+" like ? LIMIT  "+row;
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"%" +keyword+"%");
			rs=ps.executeQuery();
			ArrayList<UserDTO> a = new ArrayList<UserDTO>();
			
			while(rs.next()){	
				s = new UserDTO();
				s.setId(rs.getInt("id"));
				s.setUser_name(rs.getString("username"));
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
				s.setBirthdate(rs.getDate("birthdate"));
				s.setRegisterdate(rs.getDate("registerdate"));
				s.setImage(rs.getString("image"));
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

		/*function list data for update*/
	public ArrayList<UserDTO> update(int id) throws SQLException {
		
		try {
			UserDTO s;
			con=dataSource.getConnection();
			ResultSet rs = null;
			String sql = "SELECT * FROM  tbuser where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);			
			rs=ps.executeQuery();
			ArrayList<UserDTO> a = new ArrayList<UserDTO>();
			
			while(rs.next()){	
				s = new UserDTO();
				s.setId(rs.getInt("id"));
				s.setUser_name(rs.getString("username"));
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
				s.setBirthdate(rs.getDate("birthdate"));
				s.setRegisterdate(rs.getDate("registerdate"));
				s.setImage(rs.getString("image"));
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
	

		
}
