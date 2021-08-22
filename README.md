# AGK-Examples
A collection of mini AGK projects that I've created, some were created for no reason other than being curious.

### Convert Material Icons To Subimages
This script takes the downloaded Material Icons (you get them from here: https://github.com/google/material-design-icons/tree/master/png) and converts them to subimages so that you can easily load them in to your project. An example how to use them can be found in the Material Icons project mentioned below (which can also be found in this group of AGK examples)

With this script you can convert all icons to subimages, or just a selection of icons that you want for your project. There's examples, and comments at the top of the script showing how to do this.

The icons provided in the original repository are coloured black. This script inverts the colour so that they are saved as white. Having them white makes it easier to colour the icons however you want in your project.

### Material Icons
This script contains all of the Material Icons converted for AGK use. There is a folder for each type i.e.: baseline, outlined, round, sharp, and twotone.

Change iconsPath$ to point to the set you want to use.

Two sizes for each set have been provided. 48px and 96px. The 96px is recommended if you're starting to notice blurry icons when scaling up the 48px version. Keep in mind that the 96px version will make your app a little larger because the image sizes are larger.

You can use these icons in OryUI if you want to replace the default icon set which is currently baseline 48px. If so, only copy and replace the *.png, and *.txt files from the desired style and size i.e. twotone/96px folder into media/OryUIMedia/Material-Icons. Don't copy the folder, just the files within it.

In your app you are only likely to use one style and size, so you would only need to copy that style and size folder. There's no need to copy all styles and sizes in to your project as that will just make your overall app size larger.

To see all of the available icons and their names, visit: https://material.io/resources/icons

### Missing Commands
This is a single file containing a number of functions/commands that are missing from AGK. These use a similar naming convention to what TGC use so there is a chance that some of these may clash if they do release commands in the future with the same name. These aren't all mine, some were lifted from the help files, discord, or the forum.

### Pixel Art To Sprite Art
This script contains a simple function that reads any image and converts it to pixel art built from coloured sprites. It works best with images that have large blocks of the same colour in i.e. a pixel art image, or an Arkanoid type game level screen.

#### What could it be used for?
Could be used for designing levels that use simple colour blocks laid out in a number of different designs.

## License
All of these projects are open-source software, licensed under the [MIT license](https://opensource.org/licenses/MIT).