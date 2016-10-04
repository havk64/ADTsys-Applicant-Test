# ADTsys applicant test

## Description  
The logic needed to update and persist the Webmotors API information has being
moved to a
***[Service Object](https://www.netguru.co/blog/service-objects-in-rails-will-help)***
in order to keep controllers and models clean and DRY following Ruby/Rails best
practices.  
To decrease the server/database workload and still keep in sync with Webmotors
API when the client makes a request(page load) the application sends just one
first request to check if the amount of items in its database is equal to the
items in the external API and updates it just if new items have been added.  
In addition, if the Webmotors API is not available for some reason the
application logs the connection failure but don't stop working and keep
serving pages using its previously persisted data.  
RSpec features and unit tests covering nearly every aspect of the application are available via rspec/rake commands:

        $ rake  

---------------
