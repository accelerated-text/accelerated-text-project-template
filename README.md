This [Accelerated Text](github.com/tokenmill/accelerated-text) configuration template will help you to set up your text generation project. Clone this repository and use it as the basis for your work.

There are three configuration folders where project files are to be located:
* *config* - for the configuration files like [data enrichment](https://accelerated-text.readthedocs.io/en/latest/data-enrichment/) or [reader models](https://accelerated-text.readthedocs.io/en/latest/reader-models/);
* *dictionary* - to store the project domain [dictionaries](https://accelerated-text.readthedocs.io/en/latest/dictionary/);
* *document-plans* - for the project's [document plans](https://accelerated-text.readthedocs.io/en/latest/amr/);
* *data-files* - to store CSVs with the data (this is a convenience folder, your CSVs can be loaded via UI from any location).

The template also provides the Makefile with the commands:
* *run-acc-text* - this will run Accelerated Text, making it available on `8080` port;
* *clear-acc-text-db* - a tool to drop current document plans;
* *export-document-plans* - export the plans to document-pans folder

Note that Makefile is using `at-template` name for *docker-compose*. Please change it to the name of your project.
