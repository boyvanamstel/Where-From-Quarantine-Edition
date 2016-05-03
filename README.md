# Where From Quarantine Edition

When trying to determine the success of a AdWord/Facebook/Twitter campaign it might be useful to be able to track app usage based on the download page/link that caused the download.

This simple script uses OS X' QuarantineEventsV2 sqlite database to retrieve the URL where an app was downloaded from.

## Usage

1. Add an identifier to your download URL (e.g. `?campagaign=facebook_c18`).
1. Use the script to retrieve URL(s) for your app.
1. Attach the campaign to your app's analytics data.

You can now track app usage based on the page or campaign where/when the download occured.

## License

MIT, check `LICENSE`.
