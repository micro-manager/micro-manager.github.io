## Sources for the https://micro-manager.org website

Collaborators can edit the pages within the website.  If you would like
to contribute that way, please ask the maintainers for access as a collaborator.

To edit pages in this repository on your own system and preview the 
changes you make, you will need to fork this repository and clone 
to your local computer.  Make changes as you see fit, thenb use Jekyll
to generate the website and preview in your local browser.


## Install jekyll

The jekyll static site generator can be installed on Linux, MacOS and Windows.
To install a local version of jekyll follow the instructions for your
respective operating system [here](https://jekyllrb.com/docs/installation/).

## Fork the repository
It is not possible to modify the micro-manager wiki directly. Instead you create your own version (called a [fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo)). You can then ask authorized maintainers to incorporate your changes into the main micro-manager wiki using a [pull-request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests), also called PR.

## Clone the repository

Once jekyll has been installed,
[clone](https://docs.github.com/en/enterprise/2.13/user/articles/cloning-a-repository) the forked repository. Navigate to the cloned repository and run `bundle install` to install the specific ruby gems necessary to run jekyll and serve the site. Once installation is complete, it is a good idea to run `bundle update` (it is a good idea to `bundle update` every so often to stay up to date).

## Serve a local version of the site

Now that the both jekyll and the repository are installed on your local
machine, you can run the static site generator by navigating to your local site
directory within a terminal and running `bundle exec jekyll serve`. Wait for a
minute while the site generates, and then in your browser navigate to the
server address that has been output in your terminal, i.e.
[http://127.0.0.1:4000](http://127.0.0.1:4000). Changes you make to any file in
the directory will be detected by jekyll, regenerating the site to reflect the
new changes.

Alternatively, you can run `bundle exec jekyll serve --incremental` to initiate
the local server. This command will reduce the amount of time it takes for the
site to regenerate if you anticipate making many changes in quick succession.

## Create a new page in `_pages`

In the desired folder beneath `_pages`, create a new text
file&mdash;e.g. `touch _pages/plugins/my-awesome-plugin.md`.

{% include notice icon="info" content="Filenames should be lowercase, omit spaces, and use extension `.md`." %}

## Editing a page locally

We recommend using a
[text editor](https://hackernoon.com/5-best-text-editors-for-programmers-3f54ef51d5ae)
to add content and make changes to a page when working locally. A text editor
makes navigating between files, searching for text within your page, and making
multiple edits more efficient and provides a more user-friendly interface.

From here, the [front matter](/editing#front-matter) and
content of the new page can be populated with a text editor of your choosing.

* Images should be stored in `/path/to/micro-manager.github.io/media`.
  Non-image files, such as scripts, should be stored in
  `/path/to/micro-manager.github.io/media/files`.

* Regularly save your progress with commits. The process of commiting your
  changes pushes your edits to the main branch of the repository hosted on
  `GitHub`. The process of commiting is described below.

## Pushing, pulling, and commiting with Git

Once you are ready to publish your your new page you will need to add, commit,
and push your changes to the repository. These steps should looks something
like:

1. `git add path/to/your-page-name.md` This step stages your changes to be commited.
2. `git commit path/to/your-page-name.md` Note: you will not be prompted to enter a commit message. Our usership uses imperative tense, i.e. "Add new page xzy"
3. `git push` Your new page or edits will not be pushed to the main branch of the repository.
4. Create a pull request from your fork, see [this guide](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork)

[This guide](https://rogerdudler.github.io/git-guide/) provides further
explanations on the above steps, as well as how to keep your local repository
up-to-date with the remote with `git pull`. Furthermore, don't forget to keep your fork up-to-date with the main repository, see [this guide](https://gist.github.com/CristinaSolana/1885435).
