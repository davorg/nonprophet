---
layout: content
title: Bible books
eyebrow: Browse
description: Browse published prophecy claims by Old Testament book.
intro: Find claims through the Old Testament book they cite.
permalink: /books/
---
{% assign claims = site.claims | where: 'publication_state', 'published' %}
<div class="taxonomy-grid">{% for book_item in site.data.books %}{% assign book = book_item.name %}{% assign count = claims | where: 'book', book | size %}{% if count > 0 %}<a class="taxonomy-card" href="{{ '/books/' | append: book_item.slug | append: '/' | relative_url }}"><strong>{{ book }}</strong><span>{{ count }} {% if count == 1 %}claim{% else %}claims{% endif %}</span></a>{% endif %}{% endfor %}</div>
