package semidemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import semidemo.dto.MemberDTO;

public class MemberDAO {
   private Connection conn;
   private Statement stmt;
   private PreparedStatement pstmt;
   private ResultSet rs;

   // 싱글톤 객체 생성-------------------------------------------------------------------
   private MemberDAO() {

   }

   private static MemberDAO dao = new MemberDAO();

   public static MemberDAO getInstance() {
      return dao;
   }
   // 반복되서 사용되는 것----------------------------------------------------------------

   // 1.Connection 객체값 받아오기 (DriverManager에 있는 getConnection를 이용)
   private Connection init() throws ClassNotFoundException, SQLException {
      Class.forName("oracle.jdbc.OracleDriver");
      String url = "jdbc:oracle:thin://@127.0.0.1:1521:xe";
      String user = "hr";
      String password = "a1234";
      return DriverManager.getConnection(url, user, password);
   }// end init()

   // 2.연결종료
   private void exit() throws SQLException {
      if (rs != null)
         rs.close();
      if (stmt != null)
         stmt.close();
      if (pstmt != null)
         pstmt.close();
      if (conn != null)
         conn.close();
   }// end exit()

   // ------------------------------------------------------------------------------

   // 회원가입 시 DB에 정보 삽입
   public void insertMember(MemberDTO dto) {
      try {
         System.out.println(1);
         conn = init();

         String sql = "insert into member values(member_num_seq.nextval,?,?,?,?,?,?,?,0,?)";
         pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, dto.getNickname());
         pstmt.setString(2, dto.getId());
         pstmt.setString(3, dto.getPassword());
         pstmt.setString(4, dto.getEmail());
         pstmt.setString(5, dto.getGender());
         pstmt.setString(6, dto.getPass_ques());
         pstmt.setString(7, dto.getPass_answ());
         /* pstmt.setInt(8, dto.getCnt()); */
         pstmt.setString(8, dto.getGrade());

         pstmt.executeUpdate();
         conn.commit();

      } catch (ClassNotFoundException | SQLException e) {
         e.printStackTrace();

      } finally {
         try {
            exit();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }

   }// end insertMethod()

//로그인 시 DB의 아이디, 패스워드와 같은지 확인 후 같을 경우 로그인 완료 
/*   public int login(String id, String password) {
      String sql = "SELECT password FROM MEMBER WHERE id=?";

      try {

         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            
            if (rs.getString(1).equals(password)) {
               return 1;// 로그인 성공
            } else {
               return 0;// 비밀번호 불일치
            }
         }
         return -1;// 아이디가 없음

      } catch (SQLException e) {
         e.printStackTrace();
      }
      return -2; // 데이터베이스 오류

   }*/

}// end class