# AutoLux - Website Bán Ô Tô Cao Cấp

Website bán ô tô chuyên nghiệp được xây dựng bằng HTML, CSS và JavaScript thuần (Vanilla ES6+).

## 🚀 Tính năng chính

### Giao diện & Thiết kế
- ✨ Thiết kế hiện đại, tinh tế phong cách high-end showroom
- 📱 Responsive hoàn toàn (Desktop, Tablet, Mobile)
- 🌓 Chế độ Dark/Light mode
- 🎨 Hiệu ứng mượt mà: parallax, hover effects, smooth transitions
- ♿ Accessibility-friendly với ARIA labels và keyboard navigation

### Chức năng Catalog
- 🔍 Tìm kiếm real-time với debounce
- 🎯 Bộ lọc đa tiêu chí: hãng, năm, nhiên liệu, giá, km
- 📊 Sắp xếp: giá, năm, km
- 📄 Phân trang (pagination)
- 💾 Lazy loading cho hình ảnh
- 🎴 Card sản phẩm đẹp với badge, rating

### Trang Chi Tiết Xe
- 🖼️ Gallery ảnh với lightbox/modal
- 📋 Thông số kỹ thuật đầy đủ
- ❤️ Thêm vào yêu thích
- 🔄 So sánh xe (tối đa 3 xe)
- 🚗 Đặt lịch lái thử
- 🛒 Thêm vào giỏ hàng

### So Sánh Xe
- ⚖️ So sánh tối đa 3 xe song song
- 📊 Hiển thị thông số chi tiết
- 🔄 Dễ dàng thêm/xóa xe khỏi danh sách

### Tính Toán Vay Mua Xe
- 💰 Nhập giá xe, trả trước, lãi suất, kỳ hạn
- 📈 Tính toán trả góp hàng tháng
- 💵 Hiển thị tổng lãi và tổng thanh toán

### Giỏ Hàng & Thanh Toán
- 🛒 Quản lý giỏ hàng
- 📝 Form checkout với validation
- ✅ Xác nhận đơn hàng (demo)

### Xác Thực Người Dùng
- 👤 Đăng ký/Đăng nhập (client-side mock)
- 💾 Lưu trữ localStorage
- 🔐 Quản lý session đơn giản

### Liên Hệ
- 📧 Form liên hệ với validation
- 🗺️ Placeholder cho Google Maps
- 📞 Thông tin showroom

## 📁 Cấu trúc Project

```
DA-WEB/
├── index.html          # Trang chủ
├── catalog.html        # Trang danh sách xe
├── compare.html        # Trang so sánh xe
├── calculator.html     # Trang tính vay
├── contact.html        # Trang liên hệ
├── styles.css          # File CSS với variables, responsive
├── scripts.js          # File JavaScript với đầy đủ chức năng
├── mock-data.json      # Dữ liệu xe mẫu (12 xe)
├── assets/             # Thư mục chứa hình ảnh, icons
│   └── README.md       # Hướng dẫn quản lý assets
├── README.md           # File hướng dẫn này
├── ADVANCED.md         # Tài liệu kỹ thuật nâng cao
├── package.json        # Package configuration
└── .gitignore          # Git ignore file
```

## 🎯 Cách chạy

### Phương pháp 1: Mở trực tiếp
1. Mở file `index.html` bằng trình duyệt web
2. Lưu ý: Một số trình duyệt có thể chặn fetch local files. Nếu gặp lỗi CORS, sử dụng phương pháp 2.

### Phương pháp 2: Sử dụng Live Server (Khuyến nghị)
1. Cài đặt extension "Live Server" trong VS Code
2. Click chuột phải vào `index.html` → "Open with Live Server"
3. Website sẽ tự động mở tại `http://localhost:5500`

### Phương pháp 3: Sử dụng Python HTTP Server
```bash
# Python 3
python -m http.server 8000

# Sau đó mở trình duyệt tại: http://localhost:8000
```

### Phương pháp 4: Sử dụng Node.js HTTP Server
```bash
# Cài đặt http-server global
npm install -g http-server

# Chạy server
http-server

# Mở trình duyệt tại: http://localhost:8080
```

## 🎨 Tùy chỉnh

### Thay đổi màu sắc
Mở file `styles.css` và chỉnh sửa CSS variables trong `:root`:
```css
:root {
    --primary-color: #2563eb;  /* Màu chính */
    --accent-color: #f59e0b;   /* Màu nhấn */
    /* ... các biến khác */
}
```

