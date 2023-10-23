package com.school.classes;

import java.sql.ResultSet;

public class subjectDBUtil {

    public static boolean insertSubjects(String sub_name, String sub_grade, String sub_hrs, String[] sub_test) {

        boolean isSuccess = false;

        try {
            int grade = Integer.parseInt(sub_grade);
            int hrs = Integer.parseInt(sub_hrs);

            String last_id;
            String new_id;

            String last_id_q = "SELECT MAX(sub_id) AS 'last_id' FROM subject";

            ResultSet rs = DB.search(last_id_q);
            if (rs.next()) {
                last_id = rs.getString("last_id");
                GenerateId gs = new GenerateId();
                new_id = gs.generate(last_id, "SB");
                //System.out.println(sub_test.length);
                String examTypes = "";
                for (int i = 0; i < sub_test.length; i++) {

                    examTypes = examTypes.concat(sub_test[i]);


                }

                System.out.println(examTypes);

                int types = Integer.parseInt(examTypes);

                String sql_insert = "INSERT INTO subject (sub_id, sub_name, grade_id, teaching_hrs, exam_types, status) VALUES ('" + new_id + "', '" + sub_name + "','" + grade + "','" + hrs + "','" + types + "', 1)";

                DB.iud(sql_insert);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }


    public static boolean updateSubjects(String sub_name, String sub_grade, String sub_hrs, String[] sub_test, String sub_id) {

        boolean isSuccess = false;

        try {
            int grade = Integer.parseInt(sub_grade);
            int hrs = Integer.parseInt(sub_hrs);


            String examTypes = "";
            for (int i = 0; i < sub_test.length; i++) {

                examTypes = examTypes.concat(sub_test[i]);


            }

            System.out.println(examTypes);

            int types = Integer.parseInt(examTypes);

            String sql_update = "UPDATE subject SET sub_name = '" + sub_name + "', grade_id = '" + grade + "', teaching_hrs = '" + hrs + "', exam_types = '" + types + "' WHERE sub_id = '" + sub_id + "'";

            DB.iud(sql_update);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static boolean deleteSubjects(String sub_id) {

        boolean isSuccess = false;

        try {

            String sql_delete = "UPDATE subject SET status = '0' WHERE sub_id = '" + sub_id + "'";

            DB.iud(sql_delete);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }


}
