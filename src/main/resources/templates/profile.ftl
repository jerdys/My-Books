<#ftl encoding='UTF-8'>
<#import "layout/application.ftl" as layout>
<@layout.layout title="${model.user.username}'s Profile Page">
</@layout.layout>

<head>
    <script>
        function sendFile(file) {
            var formData = new FormData();
            formData.append("file", file);
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/user/profile", true);
            xhr.send(formData);
        }

        $(function () {
            // We can attach the `fileselect` event to all file inputs on the page
            $(document).on('change', ':file', function () {
                var input = $(this),
                        numFiles = input.get(0).files ? input.get(0).files.length : 1,
                        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                input.trigger('fileselect', [numFiles, label]);
            });

            // We can watch for our custom `fileselect` event like this
            $(document).ready(function () {
                $(':file').on('fileselect', function (event, numFiles, label) {
                    var input = $(this).parents('.input-group').find(':text'),
                            log = numFiles > 1 ? numFiles + ' files selected' : label;

                    if (input.length) {
                        input.val(log);
                    } else {
                        if (log) alert(log);
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <ul class="nav nav-tabs nav-justified">
                <li class="active"><a data-toggle="tab" href="#reading">Currently Reading</a></li>
                <li><a data-toggle="tab" href="#going-to">Going to Read</a></li>
                <li><a data-toggle="tab" href="#stopped">Stopped Reading</a></li>
                <li><a data-toggle="tab" href="#read">Read</a></li>
            </ul>

            <div class="tab-content">
                <div id="reading" class="tab-pane fade in active">
                    <h3>Currently Reading</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                        labore et dolore magna aliqua.</p>
                </div>
                <div id="going-to" class="tab-pane fade">
                    <h3>Going to Read</h3>
                    <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat.</p>
                </div>
                <div id="stopped" class="tab-pane fade">
                    <h3>Stopped Reading</h3>
                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,
                        totam rem aperiam.</p>
                </div>
                <div id="read" class="tab-pane fade">
                    <h3>Read</h3>
                    <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt
                        explicabo.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <h1 class="text-center">
            ${model.user.username}
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal"
                        aria-label="Right Align">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                </button>
            </h1>
            <img src="https://i.imgur.com/I87f7fI.png" alt="profile image" class="img-thumbnail center-block">

        </div>
    </div>
</div>

<div id="modal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Change Profile Photo</h4>
            </div>
            <div class="modal-body">
                <h4>Select file to upload</h4>
                <div class="input-group">
                    <label class="input-group-btn">
                        <span class="btn btn-primary">
                            Browse&hellip; <input type="file" id="file" name="file" style="display: none;" multiple>
                        </span>
                    </label>
                    <input type="text" class="form-control" readonly>
                </div>
            </div>
            <div class="modal-footer">
                <label class="btn btn-primary">
                    <span class="glyphicon glyphicon-cloud-upload"></span>
                    Upload<input type="submit" id="submit" style="display: none;" onclick="sendFile(($('#file'))[0]['files'][0])" data-dismiss="modal">
                </label>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


<#--<img src="/static/img/user_default_profile_img.png" alt="profile image"/>-->
</body>
