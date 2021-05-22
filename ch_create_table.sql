CREATE TABLE zbx.history (
                          day  Date default now(),
                          itemid UInt64,
                          clock DateTime,
                          host String,
                          host_name String,
                          name String,
                          ns UInt32,
                          type UInt8,
                          value Float64
                         ) ENGINE = MergeTree()
PARTITION BY toYYYYMM(day)
ORDER BY (itemid, clock)
TTL day + INTERVAL 6 MONTH;

CREATE TABLE zbx.history_str (
                          day Date default now(),
                          itemid UInt64,
                          clock DateTime,
                          host String,
                          host_name String,
                          name String,
                          ns UInt32,
                          type UInt8,
                          value String
                         ) ENGINE = MergeTree()
PARTITION BY toYYYYMM(day)
ORDER BY (itemid, clock)
TTL day + INTERVAL 6 MONTH;
