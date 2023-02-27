# 파이썬에서 MySQL 접근 
import pymysql

# localhost 자기자신 ip (127.0.0.1)
conn = pymysql.connect(host ='localhost', user='root', password ='12345', 
                       db='homeplus', charset ='UTF8')

cur = conn.cursor()
sql='SELECT * FROM membertbl'
cur.execute(sql)

rows = cur.fetchall()
print(rows)

conn.close()     # db는 반드시 접속 후 닫아줘야함(필수!!)
