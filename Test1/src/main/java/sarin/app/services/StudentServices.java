package sarin.app.services;

import java.sql.SQLException;
import java.util.ArrayList;

import sarin.app.entities.Student;

public interface StudentServices {

		ArrayList<Student> list() throws SQLException;
		boolean delete(int id) throws SQLException;
		boolean insert(Student stu) throws SQLException;
		boolean update(Student stu) throws SQLException;
		ArrayList<Student> search(String keyword,String type,int row) throws SQLException;
}
