import mysql.connector
from mysql.connector import Error
import time
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.decomposition import TruncatedSVD
from sklearn.metrics.pairwise import cosine_similarity

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
        vectorizer = TfidfVectorizer()
        tfidf_matrix = vectorizer.fit_transform(doc_texts)
        lsi = TruncatedSVD(n_components=10)
        doc_lsi = lsi.fit_transform(tfidf_matrix)
        query_vector = vectorizer.transform([query])
        query_lsi = lsi.transform(query_vector)
        scores = cosine_similarity(query_lsi, doc_lsi).flatten()
        results = sorted([(doc_ids[i], doc_titles[i], score) for i, score in enumerate(scores)], key=lambda x: x[2], reverse=True)
        top_10 = results[:10]  # Đồng bộ với pseudocode
        print("\nKết quả LSI (Top 10):")
        if top_10:
            for doc_id, title, score in top_10:
                print(f"- ID: {doc_id}, Tiêu đề: {title}, Độ tương đồng: {score:.4f}")
        else:
            print("Không tìm thấy tài liệu nào khớp với truy vấn!")
    end_time = time.perf_counter()
    latency = end_time - start_time
    print(f"Thời gian xử lý: {latency:.4f} giây")

conn.close()