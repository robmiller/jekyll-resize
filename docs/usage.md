# Usage

This plugin makes the `resize` filter available.

It can be used like this:

```
resize: OPTIONS
```

The options could be `"800x800"` or `"800x800>"` for example, setting width and height and using the greater-than sign.

Pass an image path to the filter so it can be resized and saved to `cache/resize/`. 

The filter will both resize the image and ensure the HTML path points to the generated resized image. 


## Examples

Build the URL to a resized image:

```liquid
{{ image_path | resize: "800x800>" }}
```

In Markdown:

```liquid
![My image]({{ image_path | resize: "800x800>" }})
```


## Output

Sample output logged on build:

```
Thumbnailing .../my-project/uploads/1.jpg to .../my-project/cache/resize/c673c80c6...5a92_800x800.jpg (800x800>)
```

The filename in `cache/resize/` will be like this but longer.

```
c673c80c6...5a92_800x800.jpg
```
