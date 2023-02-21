{% test no_future_dates(model, column_name) %}

SELECT {{ column_name }} 
FROM {{ model }}
WHERE CURRENT_DATE() < {{ column_name }}

{% endtest %}