# CỔNG BÀI TẬP VÀ ÔN LUYỆN (TOÁN & TIẾNG ANH)

Hệ thống trang HTML tĩnh giúp học sinh truy cập giải bài tập và giáo viên cập nhật bài tập mới một cách nhanh chóng, tự động.

---

## 📂 Cấu trúc thư mục

```text
HomeWork/
├── index.html                   # Trang chủ hiển thị danh sách bài tập (Portal)
├── data.js                      # Danh sách dữ liệu bài tập (Tự động cập nhật)
├── cap-nhat-danh-sach.bat       # Nhấp đúp chuột vào file này để quét bài tập mới
├── update-list.ps1              # Script PowerShell quét tự động
│
├── toan/                        # Thư mục chứa các file bài tập môn Toán (.html)
│   ├── bai-tap-so-nguyen.html
│   └── bai-13-tap-hop-so-nguyen.html
│
└── tieng-anh/                   # Thư mục chứa các file bài tập Tiếng Anh (.html)
    ├── unit-1-my-new-school.html
    └── thi-hien-tai-don-va-tiep-dien.html
```

---

## 🚀 Cách sử dụng

### 1. Dành cho Học sinh:
- Chỉ cần nhấp đúp mở file `index.html` bằng trình duyệt bất kỳ (Chrome, Cốc Cốc, Edge...).
- Chọn tab **Toán học** hoặc **Tiếng Anh**, hoặc gõ vào ô **Tìm kiếm bài tập**.
### 2. Dành cho Thầy/Cô khi cập nhật bài tập mới:
Khi bạn có thêm một file bài tập HTML mới:
1. Đặt file vào thư mục môn tương ứng:
   - Nếu là Toán: copy file vào thư mục `toan/`
   - Nếu là Tiếng Anh: copy file vào thư mục `tieng-anh/`
2. **Nhấp đúp chuột vào file `cap-nhat-danh-sach.bat`**.
3. **Xong!** Mở lại hoặc bấm F5 (Refresh) trang `index.html`, bài tập mới sẽ lập tức xuất hiện trên trang chủ cùng đường link dẫn tới bài tập đó.

*(Lưu ý: Tiêu đề bài tập trên trang chủ sẽ tự động lấy theo thẻ `<title>Tên bài tập</title>` trong file HTML của bạn).*

### 3. Sổ Tay Từ Vựng & Tạo Bài Tập Tự Động (IndexedDB):
- Bấm vào nút **"📖 Sổ Từ Vựng & Tạo Bài Tập"** trên trang chủ hoặc mở file `so-tay-tu-vung.html`.
- **Trong giờ dạy:** Nhập từ tiếng Anh, loại từ, nghĩa tiếng Việt, câu ví dụ -> Bấm Enter hoặc nút Thêm. Dữ liệu tự động lưu tức thì vào **IndexedDB** của trình duyệt (hoạt động 100% trên GitHub Pages).
- **Làm bài tập trực tiếp:** Bấm tab **"🎯 Làm Bài Tập Trắc Nghiệm"** hoặc **"🃏 Flashcard Lật Thẻ"** để học sinh tự kiểm tra từ vựng ngay trong trang.
- **Cuối giờ dạy:**
  + Bấm **"📄 Xuất file TXT"**: Xuất file dạng văn bản dễ đọc gửi vào Zalo cho học sinh/phụ huynh.
  + Bấm **"📦 Xuất file JSON"**: Sao lưu dữ liệu hoặc mang sang máy tính khác (dùng nút "📥 Nạp JSON" để tải lại).
  + Bấm **"🚀 Tạo bài tập HTML tự động"**: Hệ thống tự động sinh ra 1 file HTML bài tập trắc nghiệm hoàn chỉnh. Bạn chỉ việc bỏ file vừa tải vào thư mục `tieng-anh/` và nhấp đúp `cap-nhat-danh-sach.bat` là học sinh có ngay bài tập mới!