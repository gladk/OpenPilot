Description: <short summary of the patch>
 TODO: Put a short summary on the line above and replace this paragraph
 with a longer explanation of this change. Complete the meta-information
 with other relevant fields (see below for details). To make it easier, the
 information below has been extracted from the changelog. Adjust it or drop
 it.
 .
 openpilot (15.02-1) unstable; urgency=low
 .
   * Release from upstream Git (testing - unstable)
Author: Anton Gladky <gladk@debian.org>

---
The information above should follow the Patch Tagging Guidelines, please
checkout http://dep.debian.net/deps/dep3/ to learn about the format. Here
are templates for supplementary fields that you might want to add:

Origin: <vendor|upstream|other>, <url of original patch>
Bug: <url in upstream bugtracker>
Bug-Debian: https://bugs.debian.org/<bugnumber>
Bug-Ubuntu: https://launchpad.net/bugs/<bugnumber>
Forwarded: <no|not-needed|url proving that it has been forwarded>
Reviewed-By: <name and email of someone who approved the patch>
Last-Update: <YYYY-MM-DD>

Index: OpenPilot/Makefile
===================================================================
--- OpenPilot.orig/Makefile
+++ OpenPilot/Makefile
@@ -80,12 +80,7 @@ SANITIZE_DEPRECATED_VARS := USE_BOOTLOAD
 $(foreach var, $(SANITIZE_DEPRECATED_VARS), $(eval $(call SANITIZE_VAR,$(var),deprecated)))
 
 # Make sure this isn't being run as root unless installing (no whoami on Windows, but that is ok here)
-ifeq ($(shell whoami 2>/dev/null),root)
-    ifeq ($(filter install all_clean,$(MAKECMDGOALS)),)
-        $(error You should not be running this as root)
-    endif
-endif
-
+#
 # Decide on a verbosity level based on the V= parameter
 export AT := @
 ifndef V
Index: OpenPilot/flight/templates/firmware_info.c.template
===================================================================
--- OpenPilot.orig/flight/templates/firmware_info.c.template
+++ OpenPilot/flight/templates/firmware_info.c.template
@@ -48,8 +48,8 @@ const struct fw_version_info fw_version_
 const struct fw_version_info fw_version_blob __attribute__((used)) __attribute__((__section__(".fw_version_blob"))) = {
 #endif
     .magic              = { 'O','p','F','w' },
-    .commit_hash_prefix = 0x${HASH8},
-    .timestamp          = ${UNIXTIME},
+    .commit_hash_prefix = 0,
+    .timestamp          = 0,
     .board_type         = ${BOARD_TYPE},
     .board_revision     = ${BOARD_REVISION},
     .commit_tag_name    = "${FWTAG}",
Index: OpenPilot/ground/openpilotgcs/src/plugins/coreplugin/core.qrc
===================================================================
--- OpenPilot.orig/ground/openpilotgcs/src/plugins/coreplugin/core.qrc
+++ OpenPilot/ground/openpilotgcs/src/plugins/coreplugin/core.qrc
@@ -63,7 +63,6 @@
         <file>images/cpu.png</file>
         <file>qml/images/tab.png</file>
         <file>qml/AboutDialog.qml</file>
-        <file alias="qml/AuthorsModel.qml">../../../../../build/openpilotgcs-synthetics/AuthorsModel.qml</file>
         <file>images/opie_90x120.gif</file>
     </qresource>
 </RCC>
