import mysql.connector


class MYSQLConnector:

    def __init__(self):
        self.mydb = mysql.connector.connect(
            host="Localhost",
            user="root",
            password="em7admin",
            database="todo_data"
        )
        print(self.mydb)

    def execute_query(self, sql, param=None):
        cursor = self.mydb.cursor()
        cursor.execute(sql, param)
        result = cursor.fetchall()

        return result


if __name__ == '__main__':
    db = MYSQLConnector()
    name = ('projects_get_200', )
    query = "SELECT * FROM todo_data.input_data; where name = %s"
    res = db.execute_query(query, param=name)
    for i in res:
        print(i)
