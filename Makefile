# Makefile

help:
	@echo "Available commands:"
	@echo "  run   - Run the application"

run:
	@if ! [ -z "$VIRTUAL_ENV" ]; then source .venv/bin/activate; fi; python src/main.py
