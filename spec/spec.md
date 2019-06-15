1. Build an MVC Sinatra application.  
Happy Hour Journal (_HHJ_) is a Sinatra application that includes multiple models, views, and controllers.

2. Use ActiveRecord with Sinatra.  
All of _HHJ_'s data is stored in the `development.sqlite database`, which contains 3 tables (one for each model). The CRUD capabilities of this app are via ActiveRecord.

3. Use multiple models.  
_HHJ_ makes use of 3 models: `User`, `HappyHour`, and `Location`.

4. Use at least one has_many relationship on a User model and one belongs_to relationship on another model.  
A `User has_many HappyHours`, a `Location has_many HappyHours`, and a `HappyHour`--serving as a type of `JOIN` table--`belongs_to` both a `User` and a `Location`.

5. Must have user accounts - users must be able to sign up, sign in, and sign out.
Before a user can interact with _HHJ_, they must first create an account, which includes a `username`, `email`, and `password`.

6. Validate uniqueness of user login attribute (username or email).  
Users log into the app via their `username` and `password`. Utilizing the `Bcrypt` gem, a user's `password` is encrypted, and _HHJ_ uses the `authenticate` method to verify the uniqueness of the user and session.

7. Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.  
A user has full CRUD capabilities in regards to their happy hour journal entries.

8. Ensure that users can edit and delete only their own resources - not resources created by other users.  
CRUD capabilities are restricted to only those happy hour journal entries a user originally created. Due to the journal-like nature of this app, user's can only view their own happy hour journal entries.

9. Validate user input so bad data cannot be persisted to the database.  
Users must enter a `location` and `date`, at minimum. If these criteria aren't met, their journal is not logged, nor persisted to the database, and they are returned to the new journal entry form. In order to avoid duplicate locations (due to spelling/grammar/etc.), _HHJ_ offers a `datalist` dropdown menu that displays previous locations for easy selection when logging a repeat visit. The data is then controlled for `type` and `case` and makes use of ActiveRecord's `find_or_create_by` method.

10. BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)  
I installed Rack Flash and employ it to deliver confirmation messages throughout the site.
