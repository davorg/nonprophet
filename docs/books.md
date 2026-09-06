---
layout: content
title: Bible books
eyebrow: Browse
description: Browse published prophecy claims by Old Testament book.
intro: Find claims through the Old Testament book they cite.
permalink: /books/
---
{% assign claims = site.claims | where: 'publication_state', 'published' %}{% assign books = claims | map: 'book' | uniq | sort %}
<div class="taxonomy-grid">{% for book in books %}{% assign count = claims | where: 'book', book | size %}{% assign book_slug = book | slugify %}<a class="taxonomy-card" href="{{ '/books/' | append: book_slug | append: '/' | relative_url }}"><strong>{{ book }}</strong><span>{{ count }} {% if count == 1 %}claim{% else %}claims{% endif %}</span></a>{% endfor %}</div>
