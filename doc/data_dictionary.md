# Data Dictionary
---

### Projects
Projects are the main entity, describing something I have worked on and wish to showcase.

|Attribute|Type|Description|Example data|
|:---|:---|:---|:---|
|id|int|Primary key.|`1`|
|name|string|The name of the project.|"Portfolio Website"|
|start_date|date|The date the project started.|`2020-07-14`|
|end_date|date|The date the project ended. Must be on or after start_date. Has value NULL if the project is currently ongoing.|`2020-07-15`<br>`NULL`|
|short_description|string|A one-sentence description of the project to be shown on the project list pages.|"Ruby on Rails web application for showcasing things I've worked on."
|description|text|A lengthy description of the project.|"A web application built in Ruby on Rails for the purpose of showcasing things I've worked on. [more...]"|
|category|string|A broad category the project falls into. Projects will be only shown together with other projects in the same category.|"Software development"
|thumbnail|int|Foreign key. An Uploaded file that will be used as a background image on the project list pages. Must be an image.|5|
|priority|int|Used to determine the order of projects on the list pages.|10|
|active|boolean|Whether this project should be publicly displayed on the site.|`true`|

### Tags
Tags let me group projects by what kind of project they are and what skills I've used in them.

|Attribute|Type|Description|Example data|
|:---|:---|:---|:---|
|id|int|Primary key.|`1`|
|name|string|The name of the tag.|"Python"|
|category|string|A broad category to which the tag belongs. Tags will be grouped by category on the main tag list. Categories are plural when possible.|"Programming Languages"|
|active|boolean|Primary key.|`true`|

### Uploaded_Files
Uploaded files are various files pertaining to a project. They are linked on the project information page and will be downloaded when clicked.  

|Attribute|Type|Description|Example data|
|:---|:---|:---|:---|
|id|int|Primary key.|`1`|
|name|string|The name or a short description of the file.|"Data Dictionary"|
|media_type|string|A general category of file that this file belongs to. A full list of all valid media types is shown to the right. Case-sensitive.|"document", "image", "audio", "video", "executable", "archive", "other"|
|upload_date|date|The date the file was added to the application. Must be on or before the current date. Set automatically by the system.|`2020-07-14`|
|active|boolean|Whether this file should be publicly displayed on the site|`true`|
|cw_file|string|A file uploaded through CarrierWave to the app.|"data_dictionary.md"

### Links
Links are hyperlinks to external websites related to a project. This could include things like a Github repository, a Soundcloud playlist, an itch.io page, or some other website with published material related to the project.

|Attribute|Type|Description|Example data|
|:---|:---|:---|:---|
|id|int|Primary key.|`1`|
|name|string|The text displayed on the link.|"Github Repository"|
|url|string|The URL of the link.|"https://github.com/Skelothan/Octave"|
|project_id|int|Foreign key. The project this link belongs to.|`3`|
|active|boolean|Whether this link should be publicly displayed on the site|`true`|

### Tag_Projects
An associative entity between tags and projects.

|Attribute|Type|Description|Example data|
|:---|:---|:---|:---|
|id|int|Primary key.|`1`|
|project_id|int|Foreign key. The project to associate with the tag.|`3`|
|tag_id|int|Foreign key. The tag to associate with the project.|`4`|

### File_Projects
An associative entity between uploaded files and projects.  
I had originally named the uploaded file object "File", but that caused errors due to being a reserved word in Rails, hence the inconsistent name of this object.

|Attribute|Type|Description|Example data|
|:---|:---|:---|:---|
|id|int|Primary key.|`1`|
|project_id|int|Foreign key. The project to associate with the file.|`3`|
|file_id|int|Foreign key. The file to associate with the project.|`6`|

### Users
A person who can log in to the web application and gain additional permissions.  

|Attribute|Type|Description|Example data|
|:---|:---|:---|:---|
|id|int|Primary key.|`1`|
|authority|string|A string representing a level of control over the system. There is only one level, "webmaster", which grants full control.|"webmaster"|
|username|string|A string representing the name of a user.|"Skelothan"
|password_digest|string|A bcrypt hashed password, used to verify the identity of the person logging in.||
