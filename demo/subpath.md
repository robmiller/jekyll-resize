---
title: Subpath
permalink: /my-path/
layout: null

my_img: '/assets/satelliet.jpg'
---

# {{ page.title }}


## Resized

Liquid:

```
{{ page.my_img | resize: "800x800>" }}
```

Rendered image:

![Test image]({{ page.my_img | resize: "800x800>" }})
