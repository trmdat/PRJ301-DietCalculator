package com.dietcalculator.dao;

import com.dietcalculator.dto.Exercise;
import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ExerciseDAO {

    public List<Exercise> getExercise() {
        List<Exercise> list = new ArrayList<>();
        String sql = "";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
}
