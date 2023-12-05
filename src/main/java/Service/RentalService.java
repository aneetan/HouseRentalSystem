package Service;

import DBConnection.DBConnection;
import Model.HouseRental;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RentalService {

    //Saving details for registration form and registering user
    public void authorizeUser(HouseRental rental) {
        String query = "INSERT INTO user(name, email, password)" + "values(?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, rental.getName());
            preparedStatement.setString(2, rental.getEmail());
            preparedStatement.setString(3, rental.getPassword());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //helps to login the user by checking database
    public HouseRental loginUser(String email, String password){
        String query= "select * from user where email=? and password=?";
        PreparedStatement preparedStatement= new DBConnection().getStatement(query);
        HouseRental houseRental= null;

        try{
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,password);

            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                houseRental = new HouseRental();

                houseRental.setId(resultSet.getInt("id"));
                houseRental.setEmail(resultSet.getString("email"));
                houseRental.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return houseRental;
    }

    //last phase of the forgot password which is used for resetting the old password into newpassword
    public void resetPassword(String email, String password) throws SQLException {
        String query = "UPDATE user SET password = ? WHERE email = ?";

        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        preparedStatement.setString(1, password);
        preparedStatement.setString(2, email);

        preparedStatement.executeUpdate();

    }



    // Check the email exists on the database or not ona boolean value
    public boolean isEmailExists(String email) throws SQLException {
        String query = "SELECT COUNT(*) FROM user WHERE email = ?";
        int count = 0;

        try (PreparedStatement preparedStatement = new DBConnection().getStatement(query)) {
            preparedStatement.setString(1, email);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    count = resultSet.getInt(1);
                }
            }
        }

        return count > 0;
    }
}
