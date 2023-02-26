
import com.dietcalculator.dao.CommentDAO;
import com.dietcalculator.dao.ExerciseDAO;
import com.dietcalculator.dao.UserDAO;
import com.dietcalculator.dto.Exercise;

import java.util.List;


/**
 *
 * @author admin
 */
public class TestDAO {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
//        COMMENT TEST
//        CommentDAO dao = new CommentDAO();
//        boolean rs = dao.createComment("CMT000001", "U00001", "PRO0001", 0, "dep");
//        System.out.println(rs);


//        EXERCISE TEST
        ExerciseDAO dao = new ExerciseDAO();
//        boolean rs = dao.createExercise("EX057", "push up", 2.5, 5.2, 1000);
//        boolean rs = dao.updateExercise("EX057", "plank", 5, 3.2, 500);
//        boolean rs = dao.deleteExercise("EX057");
//        System.out.println(rs);
//        List<Exercise> list = dao.readExercise();
//        for(Exercise ex: list)
//            System.out.println(ex.toString());
        
//        USER TEST
//        UserDAO dao = new UserDAO();
//        boolean rs = dao.createUser("U00001", "nam", "12-08-2012", "12345678", "hcm", "nam@gmail.com", "123456", 65.5, 171, 1, 1, 0, 0, 2, 8, 3, 1, 1, 1, 2023-26-02);
//        System.out.println(rs);
    }
    
}
