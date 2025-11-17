# Cấu Trúc Website - AutoLux

## 📄 Danh sách các trang

### 1. **index.html** - Trang chủ
**URL:** `/` hoặc `/index.html`

**Nội dung:**
- Hero section với parallax effect
- Thống kê (animated counters)
- Features section (4 tính năng nổi bật)
- Featured cars (6 xe nổi bật)
- CTA section

**Chức năng:**
- Hiển thị tổng quan về showroom
- Link đến các trang khác
- Hiển thị xe nổi bật từ catalog

---

### 2. **catalog.html** - Danh sách xe
**URL:** `/catalog.html`

**Nội dung:**
- Search bar (tìm kiếm real-time)
- Filter bar (hãng, năm, nhiên liệu, giá)
- Sort options (giá, năm, km)
- Car grid (9 xe/trang)
- Pagination

**Chức năng:**
- Tìm kiếm xe theo tên, hãng
- Lọc đa tiêu chí
- Sắp xếp theo nhiều tiêu chí
- Xem chi tiết xe (modal)
- Thêm vào yêu thích
- Thêm vào so sánh
- Thêm vào giỏ hàng

---

### 3. **compare.html** - So sánh xe
**URL:** `/compare.html`

**Nội dung:**
- Compare grid (tối đa 3 xe)
- Thông số kỹ thuật song song
- Nút thêm xe / xóa xe

**Chức năng:**
- Hiển thị xe đã chọn từ catalog
- So sánh giá, năm, km, nhiên liệu, etc.
- Xóa xe khỏi danh sách
- Link về catalog để thêm xe

---

### 4. **calculator.html** - Tính vay mua xe
**URL:** `/calculator.html`

**Nội dung:**
- Form nhập thông tin vay
  - Giá xe
  - Trả trước
  - Lãi suất
  - Thời gian vay
- Kết quả tính toán
  - Số tiền vay
  - Trả hàng tháng
  - Tổng lãi
  - Tổng thanh toán
- Gói vay phổ biến (presets)
- Lưu ý và hướng dẫn

**Chức năng:**
- Tính toán trả góp theo công thức chuẩn
- Quick presets cho các gói vay phổ biến
- Validation input

---

### 5. **contact.html** - Liên hệ
**URL:** `/contact.html`

**Nội dung:**
- Thông tin showroom
  - Địa chỉ
  - Hotline
  - Email
  - Giờ làm việc
- Social links (Facebook, Instagram, YouTube, Zalo)
- Google Maps placeholder
- Form liên hệ
  - Họ tên
  - Số điện thoại
  - Email
  - Chủ đề
  - Nội dung
- FAQ section (4 câu hỏi phổ biến)

**Chức năng:**
- Gửi form liên hệ (mock)
- Hiển thị thông tin liên lạc
- FAQ accordion

---

### 6. **sitemap.html** - Sitemap
**URL:** `/sitemap.html`

**Nội dung:**
- Danh sách tất cả các trang
- Mô tả ngắn gọn từng trang
- Link đến tài liệu

**Mục đích:**
- Điều hướng nhanh
- Tổng quan cấu trúc website

---

## 🔧 Files hỗ trợ

### **styles.css**
- CSS variables cho theming
- Responsive breakpoints
- Dark/Light mode
- Animations & transitions
- Component styles
- Page-specific styles

### **scripts.js**
- State management
- Utility functions
- Data loading
- Filter & sort logic
- Modal management
- Form handling
- Event listeners
- Page-specific initialization

### **mock-data.json**
- 12 xe mẫu với đầy đủ thông tin
- Hình ảnh từ Unsplash
- Thông số kỹ thuật chi tiết

---

## 🎯 Luồng điều hướng

```
index.html (Trang chủ)
    ├─→ catalog.html (Xem xe)
    │       ├─→ Chi tiết xe (Modal)
    │       │       ├─→ Gallery (Modal)
    │       │       ├─→ Đặt lịch lái thử (Modal)
    │       │       └─→ Thêm vào giỏ (Modal)
    │       └─→ compare.html (So sánh)
    │
    ├─→ calculator.html (Tính vay)
    │
    └─→ contact.html (Liên hệ)
```

---

## 📱 Modals (Shared across pages)

### 1. **Car Detail Modal**
- Hiển thị chi tiết xe
- Gallery ảnh
- Thông số kỹ thuật
- Actions (yêu thích, giỏ hàng, lái thử)

### 2. **Gallery Modal**
- Xem ảnh full size
- Navigate với arrows
- Keyboard support
- Thumbnails

### 3. **Auth Modal**
- Tab: Đăng nhập / Đăng ký
- Form validation
- LocalStorage mock auth

### 4. **Cart Modal**
- Danh sách xe trong giỏ
- Tổng tiền
- Nút thanh toán

### 5. **Checkout Modal**
- Form thông tin khách hàng
- Tóm tắt đơn hàng
- Xác nhận (mock)

### 6. **Test Drive Modal**
- Form đặt lịch
- Chọn ngày giờ
- Validation

---

## 🎨 Shared Components

### Header/Navigation
- Logo
- Menu (responsive hamburger)
- Theme toggle
- Favorites badge
- Cart badge
- Auth button

### Footer
- Company info
- Quick links
- Support links
- Copyright

---

## 💾 LocalStorage Data

```javascript
{
  "favorites": [1, 3, 5],           // Array of car IDs
  "cart": [{...car}, {...car}],    // Array of car objects
  "compareList": [{...car}],        // Array of car objects (max 3)
  "currentUser": {                  // User object or null
    "name": "...",
    "email": "..."
  },
  "theme": "dark",                  // "light" or "dark"
  "testDrives": [...],              // Array of test drive bookings
  "orders": [...]                   // Array of orders
}
```

---

## 🚀 Cách thêm trang mới

1. Tạo file HTML mới (ví dụ: `about.html`)
2. Copy structure từ một trang hiện có
3. Cập nhật navigation links trong tất cả các trang
4. Thêm page-specific styles vào `styles.css`
5. Thêm page-specific logic vào `scripts.js`
6. Cập nhật `sitemap.html`

---

## 📝 Notes

- Tất cả các trang share cùng CSS và JS files
- Modals được inject động vào `#modals-container`
- Navigation state được quản lý bằng active class
- Data được load từ `mock-data.json` một lần và cache trong AppState
- Theme preference được lưu trong localStorage
- Responsive breakpoints: 1024px, 768px, 480px

---

**Cập nhật:** 2024
**Version:** 1.0.0
