# README

This is a simple project directory app, which let's users create projects, add comments to them and change project 
status. A user is shown history of status changes.

## Application Dependencies
- Ruby `3.2.2`
- Rails `8.0.0.beta1`
- PostgreSQL `14+`

## Local Setup

- Run `bin/setup`
- Run `bin/dev` which will start web and css processes.
- Application will be available at `http://localhost:3000`

## Questions and assumptions related to project

#### Q: Will this feature need to expose an API for external access, or is it purely for internal use through the web interface?

**A:** No API is needed for now, just the web interface.

  
#### Q: Should users be notified (via email, for example) when new comments are added or the project status changes?
**A:** Notifications aren’t required for this task.

#### Q: Which user roles do we want to support?
**A:** For simplicity we want to support only 1 user role.

#### Q: Who should be able to change status of the project? Any user or just the creator?
**A:** Any user can change status. We are recording status updates for transparency.
  
#### Q: What are different statues of the project can be?
**A:** Created, In Progress, on hold, Completed.
  
#### Q: Should comments be simple text, or can they include attachments or formatted text?
**A:** For simplicity let's only consider text comments only.
  
#### Q: Can users edit or delete their comments after posting? If so, should the edit history be visible?
**A:** For transparency, let's not allow edits/delete for now.
   
   
#### Q: Can user edit/delete their status change?
**A:** No, we need to track each change.

#### Q: What happens if a project is deleted? Do we want to delete all comments and status updates as well?
**A:** Yes, delete all associated data with the project?
  
#### Q: Should the conversation history show the latest comments and status changes first, or in chronological order from the start of the project?
**A:** The most recent comments and status changes should be displayed at the top of the conversation history.
