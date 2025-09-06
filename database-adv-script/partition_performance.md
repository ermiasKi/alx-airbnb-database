### EXPLAIN ANALYZE
The most powerful tool for query performance analysis in PostgreSQL.

**Basic Usage:Partisioning**
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date > '2024-01-01';
```

### for mysql

```sql
-- Enable profiling
SET profiling = 1;

-- Run your query
SELECT * FROM Booking WHERE start_date > '2024-01-01';