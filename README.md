# Happy Hour Journal
_Happy Hour Journal_ (HHJ) is journaling app to track the who/what/when/where of your happy hour adventures.  

## Installation

1. Clone or download the repo: https://github.com/cyantis/happy_hour_journal

2. In your terminal, navigate to the app's directory and execute:

    $ bundle install

to install dependencies.

3. Launch a local server by executing:

    $ shotgun

and then visit `http://localhost:9393`in your browser to access the _HHJ_ site.

To end the server session, type `ctrl-c`.

## Usage

First time users will need to create (`Signup`) an account via a username, email, and password. Returning users log in via their username and password (`Login`).

Once logged in, a user's previous journal entries will be displayed. From this home page, the user can:

1. Create a new journal entry by clicking `Log a New Journal Entry`.
2. View a previous journal entry by clicking on the journal entry title (__Location, Date__).
3. End the session by clicking `Logout`.

By visiting a previous journal entry page, the user can `Edit` or `Delete` the entry, as well as return to the home page (`Home`), create a new entry (`Log a New Journal Entry`), or logout (`Logout`).

Whether creating or editing journal entry, users always have the opporunity to `Cancel` any additions/changes.

Clicking `Logout` from anywhere in the app ends the user's session.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cyantis/happy_hour_journal.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
