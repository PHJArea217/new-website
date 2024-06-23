# SECTION_NAME_IN_TITLE := yes
# TOP_NODE_UP_URL := ..
# export SECTION_NAME_IN_TITLE TOP_NODE_UP_URL
# requires: squashfs-tools texlive-extra-utils texinfo
website.squashfs: about/index.html
	mksquashfs about/ index.html $@ -comp lz4 -noappend -all-root -pf squashfs-extra-files.txt
about/index.html: about.src/about.texinfo
	SECTION_NAME_IN_TITLE=yes TOP_NODE_UP_URL=.. texi2any --html about.src/about.texinfo
