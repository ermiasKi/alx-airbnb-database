-- partitioning.sql

-- 1. First, create a new partitioned table structure
CREATE TABLE Booking_partitioned (
    booking_id UUID,
    property_id UUID,
    user_id UUID,
    start_date DATE,
    end_date DATE,
    total_price DECIMAL,
    status VARCHAR(20),
    created_at TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for different date ranges
-- Example: yearly partitions for 2020-2025

CREATE TABLE booking_y2020 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');

CREATE TABLE booking_y2021 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');

CREATE TABLE booking_y2022 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE booking_y2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_y2024 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_y2025 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE booking_future PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2026-01-01') TO (MAXVALUE);

-- 3. Copy data from original table to partitioned table
INSERT INTO Booking_partitioned 
SELECT * FROM Booking;

-- 4. Optional: Rename tables to switch to partitioned version
-- ALTER TABLE Booking RENAME TO Booking_old;
-- ALTER TABLE Booking_partitioned RENAME TO Booking;

-- 5. Create indexes on the partitioned table
CREATE INDEX idx_booking_partitioned_user_id ON Booking_partitioned(user_id);
CREATE INDEX idx_booking_partitioned_property_id ON Booking_partitioned(property_id);
CREATE INDEX idx_booking_partitioned_created_at ON Booking_partitioned(created_at);
CREATE INDEX idx_booking_partitioned_date_range ON Booking_partitioned(start_date, end_date);

-- 6. Test queries on the partitioned table

-- Query 1: Fetch bookings for a specific date range (should use partition pruning)
EXPLAIN ANALYZE
SELECT * FROM Booking_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Query 2: Count bookings by month in 2024
EXPLAIN ANALYZE
SELECT 
    EXTRACT(MONTH FROM start_date) as month,
    COUNT(*) as booking_count
FROM Booking_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY EXTRACT(MONTH FROM start_date)
ORDER BY month;

-- Query 3: Complex join with partitioned table
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name as property_name
FROM Booking_partitioned b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2024-06-01' AND '2024-08-31'
ORDER BY b.start_date;

-- Query 4: Compare with original table (if still available)
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

-- 7. Performance comparison function
CREATE OR REPLACE FUNCTION test_partition_performance()
RETURNS TABLE (query_name TEXT, execution_time INTERVAL) AS $$
BEGIN
    -- Test partitioned table
    RETURN QUERY EXECUTE '
        SELECT ''Partitioned Table'' as query_name, 
               (EXPLAIN ANALYZE SELECT * FROM Booking_partitioned 
                WHERE start_date BETWEEN ''2024-01-01'' AND ''2024-12-31'').*'
        INTO query_name, execution_time;
    
    -- Test original table (if exists)
    RETURN QUERY EXECUTE '
        SELECT ''Original Table'' as query_name,
               (EXPLAIN ANALYZE SELECT * FROM Booking 
                WHERE start_date BETWEEN ''2024-01-01'' AND ''2024-12-31'').*'
        INTO query_name, execution_time;
END;
$$ LANGUAGE plpgsql;

-- 8. Run performance test
SELECT * FROM test_partition_performance();

-- 9. Monitor partition usage
SELECT 
    schemaname,
    relname,
    n_live_tup,
    n_dead_tup
FROM pg_stat_user_tables
WHERE relname LIKE 'booking_%'
ORDER BY relname;

-- 10. Example of partition maintenance: Adding a new partition for 2026
CREATE TABLE booking_y2026 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01'