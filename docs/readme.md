# Welcome to Blueprint's Ashby-Village app!

### Setup

* [Web applications setup](/docs/web.md)

### Style Guides

Our style guides are located [here](https://github.com/calblueprint/style-guides/tree/master/rails) and they cover how we keep a consistent style here at Blueprint.

### Commit Process

IMPORTANT: Make sure your git information is set. You can follow the guide [here](https://help.github.com/articles/setting-your-username-in-git/).

The general workflow is as follows:

1. Make sure your master branch is up-to-date.

    ```
    git checkout master
    git pull
    ```

2. Checkout a new branch off of master. Name it according to the [style guide](/docs/git.md).

    ```
    git checkout -b shimmy/new-feature
    ```

3. Implement your shiny new feature. Be sure to create GitHub issues before / during / after (preferably before, but during is okay. Only add after if it's something big) -- this ensures that the other engineers know what you're working on and building so that work is not duplicated.

4. Create a pull request. When you create the pull request, make sure to change the name of the pull request title. In the description, you should generally write a small 1-2 line description of what you completed. Then, on separate new lines, indicate which issues you closed with this pull request with the following syntax:

    ```
    Fix #104
    Fix #105
    ```

5. Push your code: `git push origin head`. Submit your pull request, another engineer will review your code and discuss with you on the pull request if any changes are necessary.

6. When merging in a pull request, the issues indicated in the description are automatically closed. If you are the one merging in the pull request, make sure to delete the branch! (you can do this on the pull request itself).

7. Rinse and repeat!

### Servers

`TODO(Shimmy)`
