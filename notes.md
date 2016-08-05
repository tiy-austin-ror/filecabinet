Company: sells widgets
  Organize by widgets, departments, projects, employees

#Client Image
app that revolutionizes internal businesses to get their jobs done.
  Like:
    Dropbox but better
    Facebook but not

#Concept
Build an application that allows employees to upload files to create notes and upload images.

#Authenticiation/Authorization
Need employee authentication/authorization
  Employees can see nothing unless they are logged in.
  Logged in users can see everything
  Employees can update/delete their own files

#Categorize
Need to organize files and folders by category
  e.g., Promotions, bonuses, Q4, etc.

#Nouns
  Users
    Admin
    Employees

  Categories/Folders
    widgets, departments, projects, employees

  Notes
    Text
      body
      file-type
      tag

  Images

  Tags

#Searchability
Employees need to be able to search for files via file/image tags (folders don't have tags)
  search by tag
  search by name of file
  search by category

#File Itself
On the website, when the employee is typing in a new note:
  Note:
    body
    tag
    file-type: <dropdown> text/markdown
      When it is in markdown format, it is parsed like HTML

#Front-end, Generally
Need mobile-phone access (readability)


May need:
  admin needs to be able to log in to see the files that were created/uploaded (e.g, within the last month) and what type of file it is.
    standard XML, JSON, PDF, etc

Need a good name for the App



##Features
  Authentication -- Sign-up, Log-in, Sign-out
  Create Note
  Image upload
  Category Creation
  Tag Creation
  Note/Image Search via Tag/Category/File-Name/Photo-Name/User
  Category Traversal
  User Traversal
  Navigation -- Nav bar Dashboard/Home
  Design -- The site needs to have some design cohesion, fonts, colors, etc.
