# Hướng Dẫn Nâng Cao - AutoLux

Tài liệu này cung cấp thông tin chi tiết về kiến trúc code và các tính năng nâng cao.

## 🏗️ Kiến Trúc Code

### State Management
Project sử dụng object `AppState` để quản lý trạng thái toàn cục:

```javascript
const AppState = {
    cars: [],              // Danh sách xe gốc
    filteredCars: [],      // Danh sách xe sau khi filter
    currentPage: 1,        // Trang hiện tại
    itemsPerPage: 9,       // Số xe mỗi trang
    favorites: [],         // Danh sách yêu thích
    cart: [],             // Giỏ hàng
    compareList: [],      // Danh sách so sánh
    currentUser: null,    // User đang đăng nhập
    filters: {},          // Bộ lọc hiện tại
    sortBy: 'default'     // Cách sắp xếp
};
```

### Utility Functions

#### formatCurrency(amount)
Định dạng số thành tiền tệ VNĐ
```javascript
formatCurrency(1000000) // "1.000.000 ₫"
```

#### debounce(func, wait)
Trì hoãn thực thi function cho đến khi user ngừng typing
```javascript
const search = debounce((query) => {
    // Thực hiện search
}, 300);
```

#### throttle(func, limit)
Giới hạn số lần function được gọi trong khoảng thời gian
```javascript
const handleScroll = throttle(() => {
    // Xử lý scroll
}, 100);
```

#### storage helpers
Wrapper cho localStorage với error handling
```javascript
storage.get('key')      // Lấy dữ liệu
storage.set('key', val) // Lưu dữ liệu
storage.remove('key')   // Xóa dữ liệu
```

## 🎨 CSS Architecture

### CSS Variables
Tất cả màu sắc, spacing, font size được định nghĩa trong CSS variables:

```css
:root {
    --primary-color: #2563eb;
    --spacing-md: 1rem;
    --font-size-base: 1rem;
    --transition-base: 250ms ease;
}
```

### Dark Mode
Sử dụng attribute selector `[data-theme="dark"]`:

```css
[data-theme="dark"] {
    --bg-primary: #0f172a;
    --text-primary: #f1f5f9;
}
```

Toggle theme:
```javascript
document.documentElement.setAttribute('data-theme', 'dark');
```

### Responsive Breakpoints
```css
/* Desktop: > 1024px */
/* Tablet: 768px - 1024px */
@media (max-width: 1024px) { }

/* Mobile: < 768px */
@media (max-width: 768px) { }

/* Small Mobile: < 480px */
@media (max-width: 480px) { }
```

## 🔧 Chức Năng Chi Tiết

### 1. Filter & Search System

#### Real-time Search
```javascript
// Debounce để tránh search quá nhiều lần
document.getElementById('search-input').addEventListener('input', 
    debounce((e) => {
        AppState.filters.search = e.target.value;
        applyFilters();
    }, 300)
);
```

#### Multi-criteria Filtering
```javascript
const applyFilters = () => {
    let filtered = [...AppState.cars];
    
    // Search filter
    if (AppState.filters.search) {
        filtered = filtered.filter(car => 
            car.name.toLowerCase().includes(searchLower)
        );
    }
    
    // Brand filter
    if (AppState.filters.brand) {
        filtered = filtered.filter(car => 
            car.brand === AppState.filters.brand
        );
    }
    
    // ... các filter khác
};
```

### 2. Pagination System

```javascript
const renderPagination = () => {
    const totalPages = Math.ceil(
        AppState.filteredCars.length / AppState.itemsPerPage
    );
    
    // Hiển thị: [Prev] 1 ... 4 5 6 ... 10 [Next]
    // Logic: Luôn hiển thị trang đầu, cuối và 2 trang xung quanh trang hiện tại
};
```

### 3. Lazy Loading Images

```javascript
// Sử dụng Intersection Observer API
const imageObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const img = entry.target;
            img.src = img.dataset.src;
            observer.unobserve(img);
        }
    });
});
```

### 4. Animated Counters

```javascript
const animateCounter = (element, target, duration = 2000) => {
    const increment = target / (duration / 16);
    let current = 0;
    
    const timer = setInterval(() => {
        current += increment;
        if (current >= target) {
            element.textContent = Math.floor(target);
            clearInterval(timer);
        } else {
            element.textContent = Math.floor(current);
        }
    }, 16); // 60fps
};
```

### 5. Modal System

```javascript
// Mở modal
const openModal = (modalId) => {
    const modal = document.getElementById(modalId);
    modal.classList.add('active');
    document.body.style.overflow = 'hidden'; // Prevent scroll
};

// Đóng modal khi click outside
document.addEventListener('click', (e) => {
    if (e.target.classList.contains('modal')) {
        closeModal(e.target.id);
    }
});

// Đóng modal khi nhấn Escape
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        // Đóng tất cả modal đang mở
    }
});
```

### 6. Gallery with Keyboard Navigation

