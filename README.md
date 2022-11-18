This is a template for creating an [HTML GitBook style](https://bookdown.org/yihui/bookdown/html.html#gitbook-style) **[bookdown](https://github.com/rstudio/bookdown)** book, [hosted on GitHub Pages](https://bookdown.org/yihui/bookdown/github.html). It is based on the one created with *File, New Project..., New Directory, Book Project using bookdown* in RStudio. It assumes you know how to use git/GitHub and R Markdown, and have some familiarity with the **bookdown** package. If you don't, the package author Yihue Xie's RStudio webinar *[Introduction to Bookdown (R Package)](https://www.youtube.com/watch?v=dVqVscgwSpw)* provides an excellent introduction. In addition, check out [*bookdown: Authoring Books and Technical Documents with R Markdown*](https://bookdown.org/yihui/bookdown), also by Yihui Xie, both for the content and the format--it is itself a **bookdown** book.


## ABSOLUTE ESSENTIALS

*Follow these instructions and you will have a published bookdown book in less than five minutes. If you have any difficulties or have feedback of any kind, please file an issue.*

### Copy this template

- [ ] 1. Click the green "Use this template" button above.  DO NOT FORK THE REPO.  Choose a descriptive name for your repo based on your content. (Unlike when you fork a repo, you get to choose the name. If you change your mind before you do any work, delete your new repo and start over.)

### Set up GitHub Pages

- [ ] 1. On the home page of your repo, click Settings. Scroll down to the GitHub pages section and change **Source** to **master branch /docs folder**.  Above the **Source** line, a bar will appear with your book's URL. The bar will initially be blue and indicate that your book is *ready* to be published and will change to green once it is published. Copy the URL. (Note that sometimes there is a delay until your book actually appears at that URL. If it doesn't appear after a few minutes, make a change and commit it to trigger a GitHub Pages build.)

- [ ] 2. Click the gear button near "About" on the home page of the repo and paste your book URL into the **Website** field that appears on the right.

### Clone the repo

- [ ] 1. Clone your new repo with *File, New Project..., Version Control, Git* in RStudio.

### Edit some key files

- [ ] 1. In `index.Rmd`, change YOUR TITLE HERE to your title. 

- [ ] 2. In `index.Rmd`, change YOUR NAME HERE to your name.

- [ ] 3. In `_bookdown.yml`, change YOUR GITHUB USERNAME to your GitHub username in the two places it appears.

- [ ] 4. In `_bookdown.yml`, change YOUR GITHUB REPO to your GitHub repo name in the two places it appears.

(Note that 3. and 4. provide links to the `.Rmd` files of your project for editing and viewing. If you move your `.Rmd` files you will need to update these file paths. Once your book is rendered, test that the edit (pen) and view (eye) buttons work.)

- [ ] 5. In `_output.yml`, change YOUR SHORT TITLE to a shortened version of your title. (Leave the "after:" line indicating that the book was published with bookdown as is.)

### Render the book

- [ ] 1. Install **bookdown** with `install.packages("bookdown")`. If you already have it, update to the [latest version](https://CRAN.R-project.org/package=bookdown).

- [ ] 2. Render locally with `bookdown::render_book("index.Rmd")`.

- [ ] 3. Use `browseURL("docs/index.html")` to view your book locally (or just open `index.html` in a browser).

- [ ] 4. If it looks good, commit and push all changed files to GitHub. 

(You will need to repeat steps 2 and 4 every time you wish to update the book online.)

### Edit README

Once you've completed these steps, delete the content of this **README** and add a short description of your project with a link to the book URL. It would be appreciated if you add the following to the end:

*This repo was initially generated from a bookdown template available here: https://github.com/jtr13/bookdown-template.*

(And starring the repo would be nice too so I can see if this is getting used or not!)

### Demo Video

A demo video showing how to create a **bookdown book** following these instructions: http://bit.ly/fiveminutebookdown

### Additional features

Please consult the official guide to **bookdown**: https://bookdown.org/yihui/bookdown

