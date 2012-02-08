# node.dystopia.io
## an online electronic book library

### what is the point of dystopia?
I want to both manage my collection of ebooks, and faciliate sharing those with
other people.

### what should dystopia be able to do?
* store the book in the database
* handle storing the book in multiple formats (epub->iPad,
mobi->kindle, pdf, etc)
* add ability to tag books to assist in searching
* store book metadata (author, year published, etc...)

possibly later on, I'd like to look into
* full-text search
* supporting an advisory checkin/checkout system (like an actual library)

### current architecture
* clojure codebase
* postgresql database
* reverse nginx proxy to force TLS
* hiccup templating

At this time, I'm less worried about the last two, as those are production level things. In fact, the codebase has an empty stylesheet now with just the comment
/* make this pretty *after* you build it */

### setup 
To setup a running instance of node.dystopia.io's interface.

	cd node.dystopia.io
	lein deps
	lein run

