# README

Initial Rails command: `$ rails new --skip-action-mailbox --skip-action-text --skip-action-cable --skip-jbuilder --skip-kamal --devcontainer blog `

## Menu

The menu consists on the link to the Admin panel (only visible for authenticated? users) and a list of links to unlisted entries (pages).
At this moment there's no UI to manage menu items. Use the console:

`MenuItem.create! entry: Entry.find(X)`
