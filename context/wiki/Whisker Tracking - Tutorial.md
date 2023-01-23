[Whisker Tracking Tutorial](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Tutorial)
================================================================================================================================================

<table class="aui"> <thead> <tr class="header"> <th class="search-result-title">Page Title</th> <th class="search-result-space">Space</th> <th class="search-result-date">Updated</th> </tr> </thead> </table> <p class="search-result-count">{0}</p> <tr class="search-result"> <td class="search-result-title"><a href="{1}" class="content-type-{2}"><span>{0}</span></a></td> <td class="search-result-space"><a class="space" href="/wiki/display/{4}/" title="{3}">{3}</a></td> <td class="search-result-date"><span class="date" title="{6}">{5}</span></td> </tr> [Skip to end of metadata](#page-metadata-end)

*   Created by [Clack, Nathan](https://web.archive.org/wiki/display/~clackn), last modified on [Dec 12, 2011](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/pages/diffpagesbyversion.action?pageId=1182897&selectedPageVersions=20&selectedPageVersions=21 "Show changes")

[Go to start of metadata](#page-metadata-start)

Contents
========

*   1[Tutorial: Automated Whisker Tracking](#WhiskerTrackingTutorial-Tutorial:AutomatedWhiskerTracking)
    *   1.1[Step 0: Data](#WhiskerTrackingTutorial-Step0:Data)
    *   1.2[Step 1: Trace](#WhiskerTrackingTutorial-Step1:Trace)
    *   1.3[Step 2: Measure](#WhiskerTrackingTutorial-Step2:Measure)
    *   1.4[Step 3. Classify](#WhiskerTrackingTutorial-Step3.Classify)
    *   1.5[Step 4. Reclassify](#WhiskerTrackingTutorial-Step4.Reclassify)
    *   1.6[Step 5. View the results](#WhiskerTrackingTutorial-Step5.Viewtheresults)
*   2[Tutorial: Assessing identification accuracy.](#WhiskerTrackingTutorial-Tutorial:Assessingidentificationaccuracy.)
    *   2.1[Step 1: Manually track whiskers.](#WhiskerTrackingTutorial-Step1:Manuallytrackwhiskers.)
    *   2.2[Step 2: Observe parameters required for automated tracing.](#WhiskerTrackingTutorial-Step2:Observeparametersrequiredforautomatedtracing.)
    *   2.3[Step 3: Run automated tracing.](#WhiskerTrackingTutorial-Step3:Runautomatedtracing.)
    *   2.4[Step 4. Compare curated and automated results.](#WhiskerTrackingTutorial-Step4.Comparecuratedandautomatedresults.)
    *   2.5[Step 5. Check each difference.](#WhiskerTrackingTutorial-Step5.Checkeachdifference.)
    *   2.6[Step 6. Record identity errors for the trial.](#WhiskerTrackingTutorial-Step6.Recordidentityerrorsforthetrial.)

Tutorial: Automated Whisker Tracking
====================================

The programs described below are run from your operating system's command line; they are **not** Matlab functions. For more details see the [Reference](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Command+Line+Reference#WhiskerTrackingCommandLineReference-Reference).

Typically, each program reads a file as input and outputs the results to another file. These output files may be read by Python or Matlab functions provided by this package.

Step 0: Data
------------

Start with an 8-bit video with data good contrast and a flat background similar to that in [#Figure 1](#WhiskerTrackingTutorial-Figure1). Make sure the background is not saturated. The brightest pixel in the image should have an intensity less than 255. For this tutorial, the video is located in {`WhiskerTracking}data/movie.mp4`.

You can download the data used for this tutorial [here](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/download/attachments/1182897/movie.mp4?version=1&modificationDate=1322504700000&api=v2) (right-click on the link and select "Save As").

  
![](Whisker%20Tracking%20Tutorial%20-%20Myers%20Lab%20-%20Janelia%20Research%20Campus%20Wiki_files/login.htm)  
**Figure 1.** Raw data.

Step 1: Trace
-------------

Locate whisker segments throughout the video. From the command line, run:

    trace data/movie.mp4 data/movie.whiskers

This step requires the most processing time (a few minutes for the 4,599 frame video in the example). If this is your first time running `trace` it will take some extra time to generate two `.detectorbank` files.

[More](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Command+Line+Reference#WhiskerTrackingCommandLineReference-trace)

Step 2: Measure
---------------

Generate measurements of the traced shapes. These are used in later steps to determine the correspondance between traced objects and whiskers. From the command line, run:

     measure --face left data/movie.whiskers data/movie.measurements

In this video the face is on the left side of the frame. Knowing where the face is tells `measure` which side of traced objects should be considered the follicle.

[More](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Command+Line+Reference#WhiskerTrackingCommandLineReference-measure)

Step 3. Classify
----------------

Usually, the tracing step identifies too many objects (e.g. facial hairs are often traced). Use `classify` to generate a first guess of which traced shapes are actually whiskers. Here, the strategy is to be conservative. It's ok to identify some whisker shapes as "not a whisker," but identifying, for example, facial hairs as whiskers is more difficult to tolerate in later steps. Run `classify` from the command line::

    classify data/movie.measurements data/movie.measurements left --px2mm 0.04 -n 3

Here, the same file is used as the source and destination file. Again, the face is specified to be on the left side of the image. A length threshold is used to discriminate between traced whisker segments and other traced shapes; the \`px2mm\` parameter provides the spatial scale. Finally, we specify that we should expect 3 whiskers in the field throughout most of the video. See `classify --help` for more options.

[More](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Command+Line+Reference#WhiskerTrackingCommandLineReference-classify)

Step 4. Reclassify
------------------

Using the results from the previous step, identify which traced objects belong to which whiskers throughout the video. From the command line, run:

    reclassify data/movie.measurements data/movie.measurements -n 3

Again, the same file is used as input and output.

[More](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Command+Line+Reference#WhiskerTrackingCommandLineReference-reclassify)

Step 5. View the results
------------------------

You can load and plot results in \`Matlab\`\_ or \`Python\`\_ using the included interfaces. You can also browse the results in the provided graphical user interface (see [#Figure 2](#WhiskerTrackingTutorial-Figure2)). From the command line, run:

    python ui2.py data/movie.mp4

`ui2.py` will guess the names of the `.whiskers` and `.measurements` file. You can also explicitly specify these files on the command line (run `python ui2.py --help` for more information).

  
![](Whisker%20Tracking%20Tutorial%20-%20Myers%20Lab%20-%20Janelia%20Research%20Campus%20Wiki_files/login_002.htm)  
**Figure 2.** Screenshot of ui2.py looking at the result after [#Step 4](#WhiskerTrackingTutorial-Step4). Identified whiskers are labelled red, green, and blue. Light yellow indicates a "non-whisker" trace. The green ball identifies the follicle of the selected whisker.

[More](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracing+GUI)

Tutorial: Assessing identification accuracy.
============================================

Step 1: Manually track whiskers.
--------------------------------

\[[TODO elaborate](#)\]  
From the command line, run:

    python ui2.py curated.tif --cursorpos

and start painstakingly working your way through the movie. See the [Whisker Tracking Command Line Reference](https://web.archive.org/web/20200812012723/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Command+Line+Reference) for useful options. Two data files will be generated:

*   curated.whiskers
*   curated.measurements

Step 2: Observe parameters required for automated tracing.
----------------------------------------------------------

Answer the following questions:

1.  How many whiskers are in the field of view?
2.  Is the face oriented horizontally or vertically?
3.  What is the pixel size in mm?
4.  Where is the whisker pad located (in px)?

Whisker follicles are arranged around this point throughout the entire movie.

[#Figure 3](#WhiskerTrackingTutorial-Figure3) provides an example. There are four whiskers tracked by the curator. However, the curator could have chosen only the longest two or included another microvibrissa and tracked 5 whiskers. It's best to choose the longest set of whiskers where there is a significant difference in length between facial hairs and chosen whiskers. So for this data set, tracking 2 or 4 whiskers is a good choice.

The whisker pad location is used to determine the anterior-posterior ordering of whiskers. Whisker follicles should be arrayed around this point throughout the video.

  
![](Whisker%20Tracking%20Tutorial%20-%20Myers%20Lab%20-%20Janelia%20Research%20Campus%20Wiki_files/login_004.htm)  
**Figure 3.** Screenshot of a curated trial in `ui2.py`. There are 4 whiskers present. The face is oriented horizontally. The whisker pad is located at (221,320); this point is at the center of the red circle.

Step 3: Run automated tracing.
------------------------------

Be careful not to overwrite your curated data.

For the video in [#Figure 3](#WhiskerTrackingTutorial-Figure3), run the following from the command line:

trace curated.tif test.whiskers
measure --face 221 330 h test.whiskers test.measurements
classify test.measurements test.measurements 221 330 h --px2mm 0.04 -n 4
reclassify test.measurements test.measurements -n 4

Step 4. Compare curated and automated results.
----------------------------------------------

From the command line run:

report -diff test.measurements curated.measurements

This generates some output text such as that shown in [#Figure 4](#WhiskerTrackingTutorial-Figure4). Use `report -hist` to get an overview of the number of differences per frame.

  
![](Whisker%20Tracking%20Tutorial%20-%20Myers%20Lab%20-%20Janelia%20Research%20Campus%20Wiki_files/login_003.htm)  
**Figure 4.** Screenshot of a `report -diff` output. Use the reported frames to target error checking. All of these differences are actually errors in the curated data.

Step 5. Check each difference.
------------------------------

Each difference needs to be manually inspected before it can be classified as an error.

Many differences are mistakes made during curation. The curated data should be corrected as necessary and `report -diff` re-run.

Some differences occur during intervals that should be excluded from analysis, such as during grooming. These differences should be excluded from analysis by ignoring this interval. The tracking software's performance during these intervals is not measured.

If the tracker exhibits a large number of errors, try using different parameters for automated tracking. If that doesn't improve the situation contact the author and continue with the analysis.

To open `ui2.py` to a particular frame of the curated data, run:

python ui2.py curated.tif --frame=2399

This will automatically load curated.whiskers and curated.measurements.

To view the automated result, run:

python ui2.py curated.tif test.whiskers test.measurements --frame=2399

Step 6. Record identity errors for the trial.
---------------------------------------------

Record the following:

1.  The version number of the tracking software used.
2.  The session/trial name.
3.  The number of whiskers tracked.
4.  The number of frames. Do not count excluded intervals. Exclusions should be noted and a reason given.
5.  The number of frames with 1 mistake.
6.  ...
7.  The number of frames with N mistakes (I typically add these columns in a spreadsheet as I need them).
8.  The number of mistakes due to untraced whiskers.

*   No labels

Overview

Content Tools

*   Powered by [Atlassian Confluence](https://web.archive.org/web/20200812012723/http://www.atlassian.com/software/confluence) 6.13.4
*   Printed by Atlassian Confluence 6.13.4
*   [Report a bug](https://web.archive.org/web/20200812012723/https://support.atlassian.com/help/confluence)
*   [Atlassian News](https://web.archive.org/web/20200812012723/http://www.atlassian.com/about/connected.jsp?s_kwcid=Confluence-stayintouch)

[Atlassian](https://web.archive.org/web/20200812012723/http://www.atlassian.com/)

{"serverDuration": 61, "requestCorrelationId": "23dca6a964999f85"} AJS.BigPipe = AJS.BigPipe || {}; AJS.BigPipe.metrics = AJS.BigPipe.metrics || {}; AJS.BigPipe.metrics.pageEnd = typeof window.performance !== "undefined" && typeof window.performance.now === "function" ? Math.ceil(window.performance.now()) : 0; AJS.BigPipe.metrics.isBigPipeEnabled = 'false' === 'true';