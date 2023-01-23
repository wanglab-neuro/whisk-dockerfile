[Whisker Tacking Special Files](https://web.archive.org/web/20210919235606/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tacking+Special+Files)
========================================================================================================================================================

<table class="aui"> <thead> <tr class="header"> <th class="search-result-title">Page Title</th> <th class="search-result-space">Space</th> <th class="search-result-date">Updated</th> </tr> </thead> </table> <p class="search-result-count">{0}</p> <tr class="search-result"> <td class="search-result-title"><a href="{1}" class="content-type-{2}"><span>{0}</span></a></td> <td class="search-result-space"><a class="space" href="/wiki/display/{4}/" title="{3}">{3}</a></td> <td class="search-result-date"><span class="date" title="{6}">{5}</span></td> </tr> [Skip to end of metadata](#page-metadata-end)

*   Created by Unknown User (clackn), last modified on [Sep 23, 2010](https://web.archive.org/web/20210919235606/https://wiki.janelia.org/wiki/pages/diffpagesbyversion.action?pageId=1182893&selectedPageVersions=5&selectedPageVersions=6 "Show changes")

[Go to start of metadata](#page-metadata-start)

These files should be present in the current working directory when  
using the [command line programs](https://web.archive.org/web/20210919235606/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracking+Command+Line+Reference) or the [GUI](https://web.archive.org/web/20210919235606/https://wiki.janelia.org/wiki/display/MyersLab/Whisker+Tracing+GUI).

The `default.parameters` file.
==============================

This file contains parameters and settings used for `trace` and the last step of whisker tracking, `reclassify`. It also controls error reporting for the other command line programs.

If found missing, this file will be automatically generated.

**warning**

The file itself contains some comments describing the parameters. However, the use of this file to change parameters has not been extensively tested.

The `.detectorbank` files.
==========================

These files contain the bank of filters used for processing images. They are automatically generated if found missing. Computing their contents typically requires a few tens of seconds.

The `.detectorbank` files should be deleted before adjusting the parameters in `default.parameters`.

*   No labels

Overview

Content Tools

*   Powered by [Atlassian Confluence](https://web.archive.org/web/20210919235606/http://www.atlassian.com/software/confluence) 6.13.4
*   Printed by Atlassian Confluence 6.13.4
*   [Report a bug](https://web.archive.org/web/20210919235606/https://support.atlassian.com/help/confluence)
*   [Atlassian News](https://web.archive.org/web/20210919235606/http://www.atlassian.com/about/connected.jsp?s_kwcid=Confluence-stayintouch)

[Atlassian](https://web.archive.org/web/20210919235606/http://www.atlassian.com/)

{"serverDuration": 53, "requestCorrelationId": "ba2238f7425f5041"} AJS.BigPipe = AJS.BigPipe || {}; AJS.BigPipe.metrics = AJS.BigPipe.metrics || {}; AJS.BigPipe.metrics.pageEnd = typeof window.performance !== "undefined" && typeof window.performance.now === "function" ? Math.ceil(window.performance.now()) : 0; AJS.BigPipe.metrics.isBigPipeEnabled = 'false' === 'true';