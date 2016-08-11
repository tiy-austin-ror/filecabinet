##Sign In
Add styling/outline to alert message: Please sign in to continue
When you search and don't sign in, it redirects but doesn't give flash alert

##Navbar
If logged in, show nav bar, else end
Sign out link cut off, fix columns
Take out search/sign in/sign up in nav bar when not signed in - add sign up link to sign in form


##Dashboard
Create photo button should align with photos, switch create note/photo buttons
Button bar for Create
Notes and Photos headers on columns with cards

Mobile design

##Users Dashboard
Cards for Users
Remove teams button

##User show
Objects into Cards (use partials)
Organize by notes/photos in 2 columns
User info in own box on left, Stats in own box on right (2 columns)

##Teams index
Card treatment
Button on right for new team
Team icon next to names

##Team show
fix turbolinks issue
Remove should be button
Style flash alert after removing user from team, put in a toast? #dev story

##Categories index (Matt is already working on)
Remove <ol> numbers
Icons instead of "note" "photo"
Remove Category: card title
Lighten border so not as harsh
Should only see categories you have permission to see
Counts what you can see instead of everything (low)

##Category show
Inside of category should look similar to index
category (8 items) need Icons
Photos/Notes need Icons
Divided into 2 columns
Remove labels, replace with Icons

##Wishlist:
New objects created with modals instead of new page

##Notes show
Remove Note: Note:
Put Create Permission form inside card
12 column all the way across
Flash notice "User already has permission" OR remove user as option from list
Create Permission button needs to be a link (not just text)
Remove permission no longer showing
Add method to remove author/existing users from dropdown
If have full access, see who has full access, if partial access, only see names

##Edit Note
Can't edit file ext or category?
Markdown type needs to show Markdown

##Tag show
Two columns for notes and photos tagged with that tag id
Name of tag on top of page with Tag

##Search bar
Doesn't work on show pages
No results found message
Search Results should have results in columns instead of ol?
Category search results does not show subcategories (low)
Change name to something more intuitive
When searching as a user, can see things don't have permission to see -
  use permissions to filter search results
