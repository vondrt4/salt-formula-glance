{%- from "glance/map.jinja" import client with context %}
{%- if client.enabled %}

glance_client_packages:
  pkg.installed:
  - names: {{ client.pkgs }}

{%- for identity_name, identity in client.identity.iteritems() %}

{%- for image_name, image in identity.image.iteritems() %}

glance_openstack_image_{{ image_name }}:
  glanceng.image_present:
    - name: {{ image_name }}
    - profile: {{ identity_name }}
    {%- if image.visibility is defined %}
    - visibility: {{ image.visibility }}
    {%- endif %}
    {%- if image.protected is defined %}
    - protected: {{ image.protected }}
    {%- endif %}
    {%- if image.location is defined %}
    - location: {{ image.location }}
    {%- endif %}

{%- endfor %}
{%- endfor %}

{%- endif %}