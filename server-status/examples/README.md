# Examples for superbuddy/server-status

All the directories in this folder refer to a script in `$testdir`.
The example files should provide enough info to understand the concept.

Good to know;
+ File names are just for illustration, they do nothing
+ Directory names refer to script names
+ The first line is the string to match
+ all lines starting with `#` are comment lines (first line cannot be a comment)
+ If the first line starts with an `!`, the check is inversed (e.g. `!HTTP/1.0`)