aurorae: aurorae/*
	tar -cJf Utterly-Round-Aurorae.tar.xz aurorae/* --transform="s/aurorae\///"

desktoptheme: desktoptheme/*
	tar -cJf Utterly-Round-Desktop.tar.xz desktoptheme/* --transform="s/desktoptheme\///"

clean:
	rm *.tar.xz