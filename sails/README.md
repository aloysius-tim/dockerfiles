# Sails.js

Just sails, useful for chaining.


# Usage

Run as a normal docker and mount your project to `/project`.

Use the following environment variable to enable debugging:
`APP_DEBUG=true|false`


If `APP_DEBUG` is enabled; `sails lift` will be run.
If not; `forever start /project/app.js --prod` will be run.