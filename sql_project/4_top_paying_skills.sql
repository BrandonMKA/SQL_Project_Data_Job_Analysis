/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Engineer positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Engineers and 
    helps identify the most financially rewarding skills to aquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer' 
    AND salary_year_avg IS NOT NULL
    AND (job_work_from_home = true OR job_location = 'New York, NY')
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25