all:
	../bin/mxmlc -static-link-runtime-shared-libraries Uploader.as
	cp Uploader.swf /data/web/ledui/www
