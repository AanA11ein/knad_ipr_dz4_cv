IMAGE = cv-builder

.PHONY: build clean

build:
	mkdir -p output
	docker build -t $(IMAGE) .
	docker run --rm \
		-v "$(PWD)/cv:/workspace/cv" \
		-v "$(PWD)/output:/workspace/output" \
		$(IMAGE)


clean:
	rm -rf output/*