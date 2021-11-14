---
title: Homepage
layout: null
---

{% assign my_img = 'assets/satelliet.jpg' %}

## Resized

```
{{ my_img | resize: "800x800>" }}
```

![Test image]({{ my_img | resize: "800x800>" }})


## Original

```
{{ my_img}}
```

![Test image]({{ my_img }})
