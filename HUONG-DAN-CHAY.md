# Hướng dẫn chạy website AutoLux

## Vấn đề: "Không thể tải dữ liệu xe"

Website này cần chạy qua HTTP server, không thể mở trực tiếp file HTML vì trình duyệt sẽ chặn việc tải file JSON (CORS policy).

## Cách chạy:

### Cách 1: Sử dụng file START-SERVER.bat (Đơn giản nhất)
1. Double-click vào file `START-SERVER.bat`
2. Trình duyệt sẽ tự động mở tại http://localhost:8000
3. Để dừng server, nhấn Ctrl+C trong cửa sổ Command Prompt

### Cách 2: Chạy thủ công với Python
1. Mở Command Prompt hoặc PowerShell
2. Di chuyển đến thư mục dự án:
   ```
   cd E:\Quang-Anh\DA-WEB
   ```
3. Chạy lệnh:
   ```
   python -m http.server 8000
   ```
4. Mở trình duyệt và truy cập: http://localhost:8000

### Cách 3: Sử dụng VS Code Live Server
1. Cài đặt extension "Live Server" trong VS Code
2. Click chuột phải vào file `index.html`
3. Chọn "Open with Live Server"

## Lưu ý:
- Đảm bảo Python đã được cài đặt trên máy
- Không mở trực tiếp file HTML bằng cách double-click
- Luôn chạy qua HTTP server để tránh lỗi CORS

## Kiểm tra:
- Nếu thấy thông báo "Không thể tải dữ liệu xe" => Bạn đang mở file trực tiếp
- Nếu website hiển thị bình thường => Bạn đang chạy đúng qua HTTP server
