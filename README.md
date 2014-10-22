auto-host-markdown-image
========================

Add an image to a markdown document with automatic free image hosting.

auto-host-markdown-image (ahmi) is an Atom editor package that allows easy insertion of image files into markdown documents.  The file can be selected from the file-tree, or the tab for an opened image can be dragged into the markdown.  The file is pushed to the free Imgur hosting service.  Then the Imgur URL for the image is formatted and inserted into the markdown.  The image shows in the markdown preview immediately.

## Installation
- Install ahmi with the command `apm install auto-host-markdown-image` or by using the settings page.

## Inserting the image file using the file-tree

- Make sure the image file isn't already open in any tab.  If it is use the drag and drop method described below instead of the file-tree.
- The settings field `Auto Open File Regex` should be set to a regex that matches the filepath of the image you want to open. The default is `markdown\.(jpeg|jpg|gif|png)$` which will open any image with a file name ending in `markdown`.  E.g. `xxx-markdown.gif`.
- Select a markdown file with the cursor where the image should go.
- Select any file matching the regex in the file tree.  The image will be inserted.

## Inserting the image file using drag and drop

- Open an image file in an Atom tab.
- Select a markdown file with the cursor where the image should go.
- Drag the tab above the image file into the markdown text.  The image will be inserted at the cursor.

## Hosting cost

There is no charge for hosting. The free anonymous open-source Imgur account  allows approximately 1,250 uploads per day or approximately 12,500 requests per day.  If this package ever generates that much traffic (not bloody likely) we'll worry about limiting it.

## License

Auto-host-markdown-image is copyright Mark Hahn with an MIT license.

