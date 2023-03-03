{% macro l2_model(source_name, source_table, primary_key, cols=[]) -%}

with src_data as (
  select 
      {{ primary_key }},
      {{ cols|join(', ') }},
      event_date,
      ROW_NUMBER() over (partition by {{ primary_key }} order by event_date desc) rn
  from {{ source(source_name, source_table) }}

  {% if is_incremental() %}

    where event_date > (select max(event_date) from {{ this }})

  {% endif %}
)

select {{ primary_key }},
  {{ cols|join(', ') }},
  event_date,
  CURRENT_TIMESTAMP() current_timestamp
from src_data
where rn = 1

{%- endmacro %}