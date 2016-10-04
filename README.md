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

### Tests
RSpec features and unit tests covering nearly every aspect of the application are available via rspec/rake commands:

        $ rake  


### Deployment  

This application can be deployed in a Vagrant instance and provisioned by Ansible playbooks using the code available in another repo.  

The virtual machine to be built is based on Ubuntu 14.04 LTS, brings a Ruby on Rails isolated test/development/production environment and deploy this application in an automated fashion.

Clone the specified repo and follow the instructions on its README file:

        $ git clone git@github.com:havk64/ADTsys-ansible-deploy.git


---------------
