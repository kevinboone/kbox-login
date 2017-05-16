PREFIX=/usr
MYCFLAGS=-Wall -fpie -fpic $(CFLAGS)
LIBS=
MYLDFLAGS= -pie $(LDFLAGS)
VERSION=0.0.1

BINARY=login

all: $(BINARY)

login.o: login.c
	$(CC) $(MYCFLAGS) -s -o login.o -c -DPREFIX=\"$(PREFIX)\" -DVERSION=\"$(VERSION)\" $(INCLUDES) $(LIBS) login.c $(EXTRA_OBJS)

$(BINARY): login.o
	$(CC) $(MYLDFLAGS) -s -o login login.o $(LIBS) 

install: all
	mkdir -p $(DESTDIR)/bin/
	mkdir -p $(DESTDIR)/$(PREFIX)/bin/
	mkdir -p $(DESTDIR)/etc/
	cp -p scripts/* $(DESTDIR)/$(PREFIX)/bin/
	mkdir -p $(DESTDIR)/$(PREFIX)/share/man/man1/
	cp -p $(BINARY) $(DESTDIR)/$(PREFIX)/bin/
	cp -ad man1/* $(DESTDIR)/$(PREFIX)/share/man/man1/
	cp -p etc/* $(DESTDIR)/etc/
	(cd image; ln -sf /usr/bin/login bin/login)

clean:
	rm -rf $(BINARY) *.o 

