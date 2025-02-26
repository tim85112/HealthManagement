package controller.fitness;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import model.User;
import dao.fitness.ExerciseRecordDAO;
import model.fitness.ExerciseRecord;
import service.fitness.ExerciseRecordService;
import service.UserService;

@WebServlet("/api/fitness/progress") //串聯前端
public class ExerciseRecordController extends HttpServlet {

    private ExerciseRecordService exerciseRecordService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        exerciseRecordService = new ExerciseRecordService();
        userService = new UserService();
    }

    // 取得用戶 ID 並驗證用戶是否存在
    private User getUserFromRequest(HttpServletRequest request) throws ServletException, SQLException {
        String userIdStr = request.getParameter("userId");
        if (userIdStr == null || userIdStr.isEmpty()) {
            throw new ServletException("用戶 ID 缺失");
        }
        int userId = Integer.parseInt(userIdStr);
        User user = userService.getUserById(userId);
        if (user == null) {
            throw new ServletException("找不到該用戶，ID: " + userId);
        }
        return user;
    }

    // 處理 GET 請求，顯示運動紀錄和用戶清單
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	String action = request.getParameter("action");
            if ("all".equals(action)) {
            	 List<ExerciseRecord> records = exerciseRecordService.getAllExerciseRecords();
                request.setAttribute("records",records);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/fitness/exerciseRecords.jsp");
                dispatcher.forward(request, response);
                }
            else if ("update".equals(action)) {
                int recordId = Integer.parseInt(request.getParameter("recordId"));
                try (Connection conn = exerciseRecordService.getConnection()) {
                    ExerciseRecordDAO dao = new ExerciseRecordDAO(conn);
                    ExerciseRecord record = dao.getExerciseRecordById(recordId);
                    if (record == null) {
                        throw new ServletException("找不到運動紀錄，ID: " + recordId);
                    }
                    request.setAttribute("record", record);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/fitness/updateExerciseRecord.jsp");
                    dispatcher.forward(request, response);
                } catch (Exception e) {
                    handleError(e, request, response);
                }
            } else if ("add".equals(action)) {
                User user = getUserFromRequest(request);
                request.setAttribute("userId", user.getId());
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/fitness/addExerciseRecord.jsp");
                dispatcher.forward(request, response);
            } else {
                User user = getUserFromRequest(request);
                List<User> users = userService.getAllUsers();
                List<ExerciseRecord> records = exerciseRecordService.getExerciseRecords(user.getId()); // 修改為 getId()
                request.setAttribute("records", records);
                request.setAttribute("users", users);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/fitness/exerciseRecords.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            handleError(e, request, response);
        }
    }
    // 處理 POST 請求，新增、更新或刪除運動紀錄
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("add".equals(action)) {
                addExerciseRecord(request, response);
            } else if ("update".equals(action)) {
                updateExerciseRecord(request, response);
            } else if ("delete".equals(action)) {
                deleteExerciseRecord(request, response);
            } else {
                throw new ServletException("無效的操作: " + action);
            }
        } catch (Exception e) {
            handleError(e, request, response);
        }
    }
    // 新增運動紀錄
    private void addExerciseRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ExerciseRecord record = extractRecordFromRequest(request);
            double caloriesBurned = exerciseRecordService.calculateCaloriesBurned(record);
            record.setCaloriesBurned(caloriesBurned);

            User user = userService.getUserById(record.getUserId());
            if (user == null) {
                throw new ServletException("找不到用戶，ID: " + record.getUserId());
            }

            exerciseRecordService.addExerciseRecord(record);

            request.setAttribute("successMessage", "新增成功!");
            List<ExerciseRecord> records = exerciseRecordService.getExerciseRecords(record.getUserId());
            request.setAttribute("records", records);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/fitness/exerciseRecords.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            handleError(e, request, response);
        }
    }

    // 更新運動紀錄
    private void updateExerciseRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ExerciseRecord record = extractRecordFromRequest(request);
            double caloriesBurned = exerciseRecordService.calculateCaloriesBurned(record);
            record.setCaloriesBurned(caloriesBurned);

            User user = userService.getUserById(record.getUserId());
            if (user == null) {
                throw new ServletException("找不到用戶，ID: " + record.getUserId());
            }

            exerciseRecordService.updateExerciseRecord(record);

            // 設置成功訊息
            request.setAttribute("successMessage", "更新成功!");

            // 取得並顯示該用戶的所有運動紀錄
            List<ExerciseRecord> records = exerciseRecordService.getExerciseRecords(record.getUserId());
            request.setAttribute("records", records);

            // 轉發到 exerciseRecords.jsp，顯示更新後的紀錄
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/fitness/exerciseRecords.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            handleError(e, request, response);
        }
    }

    // 刪除運動紀錄
    private void deleteExerciseRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String recordIdStr = request.getParameter("recordId");
            String userIdStr = request.getParameter("userId");

            if (recordIdStr == null || recordIdStr.isEmpty() || userIdStr == null || userIdStr.isEmpty()) {
                throw new ServletException("刪除操作缺少必要的參數");
            }

            int recordId = Integer.parseInt(recordIdStr);
            int userId = Integer.parseInt(userIdStr);

            User user = userService.getUserById(userId);
            if (user == null) {
                throw new ServletException("找不到用戶，ID: " + userId);
            }

            exerciseRecordService.deleteExerciseRecord(recordId);

            request.setAttribute("successMessage", "刪除成功!");
            List<ExerciseRecord> records = exerciseRecordService.getExerciseRecords(userId);
            request.setAttribute("records", records);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/fitness/exerciseRecords.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            handleError(e, request, response);
        }
    }

    // 從請求中提取運動紀錄資料
    private ExerciseRecord extractRecordFromRequest(HttpServletRequest request) throws ServletException {
        try {
            ExerciseRecord record = new ExerciseRecord();

            String userIdStr = request.getParameter("userId");
            if (userIdStr == null || userIdStr.isEmpty()) {
                throw new ServletException("用戶 ID 缺失或為空");
            }
            record.setUserId(Integer.parseInt(userIdStr));

            String recordIdStr = request.getParameter("recordId");
            if (recordIdStr != null && !recordIdStr.isEmpty()) {
                record.setRecordId(Integer.parseInt(recordIdStr));
            }

            record.setExerciseType(request.getParameter("exerciseType"));
            record.setExerciseDuration(Integer.parseInt(request.getParameter("exerciseDuration")));
            record.setExerciseDate(request.getParameter("exerciseDate"));

            return record;
        } catch (Exception e) {
            throw new ServletException("資料格式無效", e);
        }
    }

    private void handleError(Exception e, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        e.printStackTrace();
        request.setAttribute("errorMessage", "無法處理請求: " + e.getMessage());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/fitness/error.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void destroy() {
    }
}
