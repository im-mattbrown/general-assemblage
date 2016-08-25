# General Assemblage

General Assemblage is a social networking tool that connects General Assembly students across disciplines and locations to facilitate learning and creating collaboration. This is a full stack rails app served on Heroku Cloud Application Platform featuring the following technologies.

##### User Example Login Information
- email : student@ga.com
- password : assemble

### Technologies Used

* Ruby on Rails
* HTML/CSS
* Materialize, SCSS
* Heroku
* Postgresql

### Gems(planned as of now)
* Ransack
* Social Share Button
* Materialize Sass
* acts_as_follower

#### Wireframes / Mockups

![Alt text](http://i.imgur.com/O5jZ5dW.png "Wireframes")

#### ERD - Entity Relationship Diagram

![Alt text](http://i.imgur.com/Cxo9187.png "ERD")

### Collaborators to this project

![Alt text](http://i.imgur.com/mU2Z2VF.png)
#### Natalia Polichshuk
-https://github.com/natapoli90

![Alt text](http://i.imgur.com/rjuE0ML.png)
#### Paolo Sese
-https://github.com/jpaolosese

![Alt text](http://i.imgur.com/Wfo9WTH.png)
#### James de la Cruz
-https://github.com/jamesdlc

![Alt text](http://i.imgur.com/E2QItNW.png)
#### Matt Brown
-https://github.com/mattericbrown

##### User Story/ Sprints
#####Sprint 1: Profiles and Auth
User should be able to do the following:<br />
1. Navigate to root directory and see a splash page.  The splash page will contain the following:<br />
    * Website header<br />
    * Email and PW fields to Log In and a link to Sign Up<br />
    * A brief informative<br />
2. Click the Sign Up link to register<br />
3. If already registered, Log In to their account and be redirected to the Index Page (Article Feed)<br />
4. Also once logged in, they will see a site-wide navigation bar that contains the following:<br />
    * a link to Log Out<br />
    * a link to their Profile<br />
    * (will add more)<br />
5. On their profile page they will see the following:<br />
    * Their name<br />
    * The date they joined<br />
    * Their Cohort<br />
    * Their Current City<br />
    * Profile picture<br />
6. Update/edit their profile<br />
7. See the titles of all the articles they’ve posted<br />
8. Click on one of their articles and be redirected to a show page for that article<br />
9. Article show page will display Date & Time posted, Content, Replies (Comments) and author.<br />
#####Sprint 2: CRUD
User should be able to do the following:<br />
1. Create an Article, which will be posted to the Article Feed (Index Page).<br />
    * When creating an Article, user will choose from the following types and specify their needs in the Article body<br />
        1. Help wanted<br />
            * Request assistance to complete a task (e.g. WDI students working on a group project looking for a UX/UI student to help storyboard and wireframe)<br />
            * Having trouble with coding problems, design problems, etc.<br />
        2. General GA Information<br />
            * Letting GA audience know about interesting career related meet ups<br />
            * Upcoming GA events<br />
            * etc<br />
        3. Off Topic<br />
            * Fun facts<br />
            * Local restaurants they like to eat at<br />
            * Upcoming unrelated events<br />
            * etc<br />
2. View the “Web Dev project Help Wanted” Article show page (“/articles/1”) which will include:<br />
    * Article Title<br />
    * Article Type<br />
    * Article Content<br />
    * Article Author<br />
    * Campus Location<br />
    * Date/Time Article was posted<br />
3. View a list of Comments on the “Web Dev looking for UX/UI help“ Article page:<br />
    * Sorted  by newest first<br />
4. Use a  Comment Button pull up a new Comment form<br />
    * Add a new Comment for the “Help Wanted” Article page<br />
5. Click “Edit” on any individual Article ad be redirected to the edit form.<br />
6. Click “Delete” on Any individual Article<br />
    * After clicking “Delete”, see a pop-up that say asks the user to confirm Delete request<br />
    * If confirmed, delete the post.<br />
#####Sprint 3: Validations & Authorization
User should be able to do:<br />
1. View Article Show pages for “San Buena Taco Truck” and “WDI Mixer”<br />
2. Verify that a new Comment they create is successfully published on the correct Article Page<br />
A user is authorized to perform certain actions on General Assemblage according to the following rules:
1. A user must be logged in to created/update/destroy resources<br />
2. A user may only make edits to their own resources.<br />
A user won’t be able to save invalid data to the database, according to the following rules:
1. A user can’t sign up with an email address that isn’t unique<br />
2. An Article title must be between 8 and 200 char<br />
3. An Article’s content can’t be empty<br />
4. An Type must be chosen for an Article<br />
5. Article comments can’t be empty<br />
#####Sprint 4: Stretch Goals
1. See their profile photo next to their posts<br />
2. Receive a welcome email after registering<br />
3. Update their profile pictures by using a Picture Upload Gem<br />
4. Following<br />
5. Liking<br />
6. Add Comment<br />
