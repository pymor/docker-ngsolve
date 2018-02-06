PYTHONS = 3.5 3.6 3.7-rc

NGSOLVE_VERSION=v6.2.1709

.PHONY: pythons $(PYTHONS)

pythons: $(PYTHONS)

$(PYTHONS):
	docker build --build-arg PYVER=$@ \
		--build-arg NGSOLVE_VERSION=$(NGSOLVE_VERSION) \
		-t pymor/ngsolve:py$@_$(NGSOLVE_VERSION) .

push:
	docker push pymor/ngsolve

all: pythons
