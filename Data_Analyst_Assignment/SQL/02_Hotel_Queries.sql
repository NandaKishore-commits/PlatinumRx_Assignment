#Query 1
SELECT user_id, room_no
FROM bookings b1
WHERE booking_date = (
    SELECT MAX(b2.booking_date)
    FROM bookings b2
    WHERE b1.user_id = b2.user_id
);

#Query 2
SELECT 
    bc.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
JOIN bookings b ON bc.booking_id = b.booking_id
WHERE strftime('%Y-%m', b.booking_date) = '2021-11'
GROUP BY bc.booking_id;

#Query 3
SELECT 
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', bc.bill_date) = '2021-10'
GROUP BY bc.bill_id
HAVING total_amount > 1000;

#Query 4
WITH item_counts AS (
    SELECT 
        strftime('%Y-%m', bill_date) AS month,
        item_id,
        SUM(item_quantity) AS total_qty
    FROM booking_commercials
    WHERE strftime('%Y', bill_date) = '2021'
    GROUP BY month, item_id
),
ranked AS (
    SELECT *,
        RANK() OVER (PARTITION BY month ORDER BY total_qty DESC) AS max_rank,
        RANK() OVER (PARTITION BY month ORDER BY total_qty ASC) AS min_rank
    FROM item_counts
)
SELECT *
FROM ranked
WHERE max_rank = 1 OR min_rank = 1;

#Query 5
WITH bill_totals AS (
    SELECT 
        bill_id,
        strftime('%Y-%m', bill_date) AS month,
        SUM(item_quantity * item_rate) AS total_amount
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE strftime('%Y', bill_date) = '2021'
    GROUP BY bill_id, month
),
ranked AS (
    SELECT *,
        RANK() OVER (PARTITION BY month ORDER BY total_amount DESC) AS rnk
    FROM bill_totals
)
SELECT *
FROM ranked
WHERE rnk = 2;
