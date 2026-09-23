with waiting_time as (select ticket_id, DATEDIFF(date_resolved, date_opened) AS days_to_resolve,satisfaction_score
from support_tickets)
,ticket_tiers as (select ticket_id,days_to_resolve,satisfaction_score,
ntile(5) over(order by days_to_resolve)as top_5_rank
from waiting_time)

select count(ticket_id)as num_of_tickets,round(avg(days_to_resolve),1) as avg_days_to_resolve,round(avg(satisfaction_score),1)as avg_satisfaction,top_5_rank
from ticket_tiers
group by top_5_rank