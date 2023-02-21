{% macro add_prefix(field) %}

    CONCAT('mgic-', {{ field }})
    
{% endmacro %}