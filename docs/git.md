# Git Style Guide


## Branch Names

* Name branches using the following format:

    your-name/what-you-are-doing

* Make sure everything is lower case and uses dashes where spaces would normally be.


## Issues

* Create lots of issues! Just make sure you tag them with the appropriate tag.
* @ mention people relevant in the description if you want them to see it.
* If you're referencing other issues in the issue that you are creating, tag them using the (#<number>) syntax.

    # Example:
    This issue depends on (#4) being finished, etc.


## Pull Requests

* When submitting a pull request, change the name of the Pull Request title.
* In the description of the pull request, make sure to include any issues that you complete. You must tag them separately:

    // Good
    Fix #1
    Fix #2

    // Bad / won't work
    Fix #1 and #2


## Libraries

* Never commit libraries. Always check your diff's size using `git stat` and `git status` to make sure you aren't committing anything that you didn't write.
* Generated files are different and you can for sure commit them.
