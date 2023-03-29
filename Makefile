aurorae-light: aurorae/light/translucent/*
	tar -cJf Utterly-Round-Aurorae-Light.tar.xz aurorae/light/translucent/* --transform="s/aurorae\/light\/translucent\//Utterly-Round-Light\//"

aurorae-light-solid: aurorae/light/solid/*
	tar -cJf Utterly-Round-Aurorae-Light-Solid.tar.xz aurorae/light/solid/* --transform="s/aurorae\/light\/solid\//Utterly-Round-Light-Solid\//"

aurorae-dark: aurorae/dark/translucent/*
	tar -cJf Utterly-Round-Aurorae-Dark.tar.xz aurorae/dark/translucent/* --transform="s/aurorae\/dark\/translucent\//Utterly-Round-Dark\//"

aurorae-dark-solid: aurorae/dark/solid/*
	tar -cJf Utterly-Round-Aurorae-Dark-Solid.tar.xz aurorae/dark/solid/* --transform="s/aurorae\/dark\/solid\//Utterly-Round-Dark-Solid\//"


desktoptheme: desktoptheme/translucent/*
	tar -cJf Utterly-Round-Desktop.tar.xz desktoptheme/translucent/* --transform="s/desktoptheme\/translucent\///"

desktoptheme-solid: desktoptheme/solid/*
	tar -cJf Utterly-Round-Desktop-Solid.tar.xz desktoptheme/solid/* --transform="s/desktoptheme\/solid\///"

clean:
	rm *.tar.xz