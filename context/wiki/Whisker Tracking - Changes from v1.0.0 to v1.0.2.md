[Changes from v1.0.0 to v1.0.2](https://web.archive.org/web/20211020154224/https://wiki.janelia.org/wiki/display/MyersLab/Changes+from+v1.0.0+to+v1.0.2)
========================================================================================================================================================

<table class="aui"> <thead> <tr class="header"> <th class="search-result-title">Page Title</th> <th class="search-result-space">Space</th> <th class="search-result-date">Updated</th> </tr> </thead> </table> <p class="search-result-count">{0}</p> <tr class="search-result"> <td class="search-result-title"><a href="{1}" class="content-type-{2}"><span>{0}</span></a></td> <td class="search-result-space"><a class="space" href="/wiki/display/{4}/" title="{3}">{3}</a></td> <td class="search-result-date"><span class="date" title="{6}">{5}</span></td> </tr> [Skip to end of metadata](#page-metadata-end)

*   Created by Unknown User (clackn), last modified on [Dec 01, 2011](https://web.archive.org/web/20211020154224/https://wiki.janelia.org/wiki/pages/diffpagesbyversion.action?pageId=1182889&selectedPageVersions=1&selectedPageVersions=2 "Show changes")

[Go to start of metadata](#page-metadata-start)

*   improved FFMPEG support
    *   more video formats supported
    *   newer version of FFMPEG used on windows and 64-bit support added
*   changed how whiskers were ordered to better support videos imaging both sides  
    of a mouse's face.
*   added a special heuristic classifier for tracking single whiskers
*   added a special heuristic classifier adapted for tracking whiskers on both  
    sides of a mouse's face.
*   added Matlab mex binaries to support reading and writing of measurements  
    files, as well as reading of whiskers files.
*   seeding function used to initially find whiskers is now more efficient  
    and provides more accurate estimates of local whisker angle.
*   Improved the installer so python and Matlab functionality is better  
    supported.
*   added another measurements file format that remembers the face position.  
    The new format is now the default. A warning may be issued for files  
    that use the old format. Run the measurements\_convert command to update  
    your files, if necessary.

*   No labels

Overview

Content Tools

*   Powered by [Atlassian Confluence](https://web.archive.org/web/20211020154224/http://www.atlassian.com/software/confluence) 6.13.4
*   Printed by Atlassian Confluence 6.13.4
*   [Report a bug](https://web.archive.org/web/20211020154224/https://support.atlassian.com/help/confluence)
*   [Atlassian News](https://web.archive.org/web/20211020154224/http://www.atlassian.com/about/connected.jsp?s_kwcid=Confluence-stayintouch)

[Atlassian](https://web.archive.org/web/20211020154224/http://www.atlassian.com/)

{"serverDuration": 46, "requestCorrelationId": "5f82597958203aee"} AJS.BigPipe = AJS.BigPipe || {}; AJS.BigPipe.metrics = AJS.BigPipe.metrics || {}; AJS.BigPipe.metrics.pageEnd = typeof window.performance !== "undefined" && typeof window.performance.now === "function" ? Math.ceil(window.performance.now()) : 0; AJS.BigPipe.metrics.isBigPipeEnabled = 'false' === 'true';