---
layout: content
title: Verdicts
eyebrow: Browse
description: Browse published prophecy claims by Non-Prophet verdict category.
intro: Our verdicts describe why a claim does—or does not—work as an advance prediction.
permalink: /verdicts/
---
{% assign claims = site.claims | where: 'publication_state', 'published' %}<div class="taxonomy-grid">{% for item in site.data.verdicts %}{% assign count = claims | where: 'verdict_category', item[0] | size %}{% if count > 0 %}<a class="taxonomy-card" href="{{ '/verdicts/' | append: item[0] | replace: '_', '-' | append: '/' | relative_url }}"><strong>{{ item[1].label }}</strong><span>{{ count }} {% if count == 1 %}claim{% else %}claims{% endif %}</span><small>{{ item[1].description }}</small></a>{% endif %}{% endfor %}</div>
