#Generate index.css
#Run output.sh
#!/bin/bash 

cd general-scripts
npm install
node renamer.js ../devonfw-guide/ Home .asciidoc
cd ..

cd asciidoctor-stylesheet
npm install
cd ../

./scripts/createOutput.sh

mvn package 