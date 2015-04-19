### User Stories Generator

I find the process of writing user stories repetitive, so I thought I would create a simple program to automate the process for me a little.

#### Initial Specifications

- A user types `user_story` in the terminal and the program begins running
- The happy path workflow for the user is:

    Enter the name of the project:
    <input>
    User Story <number of user story>
    ----- * length of title above
    Who is the actor?
    <input>
    As a/an <input from above> what do you want?
    <input>
    As a/an <input from two above> I want to <input from above> so that...?
    <input>
    Here is the completed user story...
    <print user story>
    Save user story? (y/n)
    User story saved (or) User story was deleted
    Would you like to add another user story?
    <repeat the above> (or) <exit with saved file's location>

- Save file to <cwd/UserStoryTitle/user_stories.md> if it doesn't exist, otherwise, ask to overwrite. 
