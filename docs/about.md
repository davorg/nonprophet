---
layout: content
title: About
eyebrow: The project
description: How Non-Prophet examines Christian claims about Old Testament prophecy.
intro: We are building a fair, sourced database of Old Testament passages that Christians claim were fulfilled by Jesus.
permalink: /about/
---
## What we are doing

Christian lists commonly contain hundreds of “fulfilled prophecies.” But those lists mix direct predictions, patterns noticed in retrospect, quotations applied in a new setting, and sometimes errors about what a passage says. We separate those claims and examine each one on its own terms.

Our aim is not to prove or disprove Christianity. It is narrower: to ask whether a particular Old Testament text predicts the event that Christians say it does.

## How we work

For every claim, we identify its source, quote the Old Testament passage, and present the strongest responsible Christian argument we can find. We then make one focused critical case, paying attention to the passage's language, historical and literary setting, and use in the New Testament.

Each draft is checked against its sources and passed to a separate language model whose job is to challenge the reasoning and find omissions or unfair shortcuts. The final entry links its sources so readers can check our work. Biblical quotations currently use the public-domain Berean Standard Bible.

## Useful terms

**Prediction** is a statement that points in advance to an identifiable future person or event. **Fulfilment** is the claimed correspondence between that prediction and a later event.

**Typology** connects an earlier person, institution, or event with a later one as part of a theological pattern. A type may be meaningful without being a verbal prediction.

**Canonical rereading** interprets an earlier passage in light of later biblical texts. That can be coherent within Christian theology while going beyond what the earlier passage communicated in its original setting.

## Our verdict categories

{% for item in site.data.verdicts %}
### {{ item[1].label }}

{{ item[1].description }}
{% endfor %}

These labels classify our conclusion, not the sincerity or intelligence of the people who hold the view. Where the evidence is mixed, the entry should say so.
