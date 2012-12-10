iced -wcj \
	./public/js-dev/app.js \
	./assets/scripts/startup.iced \
	./assets/scripts/index.iced \
	&

stylus -w ./assets/styles -o ./public/css-dev &

trap 'kill $(jobs -p)' EXIT
cat
