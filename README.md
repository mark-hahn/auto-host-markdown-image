auto-host-markdown-image
========================

Add an image to a markdown document with automatic free image hosting.


![Image inserted by Atom editor package auto-host-markdown-image](https://raw.githubusercontent.com/mark-hahn/auto-host-markdown-image/master/screencaps/evcg2sm.gif)


auto-host-markdown-image (ahmi) is an Atom editor package that allows easy insertion of image files into markdown documents. Insertion of the image is a simple drag/drop operation. The file is pushed to the free Imgur hosting service.  Then the Imgur URL for the image is formatted and inserted into the markdown text.  The image shows in the Atom markdown preview immediately.

## Installation

Install ahmi with the command `apm install auto-host-markdown-image` or by using the settings page.

## Usage

- Open an image file in an Atom tab.

- Select a markdown file with the cursor where the image should go.

- Drag the tab above the image file into the markdown text.  The image will be inserted at the cursor.

## Significant Feature

The normal method of hosting an image in the project's repo and linking to it in the readme has a problem.  If you fork that repo then the forked readme continues to point to the original repo image.  If that image is changed the forked version will be broken.

This hosting solution doesn't have that problem.  The hosting is immutable and permanent. 

## Hosting cost

There is no charge for hosting. The free anonymous open-source Imgur account  allows approximately 1,250 uploads per day or approximately 12,500 requests per day.  If this package ever generates that much traffic (not bloody likely) we'll worry about limiting it.

## License

Auto-host-markdown-image is copyright Mark Hahn with an MIT license.

