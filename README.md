Goal: To clone a social media platform
Chosen: X or formerly twitter

Problem encountered in previous projects of this section:
1. Rails UJS Not Working with Importmaps
Symptoms:
data-method="delete" or data-remote="true" on links or forms doesn’t work.
Console errors:
Uncaught ReferenceError: Rails is not defined
Uncaught TypeError: Rails is undefined
Fix: switch to JS bundling with esbuild
2. Issues with database postgre
    - wasn't install or just wasn't being seen as installed

APP START---

1. Created folder and repository
    - git init, git add , git commit
2. Set up database
3. Setting up JS bundling: too confusing deleted entire folder and started again
    - following TOP steps to setting up the js esbuild import
    - testing to check that it is all working
--starting again...
    -Reason: missed setting up the JS bundling correctly.
    -testing: i was testing if i had installed it properly by checking the default rails welcome page, this welcome page does not use the app's application.html.erb layout and therefore i couldn't check if my stimulus was loading at al. 
        - solution generated a simple controller and view and i was finally able to see that it was all working. 
        - note: the welcome page is not connected to any part of my app's views or layouts. 
4. setting up and checking that the database = postgresql is set up and ready
    - ready
5. set up gem 'devise'
    - generate devise views: custome login/signup forms
6. Now we generate model: user, post, comment, like, save, repost
    - devise User + user controller
        - generate basic index action and view
        - genereate a return to the home page after sign up:
            def after_sign_up(resource)
             root_path
            end
    - ERROR: log out devise sign out route expects DELETE. 
        - cause i do have delete but it seems i forgot to add yarn add @rails/ujs