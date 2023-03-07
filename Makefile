aurorae-light: aurorae-light/*
	tar -cJf Utterly-Round-Aurorae-Light.tar.xz aurorae-light/* --transform="s/aurorae-light\//Utterly-Round-Light\//"

aurorae-dark: aurorae-dark/*
	tar -cJf Utterly-Round-Aurorae-Dark.tar.xz aurorae-dark/* --transform="s/aurorae-dark\//Utterly-Round-Dark\//"

desktoptheme: desktoptheme/*
	tar -cJf Utterly-Round-Desktop.tar.xz desktoptheme/* --transform="s/desktoptheme\///"

clean:
	rm *.tar.xz