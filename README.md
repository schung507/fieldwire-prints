# Fieldwire-Prints

### Assumptions

 * User will upload floorplans of type jpeg
 * Project is created at once by uploading all the floorplans at once (cannot edit project)

### Libraries used

 * [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) for image management
 * [Delayed::Job](https://github.com/collectiveidea/delayed_job) to run background image processing
 
### Features

 * Users can create account
 * User can upload projects
 * User can delete projects
 * Image processing is asynchronous! Thumbnails in the project page show up later once processing is done
 * Images are uploaded to S3 in the form ( img.jpg, thumb_img.png, large_png_img.jpg)

### Features to add 

 * Users can delete account or edit it
 * User can edit projects
 * Drag and drop/better UI interface
