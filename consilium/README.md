Consilium
===========

##Challenge:

Once you have established your webserver of choice, consider the
following endpoints for you and/or your team to implement.

The concept is merely to provide a RESTful JSON API to the wonderful
webmasters of the world to "make that paper."

In order to make "that paper" (I mean money), they will need to first,
register with your API and then send "traffic" to sell "widgets" which
they will get credit for.

You may persist this data with either an in-memory solution OR I have
provided tables for both MySQL and Postgres at the gist below

##API Resources

##URI
```
/register
```
*Description*
    Registers a new user and provides them with their webmaster id.
*Inputs*
 takes in an email address
 takes in a password
*Returns*
 the webmaster id

*URI*
```
/clicks
```
*Description*
    Webmasters are selling widgets and we want to track the impressions from their websites to those widgets. Keep track of how many unique (via cookie) visitors vs raw (returning visitors) this webmaster sent.
*Inputs*
    takes in a "webmaster id"
    takes in a "widget id"
*Returns*
 an HTTP "OK"
     an HTTP "ERROR"

*URI*
```
/credit
```
*Description*
    This credits the webmaster with a sale of the given widget.
*Inputs*
    takes in a "webmaster id"
    takes in a "widget id"
*Returns*
    an HTTP "OK"

*URI*
```
/stats
```
*Description*
    Lets a webmaster see how many sales they've made for a given day/widget/all widgets
*Restrictions*
    validates webmaster id / password via HTTP Basic Auth
*Inputs*
    takes in a "webmaster id"
    takes in optionally a "widget id" (otherwise assumes show all widgets)
    takes in optionally a date (otherwise assumes the current date)
*Returns*
    an HTTP "OK" with the webmaster's "stats" unique/raw click impressions and sales for the day

## Database Tables

https://gist.github.com/bradfordw/c7fa988dc420892d57c9

Contribute your solution by adding a directory below the ```consilium``` directory named {your twitter handle}+{chosen-webd-server} such as:

```
/consilium/bradfordw+gen_tcp/
```
