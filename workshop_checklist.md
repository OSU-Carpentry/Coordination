# Pre-Workshop Checklist

## 2-3 Months Out

- [ ] Date, time, location: try to figure out AT LEAST a month in advance (two to three months preferable), touch base with certified instructors and book available room.

> * [Website for reserving room 206 in the library](http://okstate.libcal.com/booking/conference-rooms)
> * Other computer lab rooms can be reserved by emailing `gurooms@okstate.edu` (Registrar’s email in charge of classroom scheduling) or Garry Morgan directly at `garry.morgan@okstate.edu`
> * Math department rooms: email `angie.mcfarlin@okstate.edu`

- [ ] Follow instructions to setup workshop website: [Software Carpentry](https://github.com/swcarpentry/workshop-template), [Data Carpentry](https://github.com/datacarpentry/workshop-template).

> Make sure to use the YYYY-MM-DD-okstate naming convention throughout setup.

- [ ] Setup the Eventbrite Page using OSU Carpentry credentials. Update the workshop webpage with the event's unique ID.

> Change the Eventbrite frame in `index.md` to `280px` so that particpants don't have to scroll.

> [Copying past workshop templates](https://www.eventbrite.com/support/articles/en_US/How_To/how-to-copy-an-event-page?lg=en_US)
> **Make sure to change the following:**
> * Title of event
> * Event dates
> * Update event desctiption with correct dates
> * Tweak registration form if need be

- [ ] Setup [workshop etherpad](https://tiger.hpc.okstate.edu/sites/etherpad/).

- [ ] Work with Victor Baeza (victor.baeza@okstate.edu) to get a link set up on the digital badges calendar for graduate students.

- [ ] Setup times and locations of internal half-day workshops.

- [ ] Send out website link to instructors and have them decide which topics they want and which internal workshops they want to teach at.

- [ ] Fill out workshop request form: [Software Carpentry](https://amy.software-carpentry.org/forms/swc/request/), [Data Carpentry](https://amy.software-carpentry.org/forms/dc/request/). A Carpentry administrator will contact you and post your workshop on the corresponding Carpentry website. They will send you links to see the results of the pre/post-workshop surveys.

- [ ] Finalize list of helpers. Update website with names.

- [ ] Notify everybody who was waitlisted at the last workshop so they get a head-start on registering for this workshop.

- [ ] Promote event.
   * Put event on HPCC website
   * Add workshop to HPCC calendar
   * Add a plug for the workshop to the HPCC email newsletter
   * Email Kate Adams (kate@greatplains.net) at the Great Plains Network to have them promote it on their website.
   * OSU Research Communications (VPR newsletters and emails, Grad college Monday Memo, and VPR Website Content): Jeff Joiner (jeff.joiner@okstate.edu)
   * Get Library to promote on their calendar and internal listserv - Jason Henderson (jason.dean.henderson@okstate.edu) and Nicole Sump-Crethar (sumpcre@okstate.edu), or Cinthya Ippoliti (cinthya.ippoliti@okstate.edu)
   * Submit the workshop as an event to the [OSU calendar](http://calendar.okstate.edu/)
   * Add event to CADRE website
   * Promote on CADRE list serve
   * Update the bulletin board

## Leading Up to Workshop

- [ ] Schedule a meeting with instructors and helpers to review game plan for the workshop.

- [ ] Make sure arrangements have been made for coffee and donuts.

- [ ] Stock up on *red* and *green* sticky notes.

- [ ] Send out a reminder email a few days before the workshop to registered participants:
   * Reminder to fill out pre-workshop survey.
   * Reminder to install software ahead of time.
   
- [ ] Download "Attendee Summary" as a csv file from Eventbrite.

- [ ] Use `attendees.R` to clean up Eventbrite report

- [ ] Use `get_ws_names.sh` to cat the list of names.

- [ ] Create a clean copy of the Google Docs attendance form for each day and move it into the appropriate Google Docs folder on the Google Drive.

- [ ] Copy the list of names into the new Google Docs attendance forms.

- [ ] Send out reminder email to helpers and instructors.

## During Workshop

- [ ] Encourage those who have not already taken the pre-workshop survey to take it in the 30 minutes before beginning.

- [ ] Remind people about the etherpad and sticky notes.

- [ ] Before workshop ends, mention the post-workshop survey. Encourage people to take the survey before they leave.

- [ ] Mention ways to learn more: [Software Carpentry](https://software-carpentry.org/), [Data Carpentry](http://www.datacarpentry.org/), and the [OSU-Carpentry GitHub Organization](https://github.com/OSU-Carpentry).

## After the Workshop

- [ ] Download attendance response for each day as csv files from the Google Drive.

- [ ] Use `attendees.R` to make a clean report from Eventbrite.

- [ ] Use `take_attend.R` to incorporate attendance info into the cleaned report and get emails for follow up email.

- [ ] Send follow up email.

> Make sure to remove emails of people who did not attend.

- [ ] Put copies of final report and waiting list into the appropriate Google Drive folder.

- [ ] Add both attendees and waitlist to CADRE announce list.

> Every workshop folder on the Google drive should have the following: sticky note feedback (Google spreadsheet), attendance form for each day of workshop (Google form and associated Google spreadsheet), waitlist (CSV file), etherpad (Markdown file), final attendees report (CSV file).

- [ ] The Carpentry administrator will contact you and ask for:
   * attendance list
   * report on how the workshop went

- [ ] Instructors are encouraged to participate in a [post workshop discussion call](http://pad.software-carpentry.org/instructor-discussion).

- [ ] The instructors are encouraged to write a [blog post](https://github.com/swcarpentry/website#development) (optional). Could be done by all instructors together.

> A good resource for more information on [Software Carpentry Workshops](https://software-carpentry.org/workshops/operations/).
