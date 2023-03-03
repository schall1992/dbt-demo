{% set source_name = "policy_servicing" %}
{% set source_table = "policy_servicing_policy_attributes" %}
{% set primary_key = "certificate_id" %}
{% set cols = [
    "coverage_status",
    "coverage_effective_date",
    "coverage_expiration_date",
    "coverage_cancellation_effective_date",
    "coverage_cancellation_option"
] %}

{{ l2_model(source_name, source_table, primary_key, cols) }}