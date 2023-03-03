{% set source_name = "policy_servicing" %}
{% set source_table = "policy_servicing_policy_attributes" %}
{% set primary_key = "mgic_loan_id" %}
{% set cols = [
    "loan_level_credit_score",
    "investor_identifier",
    "loan_origination_channel_type",
    "current_note_interest_rate_percent",
    "loan_amortization_months_count",
    "loan_amortization_remaining_months_count",
    "original_note_amount",
    "seller_paid_closing_costs_amount",
    "first_time_homebuyer_indicator",
    "lifetime_rate_change_cap_percent",
    "loan_purpose_type",
    "base_ltv_percent",
    "combined_ltv_percent",
    "property_occupancy",
    "servicer",
    "manufactured_home_type",
    "loan_level_borrower_count",
    "owned_property_use_type",
    "property_valuation_amount",
    "accounting_state",
    "property_category_type",
    "financed_unit_count",
    "negative_amortization_indicator",
    "cancellation_reason",
    "refinance_to_modification_rtm_indicator",
    "refi_reason",
    "insured_property_county",
    "loan_type",
    "loan_amortization_type",
    "reduced_documentation_loan_type"
] %}

{{ l2_model(source_name, source_table, primary_key, cols) }}