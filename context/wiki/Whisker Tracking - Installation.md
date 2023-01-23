[Whisker Tracking Installation](https://web.archive.org/web/20210801034305/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Installation)
========================================================================================================================================================

<table class="aui"> <thead> <tr class="header"> <th class="search-result-title">Page Title</th> <th class="search-result-space">Space</th> <th class="search-result-date">Updated</th> </tr> </thead> </table> <p class="search-result-count">{0}</p> <tr class="search-result"> <td class="search-result-title"><a href="{1}" class="content-type-{2}"><span>{0}</span></a></td> <td class="search-result-space"><a class="space" href="/wiki/display/{4}/" title="{3}">{3}</a></td> <td class="search-result-date"><span class="date" title="{6}">{5}</span></td> </tr> [Skip to end of metadata](#page-metadata-end)

*   Created by Unknown User (clackn), last modified on [Dec 06, 2011](https://web.archive.org/web/20210801034305/https://wiki.janelia.org/wiki/pages/diffpagesbyversion.action?pageId=1182899&selectedPageVersions=15&selectedPageVersions=16 "Show changes")

[Go to start of metadata](#page-metadata-start)

Contents
========

*   1[From pre-built binaries](#WhiskerTrackingInstallation-Frompre-builtbinaries)
    *   1.1[Quick-start](#WhiskerTrackingInstallation-Quick-start)
        *   1.1.1[Install the command line tools.](#WhiskerTrackingInstallation-Installthecommandlinetools.)
        *   1.1.2[(Optional) Install the Python environment.](#WhiskerTrackingInstallation-(Optional)InstallthePythonenvironment.)
        *   1.1.3[(Optional) Install the Matlab environment.](#WhiskerTrackingInstallation-(Optional)InstalltheMatlabenvironment.)

From pre-built binaries
=======================

There are two ways to install. It's simplest to use a [pre-built package](https://web.archive.org/web/20210801034305/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Downloads). If there isn't one, you'll need to install by building the [source code](https://web.archive.org/web/20210801034305/https://github.com/nclack/whisk). The source code builds and has been tested on Ubuntu 10.10, Fedora 10, Windows XP, and OS X 10.5 and 10.6 on both 32 and 64-bit machines. If a pre-built installer is available for your system, it will be found [here](https://web.archive.org/web/20210801034305/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Downloads).

Quick-start
-----------

### Install the command line tools.

1\. [Download](https://web.archive.org/web/20210801034305/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Downloads) the pre-built package for your system.

2\. If using an installer, run it and follow directions. If installing from a compressed archive, open the archive and copy files to the desired directory. If given the option, it is recommended you do an `Everything` install.

3\. (optional) Add the {`WhiskerTracking}/bin` directory to your environment's `PATH`. Doing so will allow you to call the command line utilities from any directory. The installer might do this for you.

4\. (optional) Add the {`WhiskerTracking}/ui` directory to your environment's `PATH`. Doing so will allow you to call `ui2.py`, the graphical interface, from any directory.

### (Optional) Install the Python environment.

**Note**

The graphical user interface is written in [Python 2.6](https://web.archive.org/web/20210801034305/http://www.python.org/). Installation of a Python 2.6 environment, including several Python libraries, is required to run the graphical user interface, but is not required for the command line tools used for automated analysis.

Install the following **in order**. Be sure to choose the right installers for your system.:

1.  [Python 2.6](https://web.archive.org/web/20210801034305/http://www.python.org/download/releases/2.6.5/)
2.  [numpy 1.4.1](https://web.archive.org/web/20210801034305/http://sourceforge.net/projects/numpy/files/)
3.  [scipy 0.8](https://web.archive.org/web/20210801034305/http://sourceforge.net/projects/scipy/files/)
4.  [matplotlib 0.99.3](https://web.archive.org/web/20210801034305/http://matplotlib.sourceforge.net/)
5.  [pygame 1.9](https://web.archive.org/web/20210801034305/http://www.pygame.org/)
6.  [aggdraw 1.2a3](https://web.archive.org/web/20210801034305/http://effbot.org/zone/aggdraw-index.htm)

**Note**

The recommended method for installing Python and Python libraries varies from system to system. On Windows, use installers (`.msi` or `.exe` files). On Linux, use your system's built-in in package manager (for example `apt-get`). Linux users might consider using [`easy_install`](https://web.archive.org/web/20210801034305/http://packages.python.org/distribute/easy_install.html) or [`pip`](https://web.archive.org/web/20210801034305/http://pip.openplans.org/) instead. On OS X 10.5, use `.dmg` based installers. A 64-bit installation for OS X 10.6 is a special case. Many installers do not install `x86_64` compatible binaries. See [Installing a 64-bit Python environment on Mac OS X 10.6](#) for more.

**Warning**

Python comes pre-installed on OS X. There are Python installers available for OS X, but they may install themselves in strange places. On OS X _do not_ install Python itself unless you know what you're doing.

### (Optional) Install the Matlab environment.

Add {`WhiskerTracking}/matlab` to your Matlab [path](https://web.archive.org/web/20210801034305/http://www.mathworks.com/access/helpdesk/help/techdoc/matlab_prog/f10-60956.html). This adds the following m-files:

*   `LoadWhiskers.m`
*   `LoadMeasurements.m`
*   `SaveMeasurements.m`

With the path properly adjusted, one can use the `doc` or `help` commands in Matlab to learn how to use these commands.

*   No labels

Overview

Content Tools

*   Powered by [Atlassian Confluence](https://web.archive.org/web/20210801034305/http://www.atlassian.com/software/confluence) 6.13.4
*   Printed by Atlassian Confluence 6.13.4
*   [Report a bug](https://web.archive.org/web/20210801034305/https://support.atlassian.com/help/confluence)
*   [Atlassian News](https://web.archive.org/web/20210801034305/http://www.atlassian.com/about/connected.jsp?s_kwcid=Confluence-stayintouch)

[Atlassian](https://web.archive.org/web/20210801034305/http://www.atlassian.com/)

{"serverDuration": 69, "requestCorrelationId": "32edb85c8879f4e4"} AJS.BigPipe = AJS.BigPipe || {}; AJS.BigPipe.metrics = AJS.BigPipe.metrics || {}; AJS.BigPipe.metrics.pageEnd = typeof window.performance !== "undefined" && typeof window.performance.now === "function" ? Math.ceil(window.performance.now()) : 0; AJS.BigPipe.metrics.isBigPipeEnabled = 'false' === 'true';