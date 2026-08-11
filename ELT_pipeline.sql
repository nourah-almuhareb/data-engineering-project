-- Data Engineering Project: YouTube Data ETL/ELT
-- Cleaned from the SQL queries available in the project history.
-- Preview/test SELECT statements and repeated older versions were removed.

-- ============================================================
-- 1. Remove duplicate YouTube records
-- ============================================================

DROP TABLE IF EXISTS final_usvideos;

CREATE TABLE final_usvideos AS
SELECT DISTINCT *
FROM stage_usvideos;


-- ============================================================
-- 2. Create the final YouTube data table
--    Join video data with category information and calculate
--    engagement and comment rates.
-- ============================================================

DROP TABLE IF EXISTS final_youtube_data;

CREATE TABLE final_youtube_data AS
SELECT DISTINCT
    v.video_id,
    v.title,
    v.channel_title,
    v.category_id,
    COALESCE(c.category_name, 'Unknown') AS category_name,
    COALESCE(c.category_type, 'Unknown') AS category_type,
    v.views,
    v.likes,
    v.dislikes,
    v.comment_count,
    ROUND((v.likes::numeric / v.views), 4) AS engagement_rate,
    ROUND((v.comment_count::numeric / v.views), 4) AS comment_rate
FROM stage_usvideos v
LEFT JOIN stage_categories c
    ON v.category_id = c.category_id
WHERE
    v.video_id IS NOT NULL
    AND v.title IS NOT NULL
    AND v.channel_title IS NOT NULL
    AND v.views > 0;


-- ============================================================
-- 3. Create category-level summary
-- ============================================================

DROP TABLE IF EXISTS final_category_summary;

CREATE TABLE final_category_summary AS
SELECT
    category_name,
    category_type,
    COUNT(video_id) AS total_videos,
    SUM(views) AS total_views,
    SUM(likes) AS total_likes,
    SUM(comment_count) AS total_comments,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement_rate,
    ROUND(AVG(comment_rate), 4) AS avg_comment_rate
FROM final_youtube_data
GROUP BY
    category_name,
    category_type
ORDER BY total_views DESC;
