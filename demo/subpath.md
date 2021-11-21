---
title: Subpath
permalink: /my-path/
layout: null

my_img: '/assets/satelliet.jpg'
---

# {{ page.title }}


## Resized

```
{{ page.my_img | resize: "800x800>" }}
```

![Test image]({{ page.my_img | resize: "800x800>" }})
