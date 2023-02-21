{% test no_invalid_dates(model, column_name) %}

select {{ column_name }} 
from {{ model }}
where {{ column_name }} > DATEADD(year, 1, CURRENT_DATE())

{% endtest %}