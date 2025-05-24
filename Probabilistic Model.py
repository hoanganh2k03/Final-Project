import mysql.connector
from mysql.connector import Error
import time
from rank_bm25 import BM25Okapi

try:
    conn = mysql.connector.connect(host="localhost", user="root", password="", database="multimedia")
    cursor = conn.cursor()
    print("Kết nối MySQL thành công!")
except Error as e:
    print(f"Lỗi kết nối: {e}")
    exit()

query = "Olympic 2020"
cursor.execute("SELECT id, title, content FROM documents")
docs = cursor.fetchall()

if not docs:
    print("Không có dữ liệu trong bảng documents!")
else:
    print(f"Tìm thấy {len(docs)} tài liệu.")
    print(f"Truy vấn: {query}")
    start_time = time.perf_counter()
    doc_ids, doc_titles, doc_texts = [], [], []
    for doc in docs:
        doc_id, title, file_path = doc
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                content = f.read()
            # Ghép title và content thành một chuỗi duy nhất
            combined_text = title + " " + content
            doc_ids.append(doc_id)
            doc_titles.append(title)
            doc_texts.append(combined_text)
        except FileNotFoundError:
            print(f"Không tìm thấy file {file_path} cho tài liệu ID {doc_id}")
            continue

    if not doc_texts:
        print("Không có nội dung tài liệu nào để xử lý!")
    else:
        # Tách từ cho BM25
        tokenized_docs = [doc.lower().split() for doc in doc_texts]
        bm25 = BM25Okapi(tokenized_docs)
        tokenized_query = query.lower().split()
        scores = bm25.get_scores(tokenized_query)
        results = sorted([(doc_ids[i], doc_titles[i], score) for i, score in enumerate(scores)], key=lambda x: x[2], reverse=True)
        top_10 = results[:10]
        print("\nKết quả Probabilistic Model (Top 10):")
        if top_10:
            for doc_id, title, score in top_10:
                print(f"- ID: {doc_id}, Tiêu đề: {title}, Điểm: {score:.4f}")
        else:
            print("Không tìm thấy tài liệu nào khớp với truy vấn!")
    end_time = time.perf_counter()
    latency = end_time - start_time
    print(f"Thời gian xử lý: {latency:.4f} giây")

conn.close()