PYTHONS = 2.7 3.5 3.6 3.7-rc

.PHONY: pythons $(PYTHONS) ngsolve

pythons: $(PYTHONS)

ngsolve:
	docker build -t pymor/ngsolve:v6.2.1709 .

$(PYTHONS): 
	echo docker build -t pymor/ngsolve:py$@_v6.2.1709 .

push:
	docker push pymor/ngsolve

all: ngsolve
