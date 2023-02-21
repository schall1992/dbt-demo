with src_data as (
  select 
      certificate_id,
      {{ add_prefix('mgic_loan_id') }} mgic_loan_id,
      {{ add_prefix('policy_id') }} policy_id,
      {{ add_prefix('policy_type') }} policy_type,
      initial_premium_rate,
      initial_premium_rate_term_start,
      initial_premium_rate_term_end,
      first_renewal_premium_rate,
      first_renewal_premium_rate_term_start,
      first_renewal_premium_rate_term_end,
      second_renewal_premium_rate,
      second_renewal_premium_rate_term_start,
      second_renewal_premium_rate_term_end,
      third_renewal_premium_rate,
      third_renewal_premium_rate_term_start,
      third_renewal_premium_rate_term_end,
      fourth_renewal_premium_rate,
      fourth_renewal_premium_rate_term_start,
      fourth_renewal_premium_rate_term_end,
      event_date,
      ROW_NUMBER() over (partition by certificate_id order by event_date desc) rn
  from {{ source("policy_servicing", "policy_servicing_policy_attributes") }}

  {% if is_incremental() %}

    -- this filter will only be applied on an incremental run
    where event_date > (select max(event_date) from {{ this }})

  {% endif %}
)

select certificate_id,
  mgic_loan_id,
  policy_id,
  policy_type,
  initial_premium_rate,
  initial_premium_rate_term_start,
  initial_premium_rate_term_end,
  first_renewal_premium_rate,
  first_renewal_premium_rate_term_start,
  first_renewal_premium_rate_term_end,
  second_renewal_premium_rate,
  second_renewal_premium_rate_term_start,
  second_renewal_premium_rate_term_end,
  third_renewal_premium_rate,
  third_renewal_premium_rate_term_start,
  third_renewal_premium_rate_term_end,
  fourth_renewal_premium_rate,
  fourth_renewal_premium_rate_term_start,
  fourth_renewal_premium_rate_term_end,
  event_date
from src_data
where rn = 1