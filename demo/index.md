---
title: Homepage
layout: null
---

# {{ page.title }}

{% assign my_img = 'assets/satelliet.jpg' %}

See also [Subpath][] test page.

[Subpath]: {% link subpath.md %}


## Resized

Liquid:

```
{{ my_img | resize: "200x200>" }}
```

Rendered image:

![Test image]({{ my_img | resize: "200x200>" }})


## Original

Liquid:

```
{{ my_img}}
```

Rendered image:

![Test image]({{ my_img }})
