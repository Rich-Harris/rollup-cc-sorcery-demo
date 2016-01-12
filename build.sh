BIN=$PWD/node_modules/.bin

$BIN/rollup -i src/main.js -o dist/bundle.js -m -f iife

( cd dist
	$BIN/ccjs bundle.js --create_source_map=bundle.min.js.map --source_map_format=V3 > bundle.min.js
	echo "\n//# sourceMappingURL=bundle.min.js.map" >> bundle.min.js

	$BIN/sorcery -i bundle.min.js
)
