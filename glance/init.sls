
include:
{%- if pillar.glance.server.enabled %}
- glance.server
{%- endif %}
{% if pillar.glance.client is defined %}
- glance.client
{% endif %}