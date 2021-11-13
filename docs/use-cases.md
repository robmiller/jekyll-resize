# Use-cases

If your page is loading too slowly because of large images and you can't be bothered to manually create thumbnails (images with reduced dimensions), then this Jekyll filter is for you.

When running `jekyll build` or `jekyll serve`, this easy-to-use filter will create a smaller version of your image in a cache directory and link to it, so your page can load faster. The cache is generated fresh on each site build, so you don't clutter your version control with duplicate images.

Use it for:

- Making a batch of **thumbnails**.
- Reducing images to a suitable size for the **web**.
    - Such as create versions of your images that are say 800px wide and probably under 1MB, while still keeping the original full-size images untouched in the repo. 
    - And you can always let the user view the full-size image if you want them to, like click on a small image and see the full image. 
    - You could also make _multiple_ resized versions of an image. e.g. A small and medium version - say 400px wide and 1000px wide, so the user doesn't have wait for 4000px wide to load.

