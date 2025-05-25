# Báo Cáo Về Xây Dựng Hệ Thống Tìm Kiếm Văn Bản

Đồ án cuối kỳ xây dựng hệ thống tìm kiếm văn bản sử dụng bốn phương pháp truy xuất thông tin: **Boolean Model**, **Vector Space Model (VSM)**, **Probabilistic Model (Okapi BM25)**, và **Latent Semantic Indexing (LSI)**. Hệ thống được thử nghiệm trên tập dữ liệu gồm 100 tài liệu thể thao được lưu trong cơ sở dữ liệu tên là 'multimedia' và có content là đường dẫn đến các file trong thư mục `sports_docs`.

## Thông Tin Sinh Viên Thực Hiện
- **Họ và tên**: Vũ Quốc Hoàng Anh
- **Mã số sinh viên**: N21DCCN101 - D21CQCNHT01-N
- **Trường**: Khoa Công nghệ Thông tin, Học viện Công nghệ Bưu chính Viễn thông cơ sở tại TP.HCM
- **Email**: vuquochoanganh2k3@gmail.com

## Thông Tin Đề Bài
**Tên đề tài**: Xây dựng hệ thống tìm kiếm văn bản sử dụng các phương pháp truy xuất thông tin.

**Yêu cầu**:
- Triển khai bốn phương pháp: Boolean Model, VSM, Okapi BM25, và LSI.
- Thử nghiệm trên tập dữ liệu 100 tài liệu thể thao (file `.txt` trong `sports_docs`).
- Sử dụng MySQL để quản lý thông tin tài liệu (ID, tiêu đề, đường dẫn).
- Đánh giá dựa trên độ liên quan, khả năng xếp hạng, và tính linh hoạt (xử lý ngữ nghĩa).
- Cung cấp mã nguồn Python và báo cáo chi tiết.

**Mục tiêu**:
- So sánh hiệu suất các phương pháp.
- Đảm bảo kết quả phù hợp với truy vấn (ví dụ: "Olympic 2020") và thời gian xử lý nhanh.

## Mô Tả Chi Tiết Bài Đã Làm
Hệ thống tìm kiếm văn bản được xây dựng bằng Python, sử dụng các thư viện `mysql-connector-python`, `scikit-learn`, và `rank-bm25`. Dưới đây là chi tiết:

### 1. **Tập Dữ Liệu**
- **Nguồn**: 100 tài liệu thể thao (bóng đá, bóng rổ, Olympic, v.v.) trong thư mục `sports_docs`.
- **Cơ sở dữ liệu**: MySQL (database `multimedia`, bảng `documents`) lưu ID, tiêu đề, và đường dẫn file.
- **Ví dụ**:
  - ID 1: "Điền kinh Olympic 2020: Sự thống trị của Usain Bolt" (`sports_docs/doc_1.txt`)
  - ID 2: "Olympic 2024: Những khoảnh khắc đáng nhớ tại Paris" (`sports_docs/doc_2.txt`)

### 2. **Các Phương Pháp**
#### a. **Boolean Model** (`BooleanModel.py`)
- **Mô tả**: Trả về tài liệu khớp chính xác truy vấn (AND, OR, NOT), không xếp hạng.
- **Triển khai**: Kết nối MySQL, ghép tiêu đề và nội dung, kiểm tra từ khóa.

#### b. **Vector Space Model** (`Vector Space Model.py`)
- **Mô tả**: Biểu diễn tài liệu/truy vấn bằng vector TF-IDF, xếp hạng bằng cosine similarity.
- **Triển khai**: Sử dụng `TfidfVectorizer`.

#### c. **Okapi BM25** (`Probabilistic Model.py`)
- **Mô tả**: Xếp hạng dựa trên tần suất từ và độ dài tài liệu.
- **Triển khai**: Sử dụng `rank-bm25`.

