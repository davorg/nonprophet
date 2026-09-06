---
layout: content
title: Genesis
eyebrow: Bible book
description: Published prophecy claims associated with Genesis.
intro: Claims whose Old Testament source is in Genesis.
permalink: /books/genesis/
---
{% assign claims = site.claims | where: 'publication_state', 'published' | where: 'book', 'Genesis' | sort: 'claim_number' %}
<div class="claim-list">{% for claim in claims %}{% include claim-card.html claim=claim %}{% endfor %}</div>
