# README

## Instagram Clone

This challenge involves using rails as a framework to create a clone of   Instagram. My inspiration for styling of the app was obviously instagram but this blog on it (https://medium.com/luanotes/build-instagram-by-ruby-on-rails-part-1-fef7837ee399) was instrumental in my styling of the website. 

**Users**

- I started off this challenge by setting up the users, this includes:
  - Signing up, logging in and out
    - This was all set up through the devise gem
  - Having a unique user profile
   - This involves a user having an avatar, username, bio and website, all of which can be edited 
- I included the 'font-awesome-rails' gem in this project which has allowed me to create icons to navigate the website
  - In my navigation bar I have a home icon, messages icon, explore icon, profile icon, sign in/out icon and a search bar


Edge cases/things to consider further on in the project:
- Visting a profile shows the username instead of the user id in the url
- Clicking on another user's photo will take you to their profile
- You will not be able to edit anyone else's profile

