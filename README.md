### User Stories Generator

I find the process of writing user stories repetitive, so I thought I would create a simple program to automate the process for me a little.

#### Initial Specifications

- A user types `user_story` in the terminal and the program begins running
- The eventual happy path workflow for the user will be:

  ```
  Enter the name of the project:
  <user input>
  User Story <number of user story>
  --------------------------------- (should be length of title above)
  As a...
  <actor input>
  As a <actor input> I want to...
  <goal input>
  As a <goal input> I want to <reason input> so that...
  <reason input>
  Would you like to add another user story? (y/n)
  <repeat the above> (or) <exit with saved file's location>
  ```

- Save file to <cwd/UserStoryTitle/user_stories.md> if it doesn't exist, otherwise, ask to overwrite. 
