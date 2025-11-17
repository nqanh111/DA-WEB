# Assets Folder

Thư mục này dùng để chứa các tài nguyên tĩnh cho website.

## 📁 Cấu trúc đề xuất

```
assets/
├── images/
│   ├── cars/           # Hình ảnh xe
│   ├── logos/          # Logo showroom, hãng xe
│   ├── banners/        # Banner quảng cáo
│   └── icons/          # Icons tùy chỉnh
├── fonts/              # Font chữ tùy chỉnh (nếu có)
└── documents/          # Tài liệu, brochure PDF
```

## 🖼️ Hướng dẫn thêm hình ảnh

### 1. Thêm hình ảnh xe
- Đặt hình ảnh vào `assets/images/cars/`
- Đặt tên file theo format: `brand-model-year-01.jpg`
- Ví dụ: `mercedes-c300-2023-01.jpg`

### 2. Cập nhật mock-data.json
```json
{
  "images": [
    "assets/images/cars/mercedes-c300-2023-01.jpg",
    "assets/images/cars/mercedes-c300-2023-02.jpg",
    "assets/images/cars/mercedes-c300-2023-03.jpg"
  ]
}
```

### 3. Kích thước hình ảnh đề xuất
- **Card thumbnail**: 800x600px (tỷ lệ 4:3)
- **Detail gallery**: 1200x800px (tỷ lệ 3:2)
- **Banner hero**: 1920x1080px (tỷ lệ 16:9)
- **Logo**: 200x200px (vuông)

### 4. Định dạng file
- **Ảnh thường**: JPG/JPEG (chất lượng 80-90%)
- **Ảnh có nền trong suốt**: PNG
- **Icons**: SVG (ưu tiên) hoặc PNG
- **Logo**: SVG hoặc PNG với nền trong suốt

## 🎨 Nguồn hình ảnh miễn phí

Hiện tại project đang sử dụng hình ảnh từ Unsplash. Bạn có thể thay thế bằng:

1. **Unsplash** - https://unsplash.com/
2. **Pexels** - https://www.pexels.com/
3. **Pixabay** - https://pixabay.com/
4. **Freepik** - https://www.freepik.com/ (cần credit)

## 📝 Lưu ý

- Đảm bảo có quyền sử dụng hình ảnh
- Nén hình ảnh trước khi upload để tối ưu performance
- Sử dụng tên file có ý nghĩa, không dấu, không khoảng trắng
- Backup hình ảnh gốc trước khi chỉnh sửa

## 🛠️ Tools hữu ích

- **TinyPNG** - Nén hình ảnh: https://tinypng.com/
- **Squoosh** - Tối ưu hình ảnh: https://squoosh.app/
- **Remove.bg** - Xóa nền: https://www.remove.bg/
- **Canva** - Thiết kế banner: https://www.canva.com/
