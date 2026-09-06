---
layout: content
title: Claims
eyebrow: Browse
description: Every published Non-Prophet claim in numerical order.
intro: Every published claim, in numerical order.
permalink: /claims/
---
{% assign claims = site.claims | where: 'publication_state', 'published' | sort: 'claim_number' %}
<div class="claim-list">{% for claim in claims %}{% include claim-card.html claim=claim %}{% endfor %}</div>
