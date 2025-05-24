import mysql.connector
from mysql.connector import Error
import time

try:
    conn = mysql.connector.connect(host="localhost", user="root", password="", database="multimedia")
    cursor = conn.cursor()
    print("Kết nối MySQL thành công!")
except Error as e:
    print(f"Lỗi kết nối: {e}")
    exit()

query = "Olympic 2020"
terms = []
operator = None
if " AND " in query:
    terms = query.split(" AND ")
    operator = "AND"
elif " OR " in query:
    terms = query.split(" OR ")
    operator = "OR"
else:
    terms = [query]
terms = [term.strip() for term in terms]

cursor.execute("SELECT id, title, content FROM documents")
docs = cursor.fetchall()

if not docs:
    print("Không có dữ liệu trong bảng documents!")
else:
    print(f"Tìm thấy {len(docs)} tài liệu.")
    print(f"Truy vấn: {query}")
    start_time = time.perf_counter()
    results = []
    for doc in docs:
        doc_id, title, file_path = doc
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                content = f.read()
        except FileNotFoundError:
            print(f"Không tìm thấy file {file_path} cho tài liệu ID {doc_id}")
            continue
        # Ghép title và content thành một chuỗi duy nhất
        combined_text = title + " " + content
        # Chuyển chuỗi kết hợp về chữ thường để tìm kiếm không phân biệt hoa thường
        combined_text_lower = combined_text.lower()
        terms_lower = [term.lower() for term in terms]

        # Kiểm tra truy vấn trên chuỗi kết hợp
        if operator == "AND":
            # Với AND: Chuỗi kết hợp phải chứa tất cả các term
            if all(term in combined_text_lower for term in terms_lower):
                results.append((doc_id, title))
        elif operator == "OR":
            # Với OR: Chuỗi kết hợp chỉ cần chứa ít nhất một term
            if any(term in combined_text_lower for term in terms_lower):
                results.append((doc_id, title))
        else:
            # Trường hợp không có toán tử: Tìm kiếm term duy nhất trong chuỗi kết hợp
            term = terms_lower[0]
            if term in combined_text_lower:
                results.append((doc_id, title))

    top_10 = results[:10]
    print("\nKết quả Boolean Model (Top 10):")
    if top_10:
        for doc_id, title in top_10:
            print(f"- ID: {doc_id}, Tiêu đề: {title}")
    else:
        print("Không tìm thấy tài liệu nào khớp với truy vấn!")
    end_time = time.perf_counter()
    latency = end_time - start_time
    print(f"Thời gian xử lý: {latency:.4f} giây")

conn.close()