//function validateBootstrap() {
//    var form = document.querySelector('.needs-validation');
//    form.addEventListener('submit', function (event) {
//        if (form.checkValidity() === false) {
//            event.preventDefault();
//            event.stopPropagation();
//        }
//        form.classList.add('was-validated');
//    });
//}


// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();







function ValidateFileUploadIsPic() {
    let fuData = document.getElementById('fileChooser');
    let FileUploadPath = fuData.value;
    //To check if user upload any file
    if (FileUploadPath === '') {
        alert("Please upload an image.");

    } else {
        let Extension = FileUploadPath.substring(
                FileUploadPath.lastIndexOf('.') + 1).toLowerCase();
        //The file uploaded is an image
        if (Extension === "png" || Extension === "bmp"
                || Extension === "jpeg" || Extension === "jpg") {
            // To Display
            if (fuData.files && fuData.files[0]) {
                let reader = new FileReader();
                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                };
                reader.readAsDataURL(fuData.files[0]);
            }
        }
        //The file upload is NOT an image
        else {
            alert("Photo only allows file types of PNG, JPG, JPEG and BMP. ");
        }
    }
}