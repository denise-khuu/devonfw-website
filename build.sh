#Generate index.css
#Run output.sh
#!/bin/bash 

cd general-scripts
npm install
node renamer.js ../devonfw-guide/ Home .asciidoc
cd ..

#For tutorials
#Copy pom files to each tutorial folder 
chmod +x wiki-tutorials/scripts/copyPomFiles.sh
wiki-tutorials/scripts/copyPomFiles.sh

#For tutorials
#cd wiki-tutorials/scripts
#npm install
#cd ../../

#MUST ADD TO WORKFLOW
#- name: Compile sass for architectures
#uses: gha-utilities/sass-build@v0.4.2
#with:
#  source: wiki-tutorials/index.scss
#  destination: wiki-tutorials/index.css

cd asciidoctor-stylesheet
npm install
cd ../

mvn package 


#cd general-scripts
#npm install
#node remove-section-numbers.js ../target/asciidoc/
#cd ..

#asciidoctor -r ./asciidoctor-extensions/multipage-html5-converter.rb -b  multipage_html5 ./target/asciidoc/devonfw-guide/master.asciidoc -a toc=left -a toclevels=3 -a multipage-level=2 -D ./target/generated-docs/website/pages/docs
#cp -avr target/generated-docs/images/ target/generated-docs/website/pages/docs/

#cd general-scripts
#npm install
#node merger.js ../target/generated-docs/devonfw-guide/master.html ../target/generated-docs/website/pages/docs/ ../target/generated-docs/website/pages/docs/
#node merge-explore.js page-explore.html ../target/generated-docs/website/pages/explore/explore.html ../target/generated-docs/website/pages/explore/ ../target/generated-docs/website/pages/explore/ explore.html
#node video-to-iframe.js ../target/generated-docs/website/pages/resources/resources.html
#node rereferencer/rereference.js ../../target/asciidoc/devonfw-guide/ ../../target/generated-docs/website/pages/docs/
#node highlight-current.js ../target/generated-docs/website
#cd ..

chmod +x wiki-tutorials/scripts/createOutput.sh
wiki-tutorials/scripts/createOutput.sh

cp -avr wiki-tutorials/target/generated-docs/ target/generated-docs/website/pages/learning/