### Thêm/Sửa dữ liệu xe
Mở file `mock-data.json` và chỉnh sửa mảng `cars`:
```json
{
  "id": 13,
  "name": "Tên xe",
  "brand": "Hãng",
  "model": "Model",
  "year": 2023,
  "price": 1000000000,
  "km": 5000,
  "fuel": "Xăng",
  "transmission": "Tự động",
  "seats": 5,
  "color": "Đen",
  "rating": 4.5,
  "badge": "Mới",
  "description": "Mô tả xe...",
  "images": ["url1", "url2", "url3"]
}
```

### Thay đổi hình ảnh
- Thêm hình ảnh vào thư mục `assets/`
- Cập nhật đường dẫn trong `mock-data.json`
- Hoặc sử dụng URL hình ảnh từ internet

### Tích hợp Google Maps
1. Lấy API key từ [Google Cloud Console](https://console.cloud.google.com/)
2. Mở `index.html`, tìm phần iframe maps
3. Thay thế `src="about:blank"` bằng:
```html
<iframe src="https://www.google.com/maps/embed?pb=YOUR_EMBED_CODE" ...></iframe>
```

## 🛠️ Công nghệ sử dụng

- **HTML5**: Semantic markup, accessibility
- **CSS3**: Variables, Grid, Flexbox, Animations
- **JavaScript ES6+**: Modules, Arrow functions, Async/Await
- **LocalStorage**: Lưu trữ dữ liệu client-side
- **Intersection Observer**: Lazy loading, animated counters
- **Fetch API**: Load dữ liệu JSON

## 📱 Responsive Breakpoints

- Desktop: > 1024px
- Tablet: 768px - 1024px
- Mobile: < 768px
- Small Mobile: < 480px

## ⚡ Performance

- Lazy loading cho hình ảnh
- Debounce cho search input
- Throttle cho scroll events
- CSS animations với GPU acceleration
- Minify-friendly code structure

## 🔒 Bảo mật

- Input validation cho tất cả forms
- XSS protection với textContent
- CORS-friendly data loading
- No sensitive data in client-side

## 🎓 Học tập & Mở rộng

### Các điểm có thể mở rộng:
1. **Backend Integration**: Kết nối với API thật (Node.js, PHP, Python)
2. **Database**: Lưu trữ dữ liệu trong MySQL, MongoDB
3. **Payment Gateway**: Tích hợp VNPay, MoMo, Stripe
4. **Admin Dashboard**: Quản lý xe, đơn hàng, khách hàng
5. **Email Service**: Gửi email xác nhận, thông báo
6. **SMS Service**: Gửi OTP, thông báo qua SMS
7. **Analytics**: Google Analytics, Facebook Pixel
8. **SEO**: Meta tags động, sitemap, robots.txt
9. **PWA**: Service Worker, offline support
10. **Testing**: Unit tests, E2E tests

## 📝 Ghi chú

- Đây là project demo, không có backend thật
- Dữ liệu lưu trong localStorage sẽ mất khi clear browser data
- Hình ảnh sử dụng từ Unsplash (placeholder)
- Thanh toán và đặt hàng chỉ là mock/demo
- Google Maps cần API key để hoạt động

## 🐛 Troubleshooting

### Lỗi: Không load được dữ liệu
- Kiểm tra file `mock-data.json` có tồn tại
- Sử dụng Live Server thay vì mở file trực tiếp
- Kiểm tra Console trong DevTools để xem lỗi

### Lỗi: Hình ảnh không hiển thị
- Kiểm tra đường dẫn hình ảnh trong `mock-data.json`
- Đảm bảo có kết nối internet (nếu dùng URL external)
- Thay thế bằng hình ảnh local trong thư mục `assets/`

### Lỗi: LocalStorage không hoạt động
- Kiểm tra browser có bật localStorage
- Xóa cache và thử lại
- Kiểm tra Private/Incognito mode có thể chặn localStorage

## 📄 License

MIT License - Free to use for personal and commercial projects.

## 👨‍💻 Tác giả

AutoLux - Car Showroom Website
Phát triển bởi AI Assistant

---

**Chúc bạn thành công với project! 🚀**

Nếu có câu hỏi hoặc cần hỗ trợ, vui lòng tạo issue hoặc liên hệ.
