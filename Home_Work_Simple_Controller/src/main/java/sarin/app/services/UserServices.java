package sarin.app.services;

import java.sql.SQLException;
import java.util.ArrayList;

import sarin.app.entities.UserDTO;

public interface UserServices {

		ArrayList<UserDTO> list(int limit,int page) throws SQLException;
		boolean delete(int id) throws SQLException;
		boolean insert(UserDTO user) throws SQLException;
		boolean update(UserDTO user) throws SQLException;
		ArrayList<UserDTO> search(String keyword,String type,int row) throws SQLException;
		ArrayList<UserDTO> update(int id) throws SQLException;
}
