

from config.config import TOKEN_INFLUX


def get_influx():
    from influxdb_client import InfluxDBClient, Point
    from influxdb_client.client.write_api import SYNCHRONOUS
    bucket = "todo_bucket"
    client = InfluxDBClient("http://localhost:8086/", token=TOKEN_INFLUX, org="berserker")
    # write_api = client.write_api(write_options=SYNCHRONOUS)
    query_api = client.query_api()
    #
    # p = (Point("test_case_execution").tag("id_tc", "s1-t1")
    #      .tag("feature", "projects")
    #      .tag("test_case_name", "create project")
    #      .tag("status", "Failed")
    #      .field("duration", 5.6)
    #      )

    # write_api.write(bucket=bucket, record=p)
    tables = query_api.query('from(bucket:"todo_bucket") |> range(start: -1d)')

    for table in tables:
        print(table)
        for row in table.records:
            print(row.values)

    return client


if __name__ == '__main__':
    get_influx()
