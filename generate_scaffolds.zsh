rails generate scaffold Project name:string start_date:date end_date:date description:text active:boolean

rails generate scaffold Tag name:string type:string active:boolean

rails generate scaffold Tag_Project project:references tag:references

rails generate scaffold Link url:string project:references active:boolean

rails generate scaffold Uploaded_File name:string url:string media_type:string upload_date:date active:boolean

rails generate scaffold File_Project file:references project:references

rails generate scaffold User authority:string password_digest:string
