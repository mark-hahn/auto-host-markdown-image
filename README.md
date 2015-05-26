auto-host-markdown-image
========================

Drag and drop an image to a markdown document with auto-hosting.

![Image inserted by Atom editor package auto-host-markdown-image](https://raw.githubusercontent.com/mark-hahn/auto-host-markdown-image/master/screencaps/evcg2sm.gif)

auto-host-markdown-image is an Atom editor package that allows easy insertion of image files into markdown documents. Insertion of the image is a simple drag/drop operation. The file is pushed to the free Imgur hosting service for hosting or optionally saved in the project GitHub repository.  Then the Imgur URL or GitHub URL for the image is formatted and inserted into the markdown text.  The image shows in the Atom markdown preview immediately when using Imgur (the default).

## Installation

Install the package with the command `apm install auto-host-markdown-image` or by using the settings page.

## Usage

- Open an image file in an Atom tab.

- Select a markdown file with the cursor where the image should go.

- Drag the tab handle for the image file into the markdown text.  The image will be inserted at the cursor.

## Configuration

There are two configuration settings.  

- **Host From Your Github Repo Instead Of Imgur:** When checked the image is copied into the project image folder to include in the repository.  When not checked (the defaut) the image is pushed to the Imgur hosting service.

- **Project Relative Path To Folder For Github Images:** This is the package-relative path used to store the image file when the GitHub repo option above is checked.  If the folder doesn't exist then it is created.  It defaults to `images`.

## GitHub URL

This package takes care of creating the GitHub URL for you but it needs to gather some information to do this.  This info includes the user name, repo name, and repo branch.  For example `atom/file-tree/master`.  This package looks for the `package.json` file in the project that the markdown file is located in.  It then gets the `user/repo` info from the `repository` property.  It always uses `master` as the branch name.  If this information is incorrect you won't find out until the repo is committed, pushed, and the image is broken.

## Imgur Hosting Cost

There is no charge for Imgur hosting. This package has its own free anonymous open-source account. This type of account allows approximately 1,250 uploads per day or approximately 12,500 requests per day.  If this package ever generates that much traffic (not bloody likely) we'll ask Imgur for more usage which Imgur encourages.

## Imgur or GitHub?

- Both are free and reliable
- GitHub is the standard choice for many github projects but Imgur does more hosting like this overall.
- Images stored in a GitHub repo are kept with the other files which is conceptually clean.
- Imgur can be used in any markdown file, not just in GitHub projects.
- When using Imgur the hosting works immediately and the image appears in the markdown preview pane immediately.  With GitHub the image link will not work until the next commit and push to GitHub.
- The GitHub repo option has a problem. If you fork that repo then the forked readme continues to point to the original repo image.  If that URL changes the forked version will be broken.  With Imgur the link and image are immutable.

For most people the decision is a toss-up.  I personally use Imgur for the simplicity, universality, and immediate viewing.

## License

Auto-host-markdown-image is copyright Mark Hahn with an MIT license.

