---
title: Homepage
layout: null
---

# {{ page.title }}

{% assign my_img = 'assets/satelliet.jpg' %}

See also [Subpath][] test page.

[Subpath]: {% link subpath.md %}


## Resized

```
{{ my_img | resize: "200x200>" }}
```

![Test image]({{ my_img | resize: "200x200>" }})


## Original

```
{{ my_img}}
```

![Test image]({{ my_img }})
