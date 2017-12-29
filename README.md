# Widgets-R-Us installer 

### Implementation details
My implementation uses the MEAN (MongoDB, Express.js, Angular 5.0, and Node.js) stack to provide full-stack functionality.
I initially was going to use Spring backend and Angular frontend like I use at work, but I haven't made anything interesting
with a NoSQL database yet, and I've recently been hearing a lot about the MEAN stack from friends. I was also interested
in working with javascript on both ends as I could reuse the model classes and validators, but in the end, it didn't
really work that way because the ORM I was using requires some work-arounds to get it on the frontend.

Although javascript is the current language to tout 'write once, run anywhere!' It's not the first to do so, and 
certainly isn't the last. Furthermore, it's not all it's cracked up to be. I'd much rather write kotlin and have 
that transpiled into javascript and java. (If you haven't heard of Kotlin yet, I highly encourage a glance at it.)

### Model
I used Mongoose (a MongoDB ORM) which enforces schemas, types, and some light validation for models. After I was
implementing some of the business logic/queries in the host, I quickly realized I didn't really enjoy NoSQL's quirks.
Most importantly, there are no joins. This isn't game-breaking, but it makes the code a little clunkier. We have to
query a document and then query another document after following a link and probably another one after that. I see
this becoming ill-maintainable very quickly. MongoDB also doesn't have transactions built-in. Which is something
my implementation lacks. There are ways to create transactions, but not without some serious time investment, which,
at such point, we should just move over to PostgreSQL or other. That said, it seems NoSQL is something an 
implementation should move to after we've found we need the throughput provided by it. I'm sure that's not always
true, and I need some more practice before claiming anything that general, but it seems like we sacrifice a lot of 
reliability for performance here. Perhaps that's the point.

### Host
The Host is running the Express.js framework on node which handles all the client's http requests. Pretty typical
REST api with a router which parses requests into arguments to pass into a service layer which validates the arguments,
and performs any necessary actions. The service layer will generally construct a model object out of the passed arguments
and use a DAO to manipulate the database. Other times, the Mongoose model objects encapsulate
a lot of the data access functionality so we don't need to make a whole DAO for each table or object.

### Client
The client is an Angular 5.0 app which is using the typical angular organization of having components which 
encapsulate the view and some javascript to go along with it which will use services to do any heavy lifting.
Our services handle app state, make http requests, and interact with the host.
