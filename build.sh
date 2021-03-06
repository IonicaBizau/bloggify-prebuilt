rm -rf node_modules
npm i

echo "Browserifying..."
./node_modules/.bin/browserify --node -s BloggifyServer lib/index.js -o dist/bloggify.js --exclude lien --exclude rucksack --exclude socket.io

echo "Babelfiying."
./node_modules/.bin/babel dist/bloggify.js -o dist/bloggify.js

echo "Uglifying..."
./node_modules/.bin/uglifyjs dist/bloggify.js -c -m -o dist/bloggify.js

./node_modules/.bin/ship-release bump
./node_modules/.bin/ship-release publish -d 'Rebuild.'
rm -rf node_modules
babel-it