#### d. **Latent Semantic Indexing** (`Latent Semantic Indexing.py`)
- **Mô tả**: Giảm chiều ma trận TF-IDF bằng SVD, xử lý ngữ nghĩa.
- **Triển khai**: Sử dụng `TruncatedSVD` với `n_components=10`.

### 4. **Đánh Giá**
- **Boolean**: Chính xác cao, không xếp hạng.
- **VSM**: Xếp hạng tốt, hạn chế ngữ nghĩa.
- **BM25**: Hiệu quả nhất, cân bằng tốt.
- **LSI**: Xử lý ngữ nghĩa tốt, thời gian lâu.

# Hướng Dẫn Cài Đặt
### Yêu Cầu
- **Python**: 3.8+.
- **MySQL**: 8.0+.
- **Thư viện**: `mysql-connector-python`, `scikit-learn`, `rank-bm25`, `numpy`.
### Các Bước
1. **Cài Python**: Tải từ [python.org](https://www.python.org/downloads/).
2. **Clone Repository**
3. **Cài MySQL**:
   - Tải từ [mysql.com](https://dev.mysql.com/downloads/).
   - Tạo database và bảng: dùng file data.sql nằm trong github
4. **Cài phần mềm có thể chạy được Python**
5. **Cài thư viện**:
   ```bash
   pip install mysql-connector-python scikit-learn rank-bm25 numpy
   ```
## Hướng Dẫn Chạy Chương Trình
1. **Khởi động MySQL**: Đảm bảo server chạy và database `multimedia` sẵn sàng.
2. **Chạy mã nguồn**:
   ```bash
   cd path/to/project
   python BooleanModel.py
   python Vector Space Model.py
   python Probabilistic Model.py
   python Latent Semantic Indexing.py
   ```
3. **Thay đổi truy vấn**: Chỉnh sửa biến `query` trong file (mặc định: `"Olympic 2020"`).

## Ví Dụ Inputs và Outputs
### Input
- **Truy vấn**: `"Olympic 2020"`
### Output
#### Boolean Model
Kết nối MySQL thành công!
Tìm thấy 100 tài liệu.
Truy vấn: Olympic 2020

Kết quả Boolean Model (Top 10):
- ID: 1, Tiêu đề: Điền kinh Olympic 2020: Sự thống trị của Usain Bolt
- ID: 3, Tiêu đề: Bóng rổ Olympic 2020: Mỹ tiếp tục thống trị
- ID: 50, Tiêu đề: Triathlon: Alistair Brownlee tại Olympic 2020
- ID: 66, Tiêu đề: Đua xe đạp lòng chảo: Anh tại Olympic 2020
- ID: 83, Tiêu đề: Bơi lội đường dài: Florian Wellbrock tại Olympic 2020
- ID: 95, Tiêu đề: Bóng chuyền nam: Pháp tại Olympic 2020
Thời gian xử lý: 0.0183 giây

#### Vector Space Model

Truy vấn: Olympic 2020

Kết quả Vector Space Model (Top 10):
- ID: 3, Tiêu đề: Bóng rổ Olympic 2020: Mỹ tiếp tục thống trị, Độ tương đồng: 0.4297
- ID: 1, Tiêu đề: Điền kinh Olympic 2020: Sự thống trị của Usain Bolt, Độ tương đồng: 0.3996
- ID: 95, Tiêu đề: Bóng chuyền nam: Pháp tại Olympic 2020, Độ tương đồng: 0.3716
- ID: 50, Tiêu đề: Triathlon: Alistair Brownlee tại Olympic 2020, Độ tương đồng: 0.3051
- ID: 83, Tiêu đề: Bơi lội đường dài: Florian Wellbrock tại Olympic 2020, Độ tương đồng: 0.2920
- ID: 2, Tiêu đề: Olympic 2024: Những khoảnh khắc đáng nhớ tại Paris, Độ tương đồng: 0.1832
- ID: 66, Tiêu đề: Đua xe đạp lòng chảo: Anh tại Olympic 2020, Độ tương đồng: 0.1743
- ID: 7, Tiêu đề: Bơi lội: Kỷ lục của Leon Marchand tại Olympic 2024, Độ tương đồng: 0.1555
- ID: 25, Tiêu đề: Karate: Nhật Bản tại Olympic 2024, Độ tương đồng: 0.1278
- ID: 28, Tiêu đề: Cưỡi ngựa: Đức tại Olympic 2024, Độ tương đồng: 0.1227
Thời gian xử lý: 0.0284 giây

#### Okapi BM25

Truy vấn: Olympic 2020

Kết quả Probabilistic Model (Top 10):
- ID: 50, Tiêu đề: Triathlon: Alistair Brownlee tại Olympic 2020, Điểm: 6.6218
- ID: 95, Tiêu đề: Bóng chuyền nam: Pháp tại Olympic 2020, Điểm: 6.5775
- ID: 83, Tiêu đề: Bơi lội đường dài: Florian Wellbrock tại Olympic 2020, Điểm: 6.2835
- ID: 3, Tiêu đề: Bóng rổ Olympic 2020: Mỹ tiếp tục thống trị, Điểm: 6.0285
- ID: 1, Tiêu đề: Điền kinh Olympic 2020: Sự thống trị của Usain Bolt, Điểm: 5.7881
- ID: 66, Tiêu đề: Đua xe đạp lòng chảo: Anh tại Olympic 2020, Điểm: 4.6540
- ID: 2, Tiêu đề: Olympic 2024: Những khoảnh khắc đáng nhớ tại Paris, Điểm: 2.9326
- ID: 7, Tiêu đề: Bơi lội: Kỷ lục của Leon Marchand tại Olympic 2024, Điểm: 2.6555
- ID: 25, Tiêu đề: Karate: Nhật Bản tại Olympic 2024, Điểm: 2.5448
- ID: 26, Tiêu đề: Bắn súng: Trung Quốc tại Olympic 2024, Điểm: 2.5115
Thời gian xử lý: 0.0222 giây

#### LSI

Truy vấn: Olympic 2020

Kết quả LSI (Top 10):
- ID: 50, Tiêu đề: Triathlon: Alistair Brownlee tại Olympic 2020, Độ tương đồng: 0.9455
- ID: 83, Tiêu đề: Bơi lội đường dài: Florian Wellbrock tại Olympic 2020, Độ tương đồng: 0.9071
- ID: 1, Tiêu đề: Điền kinh Olympic 2020: Sự thống trị của Usain Bolt, Độ tương đồng: 0.7911
- ID: 2, Tiêu đề: Olympic 2024: Những khoảnh khắc đáng nhớ tại Paris, Độ tương đồng: 0.7826
- ID: 7, Tiêu đề: Bơi lội: Kỷ lục của Leon Marchand tại Olympic 2024, Độ tương đồng: 0.7652
- ID: 3, Tiêu đề: Bóng rổ Olympic 2020: Mỹ tiếp tục thống trị, Độ tương đồng: 0.7239
- ID: 25, Tiêu đề: Karate: Nhật Bản tại Olympic 2024, Độ tương đồng: 0.6545
- ID: 39, Tiêu đề: Curling: Thụy Điển tại Olympic Đông 2022, Độ tương đồng: 0.6323
- ID: 95, Tiêu đề: Bóng chuyền nam: Pháp tại Olympic 2020, Độ tương đồng: 0.6318
- ID: 24, Tiêu đề: Taekwondo: Hàn Quốc tại Olympic 2024, Độ tương đồng: 0.5688
Thời gian xử lý: 0.0823 giây

## Lưu Ý
- Đảm bảo thư mục `sports_docs` chứa 100 file `.txt` và bảng `documents` được cập nhật.
- Kiểm tra thông tin kết nối MySQL (`host`, `user`, `password`) nếu gặp lỗi.
- Thời gian xử lý của 4 mô hình có thể khác do đường truyền mạng,...