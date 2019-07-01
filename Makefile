PYTHONS = 3.6 3.7

NGSOLVE_VERSION=v6.2.1905

.PHONY: pythons $(PYTHONS)

pythons: $(PYTHONS)

$(PYTHONS):
	docker build --build-arg PYVER=$@ \
		--build-arg NGSOLVE_VERSION=$(NGSOLVE_VERSION) \
		-t pymor/ngsolve:py$@_$(NGSOLVE_VERSION) .

push:
	docker push pymor/ngsolve

all: pythons
