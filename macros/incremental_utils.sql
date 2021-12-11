{% macro incremental_load_filter(time_col) -%}
    -- dbt makes it easy to query your target table by using the "{{ this }}" variable.
    WHERE {{time_col}} > (select max({{time_col}}) from {{ this }})
{%- endmacro %}