Social Media Integration for Prodigy Finance
=

This project contains a simple API for querying social media. The API is implimented in Rails, using the rails-api gem.

There are static pages contained in the `public` folder that demonstrate how the API could be integrated into the current Prodigy website and application workflow.

End-Points
==

The API only reached the proof-of-concept stage. As such the end-points which are implimented serves as examples of how the API could work.

A student record is created by POSTing to `students/details`. This is used to store social media credentials in a database.

Once a student has granted permissions to the Prodigy facebook app (that we created) the path 'students/friend_count' returns the number of friends that student has. This demonstrates the ability of the API to fetch facebook data.

