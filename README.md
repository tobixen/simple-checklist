simple-checklist
================

This is intended to become "yet another personal organizer"-kind of tool.  "Todo-lists", "Calendars", "trackers", "checklists" and even email systems are often quite overlapping kind of things and there is constantly a risk of widening the scope too much.  The idea here is to handle checklists of small and trivial occurring tasks (or things) that eventually takes time (to find/pack) - i.e. shopping lists, vacation packing lists, morning routines, etc.

Focus:
* Checking off items on a list should be done with minimal effort.  I want the software to be useful and helpful, and not in the way, it should not feel like "extra beurocraziness".
* Simplicity and stick to scope - think of new features and extending it only after the software has been used for a while.

Data will be stored in a database backend.  I'm intending this to be sort of a "cloud service" where the items can be checked off from any device - but it should also work out well as a stand-alone application.

The priority now is:

* Make interfaces for presenting and checking off items on a checklist
   * Web interface
   * Client that loudably speaks out the checkpoints
   * Text client
* Interoperability - possibilities to import/export/sync with other systems.  I'm using google calendar, I've been using google tasks, and I've been flirting a bit with Astrid.  I'm intending to do research on caldev soon enough.
* Administrating interface - this is at the bottom of the list - as long as I'm the only user, I can get by through manual SQL, ad-hoc scripts for importing from text files etc.

Current status
--------------

Development just started - not at all ready for usage.

Database structure
------------------

See db_schema.sql

Notes: 
* checkpoint table
  * checkpoint.checkpoint_who and checkpoint.checklist is currently varchars - they may be changed to integer foreign keys at some point in the future.
  * flexible start time - by default, one would do the activities in order, one by one, work with them for as long as they take, and eventually skip checkpoints if there isn't sufficient time to do them - however, some things may have inflexible start time - i.e. I know that if it's 07:55 in the morning, I have to drop whatever I'm doing and prepare for leaving the house.
  * important - checkpoints that are flagged important shouldn't be skipped.  (I'm not sure if boolean is right - maybe it should be some kind of scale here?)
* checkpoint_log table
  * is_current - true if this is the newest entry.  Autoupdated.  When starting on a new run, one can set is_current=false for all. (TODO - should we rather have some kind of batch_id?)
  * status - this is a tri-state as for now, true = done, false = skipped, NULL = irrelevant.  Hmmm ... not sure if this should be a boolean, and not sure if it should be tri-state.

Personal motivation
-------------------

My life has always been a mess ... and unfortunately it has become only worse as I became a family man.  I've also always had a tendency to be late in bed and late up from bed - and my family to - so the mornings tended to be particularly awful.  Life in Norway is hard, particlarly in the winter time - due to the darkness it's extra hard to get up in the morning, kids needs quite a lot of clothes and outdoor equipment, and they cannot even afford food in the schools and kinder gardens, so we have to pack sandwiches in addition.  Mornings was a true mess.  I also came into quite a negative circle ... every morning I'd set the alarm clock a bit earlier to get through all the shit, but did it help?  No.  I'd get up, wake up my son, but since I knew he'd spend at least ten minutes getting up from the bed, I'd just snooze the alarmclock and get back to bed ... and since he knew I'd snooze my alarmclock and go back to bed there was no point for him to get up at all.  And as we all were very much in a hurry but ready to leave, my eldest son would cry out that he needed to see the toilet, lock the door and stay there for ten minutes.  Not only that we got late, but the children frequently ended up without important clothing (i.e. gloves) in the middle of the winter, without rain clothes in the rain, or without food ... and I ended up without keycard for my work, keys, cellphone ... always something.

At one point I decided to try to make a fixed morning routine with fixed times, and as a motivator for sticking to the plan there was some time just before departure that we could spend playing games, reading newspapers, catching up with email or just relax.  It actually made wonders!  Due to my nature things are still not perfect, but things have come quite far - the mornings are less stressful, we're cooperating better, we frequently get some spare time in the morning, and I'm even managing to get some house work done in the mornings.

Getting the children to bed, doing housework, packing for the vacation, etc has also been a problem, so I'm intending to make more lists.  I've already made evening routines.

In the beginning I started out manually typing up an reStructuredText file, converting it to pdf and make a printout.  After a while I ended up adding checkboxes to the list and printing out lots of them so I could use one each day.  But still, it's not without problems:

* Big maintenance burden keeping all the timestamps up-to-date if there are changes in the schedule.
* It's needed with both the paper and a pen to tick off all the checkboxes -  this has been a problem, especially since we're several persons involved, and several locations as well (sleeping rooms, bathroom, kitchen, hall, etc).
* The paper doesn't keep track of the time.

Hence the need for a next version ... digital and accessible from any terminal (i.e. laptop or cellphone) in the house.
