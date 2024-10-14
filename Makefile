CFLAGS=-g -Wall -Wextra -pedantic
SRCDIR=src

all: $(SRCDIR)/main.o  $(SRCDIR)/liblogger.so
	$(CXX) $(CFLAGS) $(SRCDIR)/main.o -ldl -L$(SRCDIR)/ -llogger -o startcpp.exe

%.o: %.cpp
	$(CXX) $(CFLAGS) -c $^ -o $@

$(SRCDIR)/liblogger.so:
	$(CXX) $(CFLAGS) -shared -fPIC $(SRCDIR)/liblogger.cpp -o $@

clean:
	rm -rf startcpp.exe
	rm -rf $(SRCDIR)/*.o $(SRCDIR)/*.so.* $(SRCDIR)/*.a $(SRCDIR)/*.so
