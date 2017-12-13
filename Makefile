GCC=gcc
ARMGCC=arm-linux-gnueabi-gcc
ARMLIBS=`pkg-config gtk+-2.0 --cflags` -L/usr/arm-linux-gnueabi/lib/ -L/home/andrew/dev/kindleLib/ -lgtk-x11-2.0 -lgdk-x11-2.0 -lXrender -lXinerama -lXext -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lXdamage -lXfixes -latk-1.0 -lcairo -lpixman-1 -lpng12 -lxcb-shm -lxcb-render -lX11 -lxcb -lXau -lXdmcp -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lfontconfig -lfreetype -lz -lexpat -lgobject-2.0 -lffi -lgmodule-2.0 -lgthread-2.0 -lglib-2.0

keys = testKindleGtk

all:$(keys) $(objs)


testKindleGtk:testGtk.c
	$(ARMGCC) -o testKindleGtk testGtk.c $(ARMLIBS)
	
x86:
	gcc -o testGtk testGtk.c `pkg-config gtk+-2.0 --cflags --libs` 
osx:
	export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig && gcc -o testGtk testGtk.c `pkg-config gtk+-2.0 --cflags --libs` 
clean:
	rm $(keys) testGtk
	
	 
	
 	
