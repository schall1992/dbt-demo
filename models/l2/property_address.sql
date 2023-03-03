{% set source_name = "policy_servicing" %}
{% set source_table = "policy_servicing_policy_attributes" %}
{% set primary_key = "mgic_loan_id" %}
{% set cols = [
    "insured_property_street_address",
    "insured_property_state",
    "insured_property_zip_code",
    "insured_property_city"
] %}

{{ l2_model(source_name, source_table, primary_key, cols) }}