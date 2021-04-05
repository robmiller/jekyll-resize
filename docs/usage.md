# Usage

## Basic

This plugin makes the `resize` filter available.

It can be used like this:

```
resize: OPTIONS
```

The options could be `"800x800"` or `"800x800>"` for example, setting width and height and using the greater-than sign.

Pass an image path to the filter so it can be resized and saved to `cache/resize/`. 

The filter will both resize the image and ensure the HTML path points to the generated resized image. 


## Passing a path

Use the path to an image as a variable.

```liquid
{{ image_path | resize: '800x800>' }}
```

Or using a literal string.

```liquid
{{ 'assets/img/hello.jpg' | resize: '800x800>' }}
```

When passing a string to `resize`, make sure that it is a direct path to the image and that you only add the subpath last as in the `relative_url` examples below.


## Examples

Both of the examples below will achieve this as HTML:

```html
<img src="/my-repo-name/cache/resize/abcdefgh123_800x800.jpg" alt="My image" />
```

### Markdown

```liquid
---
image_path: assets/img/hello.jpg
---

![My image]({{ page.image_path | resize: "800x800>" | relative_url }})
```

### HTML

```liquid
---
image_path: assets/img/hello.jpg
---

<img src="{{ page.image_path | resize: '800x800>' | relative_url }}" alt="My image" />
```
