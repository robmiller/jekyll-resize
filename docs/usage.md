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

### Changing file format

If you want to output thumbnails in a different file format, you can pass a format option:

```liquid
---
image_path: assets/img/hello.jpg
---

<img src="{{ page.image_path | resize: '800x800> format: png' | relative_url }}" alt="My image" />
```

This will create the resized image as a PNG, and produce the following output:

```
<img src="/my-repo-name/cache/resize/abcdefgh123_800x800.png" alt="My image" />
```


## Building

After setting up your original images such as in `assets` and setting up your HTML and markdown pages, you can build your site to use the plugin.

When you run `jekyll build` or `jekyll serve`, you'll see the plugin will log the activity.

Here is says it is reducing an image, showing the original path and then the destination path. The original is untouched.

```
Resizing 'satelliet.jpg' to 'cache/resize/7f1f902623977ea3b87f9a668945e499_800x800.jpg' - using options: '800x800>'
```

The file that gets created has output path has a hash like the one below, but much longer.

```
c673c80c6...5a92_800x800.jpg
```

So you change the output size of the image as many times as you like - you'll get a new output image created.

The output `cache/resize/` directory will be created if necessary and the image will be created in there.

This `cache` directory would be **excluded** from version control - the output image only matters when building and deploying and you don't need to track the output files.
