all: libevlib.a ev_demo ev_httpd
OBJ := ev_loop.o ev_io.o ev_timer.o
CC := gcc
DEBUG := -g -Wall
LFLAG := -lrt

libevlib.a: $(OBJ)
	ar crv $@ $^

ev_httpd: ev_httpd.o $(OBJ)
	$(CC) $(DEBUG) $< $(OBJ) -o $@ $(LFLAG)
ev_demo: ev_demo.o $(OBJ)
	$(CC) $(DEBUG) $< $(OBJ) -o $@ $(LFLAG)

ev_httpd.o: ev_httpd.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<
ev_demo.o: ev_demo.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<

ev_loop.o: ev_loop.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<

ev_io.o: ev_io.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<
ev_timer.o: ev_timer.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<

clean:
	rm *.o libevlib.a ev_demo ev_httpd -f