```javascript
// Arrow keys để navigate
document.addEventListener('keydown', (e) => {
    if (galleryModal.classList.contains('active')) {
        if (e.key === 'ArrowLeft') navigateGallery(-1);
        if (e.key === 'ArrowRight') navigateGallery(1);
    }
});

// Touch swipe support (có thể thêm)
let touchStartX = 0;
element.addEventListener('touchstart', (e) => {
    touchStartX = e.touches[0].clientX;
});
element.addEventListener('touchend', (e) => {
    const touchEndX = e.changedTouches[0].clientX;
    if (touchStartX - touchEndX > 50) navigateGallery(1);
    if (touchEndX - touchStartX > 50) navigateGallery(-1);
});
```

### 7. Loan Calculator

Công thức tính trả góp:
```javascript
// M = P * [r(1+r)^n] / [(1+r)^n - 1]
// M: Monthly payment
// P: Principal (loan amount)
// r: Monthly interest rate
// n: Number of months

const monthlyPayment = loanAmount * 
    (monthlyRate * Math.pow(1 + monthlyRate, term)) / 
    (Math.pow(1 + monthlyRate, term) - 1);
```

## 🎯 Performance Optimization

### 1. Debounce Search
Giảm số lần gọi API/filter khi user typing:
```javascript
// Thay vì gọi mỗi keystroke (100+ lần)
// Chỉ gọi sau khi user ngừng typing 300ms
```

### 2. Throttle Scroll
Giới hạn số lần xử lý scroll event:
```javascript
// Thay vì gọi mỗi pixel scroll (1000+ lần)
// Chỉ gọi mỗi 100ms
```

### 3. Lazy Loading
Chỉ load hình ảnh khi cần thiết:
```javascript
// Hình ảnh ngoài viewport không được load
// Tiết kiệm bandwidth và tăng tốc độ load trang
```

### 4. CSS Animations
Sử dụng transform và opacity cho smooth animations:
```css
/* Good - GPU accelerated */
.element {
    transform: translateY(10px);
    opacity: 0.5;
}

/* Bad - causes reflow */
.element {
    top: 10px;
    visibility: hidden;
}
```

## 🔐 Security Best Practices

### 1. XSS Prevention
```javascript
// Sử dụng textContent thay vì innerHTML khi có thể
element.textContent = userInput;

// Nếu cần innerHTML, sanitize input
const sanitize = (str) => {
    const div = document.createElement('div');
    div.textContent = str;
    return div.innerHTML;
};
```

### 2. Input Validation
```javascript
// Validate tất cả input từ user
const validateEmail = (email) => {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
};

const validatePhone = (phone) => {
    return /^[0-9]{10}$/.test(phone);
};
```

### 3. LocalStorage Security
```javascript
// Không lưu sensitive data trong localStorage
// Không lưu password, credit card, etc.
// LocalStorage có thể bị XSS attack đọc được
```

## 🧪 Testing Tips

### Manual Testing Checklist
- [ ] Test trên Chrome, Firefox, Safari, Edge
- [ ] Test responsive trên mobile, tablet
- [ ] Test dark/light mode
- [ ] Test tất cả forms với valid/invalid data
- [ ] Test pagination với nhiều/ít items
- [ ] Test filter combinations
- [ ] Test localStorage (clear và reload)
- [ ] Test keyboard navigation
- [ ] Test với slow network (throttle trong DevTools)

### Console Debugging
```javascript
// Log state changes
console.log('Current state:', AppState);

// Log filter results
console.log('Filtered cars:', AppState.filteredCars.length);

// Performance timing
console.time('renderCars');
renderCars();
console.timeEnd('renderCars');
```

## 🚀 Deployment

### 1. Hosting tĩnh (Static Hosting)
- **Netlify**: Drag & drop folder
- **Vercel**: Connect GitHub repo
- **GitHub Pages**: Push to gh-pages branch
- **Firebase Hosting**: `firebase deploy`

### 2. Optimization trước khi deploy
```bash
# Minify CSS
# Minify JavaScript
# Optimize images
# Enable gzip compression
```

### 3. CDN cho assets
```html
<!-- Sử dụng CDN cho fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

## 📚 Học Thêm

### JavaScript Concepts
- Promises & Async/Await
- Event Delegation
- Closures & Scope
- Array Methods (map, filter, reduce)
- ES6+ Features

### CSS Concepts
- Flexbox & Grid
- CSS Variables
- Animations & Transitions
- Media Queries
- BEM Methodology

### Web APIs
- Fetch API
- LocalStorage API
- Intersection Observer
- History API
- Geolocation API

## 🔄 Roadmap Tương Lai

### Phase 1: Backend Integration
- [ ] Node.js + Express API
- [ ] MongoDB database
- [ ] JWT authentication
- [ ] File upload cho hình ảnh

### Phase 2: Advanced Features
- [ ] Real-time chat support
- [ ] Email notifications
- [ ] SMS OTP verification
- [ ] Payment gateway integration

### Phase 3: Admin Panel
- [ ] CRUD operations cho xe
- [ ] Order management
- [ ] User management
- [ ] Analytics dashboard

### Phase 4: Mobile App
- [ ] React Native app
- [ ] Push notifications
- [ ] Offline support
- [ ] Camera integration

---

**Happy Coding! 💻**
