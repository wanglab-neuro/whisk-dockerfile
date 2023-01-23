[Whisker Tracing GUI](https://web.archive.org/web/20210801043628/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracing+GUI)
====================================================================================================================================

<table class="aui"> <thead> <tr class="header"> <th class="search-result-title">Page Title</th> <th class="search-result-space">Space</th> <th class="search-result-date">Updated</th> </tr> </thead> </table> <p class="search-result-count">{0}</p> <tr class="search-result"> <td class="search-result-title"><a href="{1}" class="content-type-{2}"><span>{0}</span></a></td> <td class="search-result-space"><a class="space" href="/wiki/display/{4}/" title="{3}">{3}</a></td> <td class="search-result-date"><span class="date" title="{6}">{5}</span></td> </tr> [Skip to end of metadata](#page-metadata-end)

*   Created by Unknown User (clackn), last modified on [Feb 02, 2011](https://web.archive.org/web/20210801043628/https://wiki.janelia.org/wiki/pages/diffpagesbyversion.action?pageId=1182891&selectedPageVersions=12&selectedPageVersions=13 "Show changes")

[Go to start of metadata](#page-metadata-start)

Overview
========

ui2.py is a powerful GUI-based browser written in Python. ui2.py allows you to rapidly scroll through large movies and overlay the results from whisker tracking. ui2.py can also be used to manually correct the results from automated whisker tracking.

Contents
========

*   1[Overview](#WhiskerTracingGUI-Overview)
*   2[Command line reference](#WhiskerTracingGUI-Commandlinereference)
    *   2.1[Usage](#WhiskerTracingGUI-Usage)
    *   2.2[Parameters](#WhiskerTracingGUI-Parameters)
    *   2.3[Examples](#WhiskerTracingGUI-Examples)
*   3[Keyboard Controls](#WhiskerTracingGUI-KeyboardControls)
*   4[Mouse Controls](#WhiskerTracingGUI-MouseControls)
*   5[Notes](#WhiskerTracingGUI-Notes)

Command line reference
======================

#### Usage

ui2.py \[options\] moviefile \[dataprefix\]

#### Parameters

Options

Description

`-h, --help`

show this help message and exit

`-t, -T, --transpose`

transpose images (default: `False`)

`--frame=N`

Start browsing at the `N`'th frame (default: 0)

`--facehint='faceside'`

Specify location of the face in the image (left, right, top, bottom)  

`-c CURSOR_SIZE`, `--cursorsize=CURSOR_SIZE`

Initial cursor radius in pixels (default: 10 px)

`--cursorpos`

Show cursor's center coordinates (default: `False`)

`--adjuststripes`

Adjust odd-scanline bias (default: `True`)

`--noadjuststripes`

Prevent adjust odd-scanline bias (default: `False`)

`--fps`

Display rendering speed (default: `False`)

#### Examples

  python ui2.py S0.tif
  python ui2.py S0.tif S0
  python ui2.py S0.tif S0.whisker S0.measurements S0.bar

If no `dataprefix` is given, a default set will be created. The prefix will be used to load/save the appropriate files. Ordering of the filenames isn't important. Filetype is detected according to the file extension.

Keyboard Controls
=================

key

function

`< (,)`

Jump to the beginning of the movie

`> (.)`

Jump to the end of the movie

`]`

Jump to next gap in current trajectory

`[`

Jump to previous gap in current trajectory

`Shift-]`

Jump to next gap in any trajectory

`Shift-[`

Jump to previous gap in any trajectory

`Up`

Increment current whisker id

`Down`

Decrement current whisker id

`Left`

Rewind one frame

`Right`

Advance one frame

`Shift`

( Modifies arrow keys ) speed up 10x

`Ctrl`

( Modifies arrow keys ) speed up 10x

`Alt`

( Modifies arrow keys ) speed up 10x

`Delete`

Delete whisker in currently displayed frame

`Space`

Turn auto mode on and off

`d`

Change draw mode

`Shift``-d`

Enter debug console

`Ctrl``-s`

Save

`ESC`

Save and Quit

`=`

Increment search radius

`-`

Decrement search radius

`f`

Scroll through face hints to indicate which side of the image the face is on. See [#Notes](#WhiskerTracingGUI-Notes).

Mouse Controls
==============

Action

function

Right click

Mark seed for whisker tracking. Attempt backbone tracing. Draw traced whisker backbone. Advance 1 frame.

Left click

Add nearest segment within cursor to current whisker. If no segment found in cursor, clear any segments in that frame assigned to the whisker. Advance 1 frame.

Mouse wheel up

Advance 1 frame

Mouse wheel down

Rewind 1 frame

Notes
=====

If filenames are not completely specified, default names will be guessed.

If an existing data file is found, the whisker data will be loaded.

Normally the left and right arrow keys advance or rewind by one frame. Holding down shift, ctrl, and/or alt keys will increase the step size by 10x each. Hence, holding shift and ctrl (or ctrl and alt, etc...) results in a 100 frame step. Holding shift ctrl and alt and pressing left or right, jumps 1000 frames.

The face hint is used when saving to a `.measurements` file. The `.measurements` file contains measures of follicle features and the identity of segments. Some of these measurements require approximate knowledge of the center of the whisker pad, which is indicated by the face hint. Currently, the hint only takes values of `left`,`right`,`top` or `bottom` that indicate the side of the movie the face is on. These options work for a specific class of data where the image is cropped so the mouse's face is on one side.

*   No labels

Overview

Content Tools

*   Powered by [Atlassian Confluence](https://web.archive.org/web/20210801043628/http://www.atlassian.com/software/confluence) 6.13.4
*   Printed by Atlassian Confluence 6.13.4
*   [Report a bug](https://web.archive.org/web/20210801043628/https://support.atlassian.com/help/confluence)
*   [Atlassian News](https://web.archive.org/web/20210801043628/http://www.atlassian.com/about/connected.jsp?s_kwcid=Confluence-stayintouch)

[Atlassian](https://web.archive.org/web/20210801043628/http://www.atlassian.com/)

{"serverDuration": 51, "requestCorrelationId": "7b61f37a4f4cdd04"} AJS.BigPipe = AJS.BigPipe || {}; AJS.BigPipe.metrics = AJS.BigPipe.metrics || {}; AJS.BigPipe.metrics.pageEnd = typeof window.performance !== "undefined" && typeof window.performance.now === "function" ? Math.ceil(window.performance.now()) : 0; AJS.BigPipe.metrics.isBigPipeEnabled = 'false' === 'true';